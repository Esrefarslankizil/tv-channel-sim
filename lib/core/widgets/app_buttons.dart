import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV stüdyosu temalı birincil eylem butonu (Stüdyo Turuncusu vurgulu).
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isFullWidth;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isFullWidth = true,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBgColor = backgroundColor ?? colors.primary;
    final effectiveFgColor = foregroundColor ?? Colors.white;

    Widget child;
    if (isLoading) {
      child = SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveFgColor),
        ),
      );
    } else {
      child = Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: effectiveFgColor),
            AppSpacing.hGapSm,
          ],
          Text(
            text,
            style: AppTextStyles.labelLarge(color: effectiveFgColor),
          ),
        ],
      );
    }

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: effectiveBgColor,
        foregroundColor: effectiveFgColor,
        disabledBackgroundColor: colors.cardBorder,
        disabledForegroundColor: colors.textDisabled,
        minimumSize: Size(
          isFullWidth ? double.infinity : AppSpacing.minTouchTarget,
          AppSpacing.minTouchTarget,
        ),
        padding: AppSpacing.paddingButton,
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusButton,
        ),
        elevation: 0,
      ),
      child: child,
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}

/// TV stüdyosu temalı ikincil eylem butonu (Kart kenarlıklı ve çerçeveli).
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isFullWidth;
  final bool isLoading;
  final Color? borderColor;
  final Color? textColor;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isFullWidth = true,
    this.isLoading = false,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBorderColor = borderColor ?? colors.cardBorder;
    final effectiveTextColor = textColor ?? colors.textPrimary;

    Widget child;
    if (isLoading) {
      child = SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
        ),
      );
    } else {
      child = Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: effectiveTextColor),
            AppSpacing.hGapSm,
          ],
          Text(
            text,
            style: AppTextStyles.labelLarge(color: effectiveTextColor),
          ),
        ],
      );
    }

    final button = OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: effectiveTextColor,
        disabledForegroundColor: colors.textDisabled,
        side: BorderSide(
          color: onPressed != null ? effectiveBorderColor : colors.cardBorder,
          width: 1.5,
        ),
        minimumSize: Size(
          isFullWidth ? double.infinity : AppSpacing.minTouchTarget,
          AppSpacing.minTouchTarget,
        ),
        padding: AppSpacing.paddingButton,
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusButton,
        ),
      ),
      child: child,
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
