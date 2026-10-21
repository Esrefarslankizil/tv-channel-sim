import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV stüdyosu yönetim panellerine uygun istatistik gösterge kutusu.
class StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;
  final double? trendPercentage;
  final String? trendLabel;
  final VoidCallback? onTap;

  const StatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
    this.trendPercentage,
    this.trendLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveIconColor = iconColor ?? colors.primary;

    Widget body = Container(
      padding: AppSpacing.paddingCard,
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: AppSpacing.borderRadiusCard,
        border: Border.all(color: colors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: effectiveIconColor.withValues(alpha: 0.15),
                  borderRadius: AppSpacing.borderRadiusSmall,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: effectiveIconColor,
                ),
              ),
              AppSpacing.hGapSm,
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.labelMedium(color: colors.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          AppSpacing.vGapMd,
          Text(
            value,
            style: AppTextStyles.statNumber(color: colors.textPrimary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (trendPercentage != null || trendLabel != null) ...[
            AppSpacing.vGapXs,
            _buildTrendRow(colors),
          ],
        ],
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppSpacing.borderRadiusCard,
          child: body,
        ),
      );
    }

    return body;
  }

  Widget _buildTrendRow(AppColorTheme colors) {
    final isPositive = (trendPercentage ?? 0) >= 0;
    final trendColor = isPositive ? colors.success : colors.error;
    final trendIcon = isPositive ? Icons.trending_up_rounded : Icons.trending_down_rounded;

    final displayText = trendLabel ??
        '${isPositive ? '+' : ''}${trendPercentage!.toStringAsFixed(1)}%';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          trendIcon,
          size: 16,
          color: trendColor,
        ),
        AppSpacing.hGapXs,
        Text(
          displayText,
          style: AppTextStyles.labelSmall(color: trendColor),
        ),
      ],
    );
  }
}
