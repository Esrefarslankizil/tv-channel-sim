import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';

/// TV kanalında yayınlanabilen içerik türleri
enum ContentType {
  dizi,
  film,
  yarisma,
  gunduz,
  tartisma,
  haber,
  eglence,
}

extension ContentTypeX on ContentType {
  String get label {
    switch (this) {
      case ContentType.dizi:
        return 'Dizi';
      case ContentType.film:
        return 'Film';
      case ContentType.yarisma:
        return 'Yarışma';
      case ContentType.gunduz:
        return 'Gündüz Kuşağı';
      case ContentType.tartisma:
        return 'Tartışma';
      case ContentType.haber:
        return 'Haber';
      case ContentType.eglence:
        return 'Eğlence';
    }
  }

  Color get color {
    switch (this) {
      case ContentType.dizi:
        return AppColors.contentTypeDizi;
      case ContentType.film:
        return AppColors.contentTypeFilm;
      case ContentType.yarisma:
        return AppColors.contentTypeYarisma;
      case ContentType.gunduz:
        return AppColors.contentTypeGunduz;
      case ContentType.tartisma:
        return AppColors.contentTypeTartisma;
      case ContentType.haber:
        return AppColors.contentTypeHaber;
      case ContentType.eglence:
        return AppColors.contentTypeEglence;
    }
  }

  IconData get icon {
    switch (this) {
      case ContentType.dizi:
        return Icons.live_tv_rounded;
      case ContentType.film:
        return Icons.movie_rounded;
      case ContentType.yarisma:
        return Icons.emoji_events_rounded;
      case ContentType.gunduz:
        return Icons.wb_sunny_rounded;
      case ContentType.tartisma:
        return Icons.forum_rounded;
      case ContentType.haber:
        return Icons.newspaper_rounded;
      case ContentType.eglence:
        return Icons.theater_comedy_rounded;
    }
  }
}

/// Belirtilen içerik türünü TV stüdyosu tarzında renkli bir çip olarak gösterir.
class ContentTypeChip extends StatelessWidget {
  final ContentType type;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool showIcon;
  final bool isCompact;

  const ContentTypeChip({
    super.key,
    required this.type,
    this.isSelected = false,
    this.onTap,
    this.showIcon = true,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = type.color;

    final background = isSelected
        ? chipColor
        : chipColor.withValues(alpha: 0.15);

    final foreground = isSelected
        ? Colors.white
        : chipColor;

    final border = Border.all(
      color: isSelected ? chipColor : chipColor.withValues(alpha: 0.4),
      width: 1,
    );

    Widget chip = Container(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? AppSpacing.sm : AppSpacing.md,
        vertical: isCompact ? AppSpacing.xs : AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppSpacing.borderRadiusSmall,
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(
              type.icon,
              size: isCompact ? 14 : 16,
              color: foreground,
            ),
            AppSpacing.hGapXs,
          ],
          Text(
            type.label,
            style: isCompact
                ? AppTextStyles.labelSmall(color: foreground)
                : AppTextStyles.labelMedium(color: foreground),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppSpacing.borderRadiusSmall,
          child: chip,
        ),
      );
    }

    return chip;
  }
}
