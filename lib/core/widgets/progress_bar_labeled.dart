import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV stüdyosu tarzı etiketli ve yüzdeli ilerleme çubuğu bileşeni.
class ProgressBarLabeled extends StatelessWidget {
  final String label;
  final double value; // 0.0 - 1.0 aralığında
  final String? valueText;
  final Color? progressColor;
  final Color? backgroundColor;
  final double height;
  final IconData? icon;

  const ProgressBarLabeled({
    super.key,
    required this.label,
    required this.value,
    this.valueText,
    this.progressColor,
    this.backgroundColor,
    this.height = 8.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final clampedValue = value.clamp(0.0, 1.0);
    final effectiveProgressColor = progressColor ?? colors.primary;
    final effectiveBgColor = backgroundColor ?? colors.cardBorder;
    final displayValueText = valueText ?? '%${(clampedValue * 100).toInt()}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 16,
                    color: effectiveProgressColor,
                  ),
                  AppSpacing.hGapXs,
                ],
                Text(
                  label,
                  style: AppTextStyles.labelMedium(color: colors.textSecondary),
                ),
              ],
            ),
            Text(
              displayValueText,
              style: AppTextStyles.labelMedium(color: colors.textPrimary),
            ),
          ],
        ),
        AppSpacing.vGapSm,
        ClipRRect(
          borderRadius: AppSpacing.borderRadiusPill,
          child: SizedBox(
            height: height,
            child: LinearProgressIndicator(
              value: clampedValue,
              backgroundColor: effectiveBgColor,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveProgressColor),
            ),
          ),
        ),
      ],
    );
  }
}
