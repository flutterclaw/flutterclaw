import 'package:flutter/material.dart';

/// Reusable step-by-step setup wizard for channel configuration flows.
class SetupWizardScaffold extends StatefulWidget {
  const SetupWizardScaffold({
    super.key,
    required this.title,
    required this.steps,
    required this.onComplete,
    this.completeLabel = 'Save & Connect',
    this.appBarActions = const [],
  });

  final String title;
  final List<SetupWizardStep> steps;
  final Future<void> Function() onComplete;
  final String completeLabel;
  final List<Widget> appBarActions;

  @override
  State<SetupWizardScaffold> createState() => _SetupWizardScaffoldState();
}

class SetupWizardStep {
  const SetupWizardStep({
    required this.title,
    required this.subtitle,
    required this.body,
    this.isValid = true,
    this.optional = false,
  });

  final String title;
  final String subtitle;
  final Widget body;
  final bool isValid;
  final bool optional;
}

class _SetupWizardScaffoldState extends State<SetupWizardScaffold> {
  int _step = 0;
  bool _busy = false;

  bool get _canAdvance {
    if (_step >= widget.steps.length) return false;
    final step = widget.steps[_step];
    return step.optional || step.isValid;
  }

  bool get _isLast => _step >= widget.steps.length - 1;

  Future<void> _next() async {
    if (!_canAdvance) return;
    if (_isLast) {
      setState(() => _busy = true);
      try {
        await widget.onComplete();
      } finally {
        if (mounted) setState(() => _busy = false);
      }
      return;
    }
    setState(() => _step++);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final step = widget.steps[_step];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: widget.appBarActions,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (_step + 1) / widget.steps.length,
            backgroundColor: colors.surfaceContainerHighest,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Step ${_step + 1} of ${widget.steps.length}',
            style: theme.textTheme.labelMedium?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            step.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            step.subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          step.body,
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Row(
            children: [
              if (_step > 0)
                TextButton(
                  onPressed: _busy ? null : () => setState(() => _step--),
                  child: const Text('Back'),
                )
              else
                const SizedBox(width: 8),
              const Spacer(),
              FilledButton(
                onPressed: (_canAdvance && !_busy) ? _next : null,
                child: _busy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(_isLast ? widget.completeLabel : 'Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
