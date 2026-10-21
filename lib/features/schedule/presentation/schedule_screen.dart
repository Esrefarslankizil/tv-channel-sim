import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/app_card.dart';
import 'package:tv_channel_sim/core/widgets/content_type_chip.dart';
import 'package:tv_channel_sim/core/widgets/empty_state.dart';
import 'package:tv_channel_sim/core/widgets/rating_badge.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yayin Akisi'),
          bottom: TabBar(
            indicatorColor: colors.primary,
            labelColor: colors.primary,
            unselectedLabelColor: colors.textSecondary,
            tabs: const [
              Tab(text: 'Bugunun Akisi'),
              Tab(text: 'Haftalik Sablon'),
            ],
          ),
        ),
        body: ResponsiveLayout(
          maxWidth: 600,
          child: TabBarView(
            children: [
              // 1. Sekme: Bugunun Akisi
              ListView(
                padding: AppSpacing.paddingScreen,
                children: [
                  _buildSlotCard(
                    context: context,
                    time: '07:00 - 09:00',
                    slotName: 'Sabah Kusagi',
                    programTitle: 'Gunun Ilk Haberi',
                    type: ContentType.haber,
                    rating: 4.1,
                  ),
                  AppSpacing.vGapMd,
                  _buildSlotCard(
                    context: context,
                    time: '12:30 - 15:00',
                    slotName: 'Ogle Kusagi',
                    programTitle: 'Mutfakta Sevgi Var',
                    type: ContentType.gunduz,
                    rating: 6.2,
                  ),
                  AppSpacing.vGapMd,
                  _buildSlotCard(
                    context: context,
                    time: '20:00 - 22:30',
                    slotName: 'Prime Time',
                    programTitle: 'Karanlik Vadi',
                    type: ContentType.dizi,
                    rating: 8.4,
                    isHighlight: true,
                  ),
                  AppSpacing.vGapMd,
                  _buildSlotCard(
                    context: context,
                    time: '23:00 - 01:00',
                    slotName: 'Gece Kusagi',
                    programTitle: 'Gundem Ozel',
                    type: ContentType.tartisma,
                    rating: 5.5,
                  ),
                ],
              ),
              // 2. Sekme: Haftalik Sablon (EmptyState)
              EmptyState(
                icon: Icons.calendar_month_rounded,
                title: 'Haftalik Sablon Olusturun',
                description: 'Pazartesiden Pazara kadar tum haftanin yayin planini otomatik donguye alin.',
                buttonText: 'Sablon Olustur',
                buttonIcon: Icons.edit_calendar_rounded,
                onButtonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCard({
    required BuildContext context,
    required String time,
    required String slotName,
    required String programTitle,
    required ContentType type,
    required double rating,
    bool isHighlight = false,
  }) {
    final colors = context.colors;

    return AppCard(
      borderColor: isHighlight ? colors.primary : null,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isHighlight
                  ? colors.primary.withValues(alpha: 0.15)
                  : colors.surface,
              borderRadius: AppSpacing.borderRadiusSmall,
            ),
            child: Column(
              children: [
                Icon(
                  Icons.access_time_filled_rounded,
                  size: 16,
                  color: isHighlight ? colors.primary : colors.textSecondary,
                ),
                AppSpacing.vGapXs,
                Text(
                  time.split(' - ')[0],
                  style: AppTextStyles.labelSmall(
                    color: isHighlight ? colors.primary : colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.hGapMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      slotName,
                      style: AppTextStyles.labelSmall(
                        color: isHighlight ? colors.primary : colors.textSecondary,
                      ),
                    ),
                    AppSpacing.hGapSm,
                    ContentTypeChip(type: type, isCompact: true, showIcon: false),
                  ],
                ),
                AppSpacing.vGapXs,
                Text(
                  programTitle,
                  style: AppTextStyles.titleSmall(color: colors.textPrimary),
                ),
              ],
            ),
          ),
          RatingBadge(rating: rating),
        ],
      ),
    );
  }
}