/// Health / fitness tools for FlutterClaw agents.
///
/// Read health data from Apple HealthKit (iOS) and Google Health Connect (Android).
library;

import 'dart:convert';

import 'package:health/health.dart';
import 'package:logging/logging.dart';
import 'registry.dart';

final _log = Logger('flutterclaw.health_tools');

/// All sleep-related type keys. When any sleep type is requested we query
/// all of them, because iOS 16+ devices store data as granular stages
/// (deep/light/REM) while older devices use the legacy asleep/in_bed types.
const _allSleepKeys = [
  'sleep_in_bed',
  'sleep_asleep',
  'sleep_awake',
  'sleep_deep',
  'sleep_light',
  'sleep_rem',
];

const _typeMap = <String, HealthDataType>{
  'steps': HealthDataType.STEPS,
  'heart_rate': HealthDataType.HEART_RATE,
  'calories': HealthDataType.ACTIVE_ENERGY_BURNED,
  'sleep_in_bed': HealthDataType.SLEEP_IN_BED,
  'sleep_asleep': HealthDataType.SLEEP_ASLEEP,
  'sleep_awake': HealthDataType.SLEEP_AWAKE,
  'sleep_deep': HealthDataType.SLEEP_DEEP,
  'sleep_light': HealthDataType.SLEEP_LIGHT,
  'sleep_rem': HealthDataType.SLEEP_REM,
  // SLEEP_SESSION is Android-only (not in HealthKit's dataTypesDict on iOS).
  'blood_oxygen': HealthDataType.BLOOD_OXYGEN,
  'weight': HealthDataType.WEIGHT,
  'distance_walking_running': HealthDataType.DISTANCE_WALKING_RUNNING,
  'exercise_time': HealthDataType.EXERCISE_TIME,
};

/// Check health data permissions and available types.
class HealthStatusTool extends Tool {
  @override
  String get name => 'health_status';

  @override
  String get description =>
      'Check what health data types are available and have permissions. '
      'Use this to diagnose why certain health data might not be showing up. '
      'Returns information about permissions and available data types.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {},
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    try {
      final health = Health();
      await health.configure();

      _log.info('Checking permissions for ${_typeMap.length} health types');

      final status = StringBuffer();
      status.writeln('Health Data Status:\n');

      // Request authorization for ALL types in a single call to avoid
      // presenting multiple HealthKit permission sheets on iOS.
      // Explicitly request READ-only — the default (READ_WRITE) can silently
      // fail for category types like sleep on iOS.
      final allTypes = _typeMap.values.toList();
      final supported = <String>[];
      final unsupported = <String>[];

      try {
        await health.requestAuthorization(
          allTypes,
          permissions: allTypes.map((_) => HealthDataAccess.READ).toList(),
        );
      } catch (e) {
        _log.warning('Batch authorization failed: $e');
      }

      // Check which types are actually usable by attempting a tiny read.
      for (final entry in _typeMap.entries) {
        try {
          final now = DateTime.now();
          await health.getHealthDataFromTypes(
            types: [entry.value],
            startTime: now.subtract(const Duration(seconds: 1)),
            endTime: now,
          );
          supported.add(entry.key);
        } catch (e) {
          _log.warning('${entry.key}: not supported on this platform — $e');
          unsupported.add(entry.key);
        }
      }

      if (supported.isNotEmpty) {
        status.writeln('Authorization: Granted\n');
        status.writeln('Available data types:');
        for (final key in supported) {
          status.writeln('  • $key → ${_typeMap[key]!.name}');
        }
        if (unsupported.isNotEmpty) {
          status.writeln('\nUnsupported/denied types on this device:');
          for (final key in unsupported) {
            status.writeln('  • $key');
          }
        }
        status.writeln('\nTo query data, use get_health_data with:');
        status.writeln('  types: [${supported.take(3).map((k) => '"$k"').join(", ")}, ...]');
        status.writeln('  start_date: "YYYY-MM-DD"');
        status.writeln('  end_date: "YYYY-MM-DD"');
      } else {
        status.writeln('Health authorization denied for all types.');
        status.writeln('Please grant access in device Settings.');
      }

      return ToolResult.success(status.toString());
    } catch (e, stackTrace) {
      _log.severe('Health status check error: $e', e, stackTrace);
      return ToolResult.error('Health status check error: $e');
    }
  }
}

/// Reads health and fitness data from HealthKit / Health Connect.
class GetHealthDataTool extends Tool {
  @override
  String get name => 'get_health_data';

  @override
  String get description =>
      'Read health and fitness data from Apple HealthKit (iOS) or '
      'Google Health Connect (Android). '
      'Supported types: steps, heart_rate, calories, sleep_in_bed, '
      'sleep_asleep, sleep_awake, sleep_deep, sleep_light, sleep_rem, '
      'blood_oxygen, weight, distance_walking_running, exercise_time. '
      'Returns an array of data points with value, unit, and timestamp.\n\n'
      'IMPORTANT: Use focused, specific queries to avoid overwhelming data:\n'
      '- Request ONE category at a time (e.g., only sleep data, only activity data)\n'
      '- Use SHORT date ranges (1-7 days recommended, max 30 days)\n'
      '- For trends over time, query weekly summaries instead of all daily data\n'
      '- Example good query: "steps for last 7 days" (one type, one week)\n'
      '- Example bad query: "all health data for last 3 months" (too broad)\n\n'
      'If user asks for broad data, break it into multiple specific queries.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'types': {
            'type': 'array',
            'items': {
              'type': 'string',
              'enum': [
                'steps',
                'heart_rate',
                'calories',
                'sleep_in_bed',
                'sleep_asleep',
                'sleep_awake',
                'sleep_deep',
                'sleep_light',
                'sleep_rem',
                'blood_oxygen',
                'weight',
                'distance_walking_running',
                'exercise_time',
              ],
            },
            'description':
                'List of health data types to retrieve. '
                'BEST PRACTICE: Request only 1-2 related types per query '
                '(e.g., [steps, calories] for activity, or [sleep_in_bed, sleep_asleep] for sleep). '
                'Avoid requesting all types at once.',
          },
          'start_date': {
            'type': 'string',
            'description':
                'Start of the period (ISO 8601), e.g. "2025-03-07". '
                'BEST PRACTICE: Use short ranges (1-7 days) for detailed data. '
                'For longer trends, make multiple weekly queries.',
          },
          'end_date': {
            'type': 'string',
            'description':
                'End of the period (ISO 8601), e.g. "2025-03-14". '
                'BEST PRACTICE: Keep date range under 30 days to avoid excessive data.',
          },
          'max_results': {
            'type': 'integer',
            'description':
                'Maximum number of data points to return (default: 1000). '
                'Use this to limit large result sets.',
          },
        },
        'required': ['types', 'start_date', 'end_date'],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final rawTypes = (args['types'] as List?)?.cast<String>() ?? [];
    final startStr = (args['start_date'] as String?)?.trim() ?? '';
    final endStr = (args['end_date'] as String?)?.trim() ?? '';
    final maxResults = (args['max_results'] as int?) ?? 1000;

    if (rawTypes.isEmpty) return ToolResult.error('types must not be empty');
    if (startStr.isEmpty) return ToolResult.error('start_date is required');
    if (endStr.isEmpty) return ToolResult.error('end_date is required');

    final startDate = DateTime.tryParse(startStr);
    final endDate = DateTime.tryParse(endStr);
    if (startDate == null) return ToolResult.error('Invalid start_date format');
    if (endDate == null) return ToolResult.error('Invalid end_date format');

    // Auto-expand: if any sleep type is requested, include ALL sleep subtypes.
    // iOS 16+ stores granular stages (deep/light/REM) while older devices use
    // legacy types (asleep/in_bed). Query all to guarantee we find data.
    var expandedTypes = rawTypes.toList();
    if (rawTypes.any((t) => _allSleepKeys.contains(t))) {
      final before = expandedTypes.length;
      for (final sk in _allSleepKeys) {
        if (!expandedTypes.contains(sk)) expandedTypes.add(sk);
      }
      if (expandedTypes.length > before) {
        _log.info('Auto-expanded sleep types: $rawTypes → $expandedTypes');
      }
    }

    final types = expandedTypes
        .map((t) => _typeMap[t])
        .whereType<HealthDataType>()
        .toList();

    if (types.isEmpty) {
      return ToolResult.error(
        'No valid health types specified. '
        'Valid values: ${_typeMap.keys.join(', ')}',
      );
    }

    try {
      final dateRangeDays = endDate.difference(startDate).inDays;
      _log.info(
        'get_health_data: types=${expandedTypes.join(", ")}, '
        'range=$startStr to $endStr ($dateRangeDays days), maxResults=$maxResults',
      );

      // Estimate expected data points
      final estimatedPoints = _estimateDataPoints(expandedTypes, dateRangeDays);
      _log.info('Estimated data points: $estimatedPoints');

      // If estimate is way over budget, warn and suggest alternatives
      if (estimatedPoints > maxResults * 3) {
        _log.warning(
          'Query likely to return excessive data: estimated $estimatedPoints points '
          'vs maxResults $maxResults',
        );
        return ToolResult.error(
          'Query too broad! Estimated $estimatedPoints data points.\n\n'
          'This will likely:\n'
          '1. Take a long time to fetch\n'
          '2. Exceed the $maxResults limit\n'
          '3. Overwhelm the context\n\n'
          'Suggestions:\n'
          '• Use shorter date range (currently $dateRangeDays days)\n'
          '• Query one type at a time\n'
          '• For high-frequency data (heart_rate, steps), use max 7 days\n'
          '• For low-frequency data (weight, sleep), use max 30 days',
        );
      }

      final health = Health();
      await health.configure();

      _log.info('Fetching data per-type for ${types.length} types: ${types.map((t) => t.name).join(", ")}');

      // Request authorization for all types in a single call to avoid
      // presenting multiple HealthKit permission sheets on iOS.
      // Explicitly request READ-only — the default (READ_WRITE) can silently
      // fail for category types like sleep on iOS.
      final authorized = await health.requestAuthorization(
        types,
        permissions: types.map((_) => HealthDataAccess.READ).toList(),
      );
      _log.info('requestAuthorization returned: $authorized');

      if (!authorized) {
        _log.warning('Health authorization denied');
        return ToolResult.error(
          'Health data access denied. Please grant permission in Settings > Privacy & Security > Health.',
        );
      }

      // Diagnostic: check permissions status for each type
      for (final type in types) {
        try {
          final has = await health.hasPermissions([type],
              permissions: [HealthDataAccess.READ]);
          _log.info('hasPermissions(${type.name}) = $has');
        } catch (e) {
          _log.warning('hasPermissions(${type.name}) threw: $e');
        }
      }

      // Diagnostic: try reading steps to verify HealthKit is working at all
      try {
        final now = DateTime.now();
        final stepsData = await health.getHealthDataFromTypes(
          types: [HealthDataType.STEPS],
          startTime: now.subtract(const Duration(days: 1)),
          endTime: now,
        );
        _log.info('DIAGNOSTIC: steps last 24h = ${stepsData.length} points');
      } catch (e) {
        _log.warning('DIAGNOSTIC: steps probe failed: $e');
      }

      // Smart fetch: query each type separately with budget.
      // Per-type try-catch so one unsupported type doesn't crash the request.
      final allData = <HealthDataPoint>[];
      final skippedTypes = <String>[];
      final perTypeBudget = maxResults ~/ types.length;

      for (final type in types) {
        final typeKey = _typeMap.entries
            .firstWhere((e) => e.value == type, orElse: () => MapEntry('unknown', type))
            .key;

        _log.info('Fetching $typeKey with budget $perTypeBudget...');

        try {
          final typeData = await health.getHealthDataFromTypes(
            types: [type],
            startTime: startDate,
            endTime: endDate,
          );

          _log.info('$typeKey: fetched ${typeData.length} raw points');

          // Apply per-type budget
          if (typeData.length > perTypeBudget) {
            _log.warning('$typeKey: truncating ${typeData.length} to $perTypeBudget');
            final sampled = _sampleData(typeData, perTypeBudget);
            allData.addAll(sampled);
            _log.info('$typeKey: sampled down to ${sampled.length} points');
          } else {
            allData.addAll(typeData);
          }
        } catch (e) {
          _log.warning('$typeKey: failed to fetch — $e. Skipping.');
          skippedTypes.add(typeKey);
        }
      }

      _log.info('Total data points fetched: ${allData.length}');

      // Log breakdown by type
      final byType = <String, int>{};
      for (final point in allData) {
        final typeName = point.type.name;
        byType[typeName] = (byType[typeName] ?? 0) + 1;
      }
      _log.info('Data points by type: $byType');

      final deduplicated = Health().removeDuplicates(allData);
      _log.info('After deduplication: ${deduplicated.length} points');

      final result = deduplicated.map((d) => {
            'type': d.type.name,
            'value': d.value.toString(),
            'unit': d.unit.name,
            'date_from': d.dateFrom.toIso8601String(),
            'date_to': d.dateTo.toIso8601String(),
            'source': d.sourceName,
          }).toList();

      _log.info('Mapped to result format: ${result.length} points');

      // Log sample of what we're returning
      if (result.isNotEmpty) {
        final sample = result.take(3).map((r) => '${r['type']}:${r['value']}').join(', ');
        _log.info('Sample data: $sample');
      }

      // Truncate if exceeds max_results
      if (result.length > maxResults) {
        _log.warning('Truncating ${result.length} results to $maxResults');
        final truncated = result.sublist(0, maxResults);
        final dateRangeDays = endDate.difference(startDate).inDays;

        final summary = 'Found ${result.length} data points from '
            '${startDate.toIso8601String()} to ${endDate.toIso8601String()} '
            '($dateRangeDays days). Showing first $maxResults results.\n\n'
            'This is a lot of data! To get more focused results:\n'
            '1. Query ONE data type at a time (e.g., only "steps" or only "sleep_asleep")\n'
            '2. Use shorter date ranges (1-7 days instead of $dateRangeDays days)\n'
            '3. For trends, query weekly summaries instead of all raw data\n'
            '4. Break long periods into multiple specific queries\n\n'
            'Current query returned ${rawTypes.length} types × $dateRangeDays days = ${result.length} data points.\n\n';

        return ToolResult.success(summary + jsonEncode(truncated));
      }

      if (result.isEmpty) {
        _log.warning(
          'No data found for types ${expandedTypes.join(", ")} '
          'from $startStr to $endStr.',
        );
        final msg = StringBuffer(
          'No health data found for the requested period and types.\n\n',
        );
        if (skippedTypes.isNotEmpty) {
          msg.writeln('Skipped types (unsupported or denied): ${skippedTypes.join(", ")}\n');
        }
        msg.writeln('IMPORTANT — On iOS, the most common cause is that health '
            'permissions are denied or were never granted. iOS does NOT show '
            'an error when permissions are denied — queries silently return '
            'empty results.\n');
        msg.writeln('Ask the user to check:');
        msg.writeln('1. Open Settings → Privacy & Security → Health → FlutterClaw');
        msg.writeln('2. Make sure the relevant categories (e.g. Sleep) are toggled ON');
        msg.writeln('3. If FlutterClaw is not listed, reopen the app and try again '
            'so the permission prompt appears\n');
        msg.writeln('Other possible reasons:');
        msg.writeln('• No data recorded for this period');
        msg.writeln('• Sleep tracking device not synced to Apple Health');
        return ToolResult.success(msg.toString());
      }

      _log.info('Returning ${result.length} health data points');
      if (skippedTypes.isNotEmpty) {
        final note = 'Note: Skipped types (unsupported or denied): '
            '${skippedTypes.join(", ")}\n\n';
        return ToolResult.success(note + jsonEncode(result));
      }
      return ToolResult.success(jsonEncode(result));
    } catch (e, stackTrace) {
      _log.severe('Health data error: $e', e, stackTrace);
      return ToolResult.error('Health data error: $e');
    }
  }

  /// Estimate how many data points a query will return.
  ///
  /// Returns rough estimate based on data type frequency:
  /// - High frequency (heart_rate, blood_oxygen): ~1440 points/day
  /// - Medium frequency (steps, calories, distance): ~500 points/day
  /// - Low frequency (sleep types, exercise): ~10 points/day
  /// - Very low frequency (weight): ~1 point/day
  int _estimateDataPoints(List<String> types, int days) {
    const highFrequency = ['heart_rate', 'blood_oxygen'];
    const mediumFrequency = ['steps', 'calories', 'distance_walking_running'];
    const lowFrequency = [
      'sleep_in_bed',
      'sleep_asleep',
      'sleep_awake',
      'sleep_deep',
      'sleep_light',
      'sleep_rem',
      'exercise_time'
    ];
    const veryLowFrequency = ['weight'];

    var estimate = 0;

    for (final type in types) {
      if (highFrequency.contains(type)) {
        estimate += days * 1440; // ~1 per minute
      } else if (mediumFrequency.contains(type)) {
        estimate += days * 500; // ~500 per day
      } else if (lowFrequency.contains(type)) {
        estimate += days * 10; // ~10 per day
      } else if (veryLowFrequency.contains(type)) {
        estimate += days * 1; // ~1 per day
      } else {
        estimate += days * 50; // Unknown, assume medium-low
      }
    }

    return estimate;
  }

  /// Sample data points evenly to reduce count while preserving distribution.
  ///
  /// Takes every Nth point to get close to target count.
  /// This preserves temporal distribution better than just taking first N.
  List<HealthDataPoint> _sampleData(
    List<HealthDataPoint> data,
    int targetCount,
  ) {
    if (data.length <= targetCount) return data;

    final sampled = <HealthDataPoint>[];
    final step = data.length / targetCount;

    for (var i = 0; i < targetCount; i++) {
      final index = (i * step).floor();
      if (index < data.length) {
        sampled.add(data[index]);
      }
    }

    return sampled;
  }
}
