import 'package:flutter/material.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';
import 'package:flutterclaw/ui/widgets/app_card.dart';
import 'package:flutterclaw/ui/widgets/section_header.dart';

/// A titled card section used in forms (Create Agent, Providers, Channel configs).
///
/// Replaces the repetitive `Padding > Column > SectionHeader > Card > Column` pattern.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.children,
    this.trailing,
    this.padding,
  });

  final String title;
  final List<Widget> children;

  /// Optional widget placed at the end of the header row (e.g. an info button).
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SectionHeader(title: title),
            if (trailing != null) ...[
              const Spacer(),
              trailing!,
            ],
          ],
        ),
        const SizedBox(height: AppTokens.spacingSM),
        AppCard(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
