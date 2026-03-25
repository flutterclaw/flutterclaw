import 'package:flutter/material.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/ui/widgets/provider_brand_icon.dart';

class ProviderPage extends StatelessWidget {
  final String? selectedProviderId;
  final ValueChanged<String> onProviderSelected;

  const ProviderPage({
    super.key,
    required this.selectedProviderId,
    required this.onProviderSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final freeProviders =
        ModelCatalog.availableProviders.where((p) => p.hasFreeModels).toList();
    final paidProviders = ModelCatalog.availableProviders
        .where((p) => !p.hasFreeModels)
        .toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      children: [
        Text(
          context.l10n.chooseProvider,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.selectProviderDesc,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),

        // Free providers featured section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.withValues(alpha: 0.08),
                Colors.teal.withValues(alpha: 0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.green.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.green.shade700, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    context.l10n.startForFree,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.freeProvidersDesc,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              ...freeProviders.map(
                (p) => _ProviderCard(
                  provider: p,
                  isSelected: selectedProviderId == p.id,
                  onTap: () => onProviderSelected(p.id),
                  showFreeBadge: true,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
        Text(
          context.l10n.otherProviders,
          style: theme.textTheme.titleSmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        ...paidProviders.map(
          (p) => _ProviderCard(
            provider: p,
            isSelected: selectedProviderId == p.id,
            onTap: () => onProviderSelected(p.id),
          ),
        ),
      ],
    );
  }
}

class _ProviderCard extends StatelessWidget {
  final CatalogProvider provider;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showFreeBadge;

  const _ProviderCard({
    required this.provider,
    required this.isSelected,
    required this.onTap,
    this.showFreeBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: isSelected
            ? colors.primaryContainer
            : colors.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 2)
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colors.primary
                        : colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ProviderBrandIcon(
                    provider: provider,
                    size: 22,
                    iconColor: isSelected
                        ? colors.onPrimary
                        : colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            provider.displayName,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (showFreeBadge) ...[
                            const SizedBox(width: 8),
                            _FreeBadge(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        provider.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle, color: colors.primary)
                else
                  Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FreeBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        context.l10n.free,
        style: TextStyle(
          color: Colors.green.shade800,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
