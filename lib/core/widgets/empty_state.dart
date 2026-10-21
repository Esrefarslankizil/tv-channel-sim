import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/app_buttons.dart';

/// İçerik veya veri bulunmadığında gösterilen TV stüdyosu temalı boş durum bileşeni.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final IconData? buttonIcon;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.buttonText,
    this.onButtonPressed,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Center(
      child: Padding(
        padding: AppSpacing.paddingXl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                size: 40,
                color: colors.primary,
              ),
            ),
            AppSpacing.vGapXl,
            Text(
              title,
              style: AppTextStyles.titleMedium(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            AppSpacing.vGapSm,
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Text(
                description,
                style: AppTextStyles.bodyMedium(color: colors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              AppSpacing.vGapXl,
              PrimaryButton(
                text: buttonText!,
                icon: buttonIcon,
                onPressed: onButtonPressed,
                isFullWidth: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
