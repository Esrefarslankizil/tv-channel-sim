import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV stüdyosu panellerinde bölümleri ayıran ve sağ aksiyon sunan başlık bileşeni.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onActionTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.titleMedium(color: colors.textPrimary),
              ),
              if (subtitle != null) ...[
                AppSpacing.vGapXs,
                Text(
                  subtitle!,
                  style: AppTextStyles.bodySmall(color: colors.textSecondary),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null)
          trailing!
        else if (actionText != null && onActionTap != null)
          TextButton(
            onPressed: onActionTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionText!,
                  style: AppTextStyles.labelMedium(color: colors.primary),
                ),
                AppSpacing.hGapXs,
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: colors.primary,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
