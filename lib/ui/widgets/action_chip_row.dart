import 'package:flutter/material.dart';
import 'package:flutterclaw/ui/theme/tokens.dart';

/// A horizontally scrolling row of action chips.
///
/// Used in the chat empty state, channel quick-actions, and onboarding hints.
class ActionChipRow extends StatelessWidget {
  const ActionChipRow({
    super.key,
    required this.chips,
    this.padding,
  });

  final List<ActionChipData> chips;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: AppTokens.spacingLG),
      child: Row(
        children: [
          for (var i = 0; i < chips.length; i++) ...[
            _ChipItem(data: chips[i]),
            if (i < chips.length - 1) const SizedBox(width: AppTokens.spacingSM),
          ],
        ],
      ),
    );
  }
}

class ActionChipData {
  const ActionChipData({
    required this.label,
    this.icon,
    required this.onTap,
  });

  final String label;
  final IconData? icon;
  final VoidCallback onTap;
}

class _ChipItem extends StatelessWidget {
  const _ChipItem({required this.data});

  final ActionChipData data;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: data.icon != null
          ? Icon(data.icon, size: AppTokens.iconXS)
          : null,
      label: Text(data.label),
      onPressed: data.onTap,
    );
  }
}
