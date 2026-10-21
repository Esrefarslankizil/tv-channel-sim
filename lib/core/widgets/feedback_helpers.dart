import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV stüdyosu tarzı onay diyalogu yardımcısı.
class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final bool isDestructive;
  final IconData? icon;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = 'Onayla',
    this.cancelText = 'İptal',
    this.isDestructive = false,
    this.icon,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = 'Onayla',
    String cancelText = 'İptal',
    bool isDestructive = false,
    IconData? icon,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        isDestructive: isDestructive,
        icon: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final actionColor = isDestructive ? colors.error : colors.primary;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusDialog,
      ),
      backgroundColor: colors.card,
      title: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: actionColor, size: 24),
            AppSpacing.hGapSm,
          ],
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.titleMedium(color: colors.textPrimary),
            ),
          ),
        ],
      ),
      content: Text(
        content,
        style: AppTextStyles.bodyMedium(color: colors.textSecondary),
      ),
      actionsPadding: AppSpacing.paddingCard,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            cancelText,
            style: AppTextStyles.labelLarge(color: colors.textSecondary),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: actionColor,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: AppSpacing.borderRadiusButton,
            ),
            minimumSize: const Size(80, AppSpacing.minTouchTarget),
          ),
          child: Text(
            confirmText,
            style: AppTextStyles.labelLarge(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

/// TV stüdyosu tarzı şık bildirimler (SnackBar) yardımcısı.
class AppSnackBar {
  AppSnackBar._();

  static void showSuccess(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      icon: Icons.check_circle_rounded,
      accentColor: context.colors.success,
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      icon: Icons.error_rounded,
      accentColor: context.colors.error,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      icon: Icons.info_rounded,
      accentColor: context.colors.secondary,
    );
  }

  static void _show({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color accentColor,
  }) {
    final colors = context.colors;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colors.card,
        elevation: 8,
        margin: AppSpacing.paddingScreen,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          side: BorderSide(color: accentColor.withValues(alpha: 0.6), width: 1.5),
        ),
        content: Row(
          children: [
            Icon(icon, color: accentColor, size: 20),
            AppSpacing.hGapSm,
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodyMedium(color: colors.textPrimary),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
