import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV reyting skorunu renk kodlu rozet olarak gösteren bileşen.
/// - < 4.0: Düşük (Kırmızı / Error)
/// - 4.0 - 7.0: Orta (Sarı / Warning)
/// - > 7.0: Yüksek (Yeşil / Success)
class RatingBadge extends StatelessWidget {
  final double rating;
  final String? label;
  final bool isLarge;
  final VoidCallback? onTap;

  const RatingBadge({
    super.key,
    required this.rating,
    this.label,
    this.isLarge = false,
    this.onTap,
  });

  Color _getRatingColor(AppColorTheme colors) {
    if (rating < 4.0) {
      return colors.error;
    } else if (rating <= 7.0) {
      return colors.warning;
    } else {
      return colors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ratingColor = _getRatingColor(colors);

    Widget badge = Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? AppSpacing.md : AppSpacing.sm,
        vertical: isLarge ? AppSpacing.sm : AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: ratingColor.withValues(alpha: 0.15),
        borderRadius: AppSpacing.borderRadiusSmall,
        border: Border.all(color: ratingColor.withValues(alpha: 0.6), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_rounded,
            size: isLarge ? 18 : 14,
            color: ratingColor,
          ),
          AppSpacing.hGapXs,
          Text(
            rating.toStringAsFixed(1),
            style: isLarge
                ? AppTextStyles.titleMedium(color: ratingColor)
                : AppTextStyles.labelLarge(color: ratingColor),
          ),
          if (label != null) ...[
            AppSpacing.hGapXs,
            Text(
              label!,
              style: AppTextStyles.labelSmall(
                color: colors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: AppSpacing.borderRadiusSmall,
        child: badge,
      );
    }

    return badge;
  }
}
