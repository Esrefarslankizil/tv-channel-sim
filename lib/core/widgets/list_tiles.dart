import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/content_type_chip.dart';
import 'package:tv_channel_sim/core/widgets/drag_handle.dart';
import 'package:tv_channel_sim/core/widgets/rating_badge.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';

/// Standart Icerik Liste Karti (Dizi/Film/Program)
class ContentListTile extends StatelessWidget {
  final String title;
  final ContentType contentType;
  final String duration;
  final double rating;
  final int remainingDays;
  final VoidCallback? onTap;

  const ContentListTile({
    super.key,
    required this.title,
    required this.contentType,
    required this.duration,
    required this.rating,
    required this.remainingDays,
    this.onTap,
  });

  void _showDetailBottomSheet(BuildContext context) {
    final colors = context.colors;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusDialog)),
      ),
      builder: (context) {
        return ResponsiveLayout(
          maxWidth: 600,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.xl,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DragHandle(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: contentType.color.withValues(alpha: 0.15),
                        borderRadius: AppSpacing.borderRadiusButton,
                      ),
                      child: Icon(contentType.icon, color: contentType.color, size: 28),
                    ),
                    AppSpacing.hGapMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.titleMedium(color: colors.textPrimary),
                          ),
                          AppSpacing.vGapXs,
                          ContentTypeChip(type: contentType, isCompact: true),
                        ],
                      ),
                    ),
                    RatingBadge(rating: rating, isLarge: true),
                  ],
                ),
                AppSpacing.vGapLg,
                Divider(color: colors.divider),
                AppSpacing.vGapMd,
                _buildInfoRow('Yayin Suresi', duration, colors),
                AppSpacing.vGapSm,
                _buildInfoRow('Lisans Durumu', '$remainingDays gun kaldi', colors),
                AppSpacing.vGapSm,
                _buildInfoRow('Icerik Turu', contentType.label, colors),
                AppSpacing.vGapXl,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kapat'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, AppColorTheme colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyMedium(color: colors.textSecondary)),
        Text(value, style: AppTextStyles.labelLarge(color: colors.textPrimary)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else {
            _showDetailBottomSheet(context);
          }
        },
        borderRadius: AppSpacing.borderRadiusButton,
        child: Container(
          padding: AppSpacing.paddingMd,
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: AppSpacing.borderRadiusButton,
            border: Border.all(color: colors.cardBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: contentType.color.withValues(alpha: 0.15),
                  borderRadius: AppSpacing.borderRadiusSmall,
                ),
                child: Icon(contentType.icon, color: contentType.color, size: 22),
              ),
              AppSpacing.hGapMd,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleSmall(color: colors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.vGapXs,
                    Row(
                      children: [
                        Text(
                          contentType.label,
                          style: AppTextStyles.bodySmall(color: contentType.color),
                        ),
                        AppSpacing.hGapSm,
                        Text(
                          '• $duration',
                          style: AppTextStyles.bodySmall(color: colors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppSpacing.hGapSm,
              RatingBadge(rating: rating),
            ],
          ),
        ),
      ),
    );
  }
}

/// Standart Personel Liste Karti (Sunucu/Yonetmen/Teknik Ekip)
class StaffListTile extends StatelessWidget {
  final String name;
  final String role;
  final double salary;
  final int skillLevel; // 1-100
  final IconData icon;
  final VoidCallback? onTap;

  const StaffListTile({
    super.key,
    required this.name,
    required this.role,
    required this.salary,
    required this.skillLevel,
    this.icon = Icons.person_rounded,
    this.onTap,
  });

  void _showDetailBottomSheet(BuildContext context) {
    final colors = context.colors;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusDialog)),
      ),
      builder: (context) {
        return ResponsiveLayout(
          maxWidth: 600,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.xl,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DragHandle(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: colors.primary, size: 28),
                    ),
                    AppSpacing.hGapMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: AppTextStyles.titleMedium(color: colors.textPrimary),
                          ),
                          AppSpacing.vGapXs,
                          Text(
                            role,
                            style: AppTextStyles.bodyMedium(color: colors.secondary),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.15),
                        borderRadius: AppSpacing.borderRadiusSmall,
                        border: Border.all(color: colors.primary),
                      ),
                      child: Text(
                        'Yetenek: %$skillLevel',
                        style: AppTextStyles.labelLarge(color: colors.primary),
                      ),
                    ),
                  ],
                ),
                AppSpacing.vGapLg,
                Divider(color: colors.divider),
                AppSpacing.vGapMd,
                _buildInfoRow('Aylik Maas', 'TL ${salary.toStringAsFixed(0)}', colors),
                AppSpacing.vGapSm,
                _buildInfoRow('Departman', role, colors),
                AppSpacing.vGapSm,
                _buildInfoRow('Etki Gucu', '+%${(skillLevel * 0.1).toStringAsFixed(1)} Reyting Katkisi', colors),
                AppSpacing.vGapXl,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kapat'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, AppColorTheme colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyMedium(color: colors.textSecondary)),
        Text(value, style: AppTextStyles.labelLarge(color: colors.textPrimary)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else {
            _showDetailBottomSheet(context);
          }
        },
        borderRadius: AppSpacing.borderRadiusButton,
        child: Container(
          padding: AppSpacing.paddingMd,
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: AppSpacing.borderRadiusButton,
            border: Border.all(color: colors.cardBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: colors.primary, size: 22),
              ),
              AppSpacing.hGapMd,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.titleSmall(color: colors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.vGapXs,
                    Text(
                      role,
                      style: AppTextStyles.bodySmall(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
              AppSpacing.hGapSm,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TL ${salary.toStringAsFixed(0)}',
                    style: AppTextStyles.labelMedium(color: colors.primary),
                  ),
                  AppSpacing.vGapXs,
                  Text(
                    'Yetenek: %$skillLevel',
                    style: AppTextStyles.bodySmall(color: colors.secondary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}