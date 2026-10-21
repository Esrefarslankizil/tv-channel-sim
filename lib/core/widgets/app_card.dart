import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// Modern TV yayın stüdyosu temalı çok amaçlı kart bileşeni.
class AppCard extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? titleWidget;
  final IconData? icon;
  final Color? iconColor;
  final Widget? action;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double? width;

  const AppCard({
    super.key,
    required this.child,
    this.title,
    this.titleWidget,
    this.icon,
    this.iconColor,
    this.action,
    this.padding,
    this.borderColor,
    this.backgroundColor,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBorderColor = borderColor ?? colors.cardBorder;
    final effectiveBgColor = backgroundColor ?? colors.card;
    final effectivePadding = padding ?? AppSpacing.paddingCard;

    final hasHeader = title != null || titleWidget != null || icon != null || action != null;

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasHeader) ...[
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 20,
                  color: iconColor ?? colors.primary,
                ),
                AppSpacing.hGapSm,
              ],
              Expanded(
                child: titleWidget ??
                    Text(
                      title ?? '',
                      style: AppTextStyles.titleSmall(color: colors.textPrimary),
                    ),
              ),
              if (action != null) action!,
            ],
          ),
          AppSpacing.vGapMd,
        ],
        child,
      ],
    );

    Widget cardWidget = Container(
      width: width,
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: AppSpacing.borderRadiusCard,
        border: Border.all(color: effectiveBorderColor, width: 1),
      ),
      padding: effectivePadding,
      child: content,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppSpacing.borderRadiusCard,
          child: cardWidget,
        ),
      );
    }

    return cardWidget;
  }
}
