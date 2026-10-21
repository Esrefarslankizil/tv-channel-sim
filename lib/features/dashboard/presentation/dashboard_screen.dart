import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/app_buttons.dart';
import 'package:tv_channel_sim/core/widgets/app_card.dart';
import 'package:tv_channel_sim/core/widgets/content_type_chip.dart';
import 'package:tv_channel_sim/core/widgets/feedback_helpers.dart';
import 'package:tv_channel_sim/core/widgets/rating_badge.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';

import 'package:tv_channel_sim/core/widgets/stat_tile.dart';
import 'package:tv_channel_sim/features/dashboard/presentation/game_state_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final colors = context.colors;
    final currencyFormatter = NumberFormat.currency(locale: 'tr_TR', symbol: 'TL ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Logo Yer Tutucusu
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryOrange, AppColors.secondaryCyan],
                ),
                borderRadius: AppSpacing.borderRadiusSmall,
              ),
              child: const Center(
                child: Icon(Icons.live_tv_rounded, color: Colors.white, size: 18),
              ),
            ),
            AppSpacing.hGapSm,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    gameState.channelName,
                    style: AppTextStyles.titleMedium(color: colors.textPrimary),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${gameState.week}. Hafta â€¢ ${gameState.dayName}',
                    style: AppTextStyles.bodySmall(color: colors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          if (kDebugMode)
            IconButton(
              icon: const Icon(Icons.palette_outlined),
              tooltip: 'Tasarim Vitrini (Debug)',
              onPressed: () => context.push('/debug/showcase'),
            ),
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              AppSnackBar.showInfo(context, '3 yeni bildiriminiz var.');
            },
          ),
        ],
      ),
      body: ResponsiveLayout(
        maxWidth: 600,
        child: ListView(
          padding: AppSpacing.paddingScreen,
          children: [
            // â”€â”€ 1. 2x2 StatTile IZGARASI â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
            Row(
              children: [
                Expanded(
                  child: StatTile(
                    icon: Icons.account_balance_wallet_rounded,
                    label: 'Kasa Bakiyesi',
                    value: currencyFormatter.format(gameState.balance),
                    trendPercentage: 5.4,
                    iconColor: colors.primary,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: StatTile(
                    icon: Icons.workspace_premium_rounded,
                    label: 'Kanal Itibari',
                    value: '%${gameState.reputation}',
                    trendPercentage: 2.0,
                    iconColor: colors.warning,
                  ),
                ),
              ],
            ),
            AppSpacing.vGapSm,
            Row(
              children: [
                Expanded(
                  child: StatTile(
                    icon: Icons.insights_rounded,
                    label: 'Dunku Reyting',
                    value: gameState.yesterdayRating.toStringAsFixed(1),
                    trendPercentage: -1.2,
                    iconColor: colors.secondary,
                  ),
                ),
                AppSpacing.hGapSm,
                Expanded(
                  child: StatTile(
                    icon: Icons.trending_up_rounded,
                    label: 'Haftalik Kar/Zarar',
                    value: currencyFormatter.format(gameState.weeklyProfit),
                    trendPercentage: 8.7,
                    iconColor: colors.success,
                  ),
                ),
              ],
            ),
            AppSpacing.vGapLg,

            // â”€â”€ 2. BUGUNUN YAYIN AKISI KARTI â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
            AppCard(
              title: "Bugunun Yayin Akisi",
              icon: Icons.calendar_view_week_rounded,
              action: TextButton(
                onPressed: () => context.go('/schedule'),
                child: Text('Tumu', style: AppTextStyles.labelMedium(color: colors.primary)),
              ),
              child: Column(
                children: [
                  _buildScheduleSlot(
                    time: '08:00',
                    title: 'Sabah Gundemi',
                    type: ContentType.haber,
                    rating: 3.4,
                    colors: colors,
                  ),
                  AppSpacing.vGapSm,
                  _buildScheduleSlot(
                    time: '13:00',
                    title: 'Mutfakta Sevgi Var',
                    type: ContentType.gunduz,
                    rating: 5.1,
                    colors: colors,
                  ),
                  AppSpacing.vGapSm,
                  _buildScheduleSlot(
                    time: '20:00',
                    title: 'Karanlik Vadi',
                    type: ContentType.dizi,
                    rating: 8.4,
                    isPrimeTime: true,
                    colors: colors,
                  ),
                  AppSpacing.vGapSm,
                  _buildScheduleSlot(
                    time: '22:30',
                    title: 'Buyuk Odul',
                    type: ContentType.yarisma,
                    rating: 6.8,
                    colors: colors,
                  ),
                ],
              ),
            ),
            AppSpacing.vGapLg,

            // â”€â”€ 3. BILDIRIMLER KARTI â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
            AppCard(
              title: "Onemli Bildirimler",
              icon: Icons.campaign_rounded,
              child: Column(
                children: [
                  _buildNotificationItem(
                    icon: Icons.warning_amber_rounded,
                    iconColor: colors.warning,
                    title: 'Lisans Suresi Yaklasiyor',
                    description: '"Karanlik Vadi" dizisinin yayin lisansi 3 gun sonra sona eriyor.',
                    colors: colors,
                    onTap: () => context.go('/content'),
                  ),
                  Divider(color: colors.divider, height: 16),
                  _buildNotificationItem(
                    icon: Icons.attach_money_rounded,
                    iconColor: colors.success,
                    title: 'Yeni Reklam Teklifi',
                    description: 'Mega Holding Prime Time kusagi icin 3 bolumluk teklif iletti.',
                    colors: colors,
                    onTap: () => context.go('/advertising'),
                  ),
                  Divider(color: colors.divider, height: 16),
                  _buildNotificationItem(
                    icon: Icons.people_outline_rounded,
                    iconColor: colors.secondary,
                    title: 'Personel Maas Odeme Donemi',
                    description: 'Teknik ve sunucu ekip maaslarina 2 gun kaldi (Toplam TL 28.000).',
                    colors: colors,
                    onTap: () => context.go('/staff'),
                  ),
                ],
              ),
            ),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
      // â”€â”€ 4. SABIT DIKKAT CEKEN "SONRAKI GUNE GEC" BUTONU â”€â”€â”€â”€â”€
      bottomNavigationBar: Container(
        color: colors.background,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: SafeArea(
          child: ResponsiveLayout(
            maxWidth: 600,
            child: PrimaryButton(
              text: 'Sonraki Gune Gec (${gameState.dayName})',
              icon: Icons.fast_forward_rounded,
              onPressed: () {
                ref.read(gameStateProvider.notifier).advanceNextDay();
                AppSnackBar.showSuccess(
                  context,
                  '${gameState.dayName} yayinlari tamamlandi, yeni gune gecildi!',
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleSlot({
    required String time,
    required String title,
    required ContentType type,
    required double rating,
    required AppColorTheme colors,
    bool isPrimeTime = false,
  }) {
    return Container(
      padding: AppSpacing.paddingSm,
      decoration: BoxDecoration(
        color: isPrimeTime ? colors.primary.withValues(alpha: 0.08) : colors.surface,
        borderRadius: AppSpacing.borderRadiusSmall,
        border: isPrimeTime ? Border.all(color: colors.primary.withValues(alpha: 0.5)) : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: AppSpacing.borderRadiusXs,
            ),
            child: Text(
              time,
              style: AppTextStyles.labelSmall(color: colors.textPrimary),
            ),
          ),
          AppSpacing.hGapSm,
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.titleSmall(color: colors.textPrimary),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ContentTypeChip(type: type, isCompact: true, showIcon: false),
          AppSpacing.hGapSm,
          RatingBadge(rating: rating),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required AppColorTheme colors,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppSpacing.borderRadiusSmall,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          AppSpacing.hGapSm,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelLarge(color: colors.textPrimary),
                ),
                AppSpacing.vGapXs,
                Text(
                  description,
                  style: AppTextStyles.bodySmall(color: colors.textSecondary),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: colors.textDisabled, size: 20),
        ],
      ),
    );
  }
}