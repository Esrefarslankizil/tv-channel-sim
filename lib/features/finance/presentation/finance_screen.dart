import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/app_card.dart';
import 'package:tv_channel_sim/core/widgets/empty_state.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';
import 'package:tv_channel_sim/core/widgets/stat_tile.dart';
import 'package:tv_channel_sim/features/dashboard/presentation/game_state_provider.dart';

class FinanceScreen extends ConsumerWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final colors = context.colors;
    final currencyFormatter = NumberFormat.currency(locale: 'tr_TR', symbol: 'TL ', decimalDigits: 0);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Finans ve Butce'),
          bottom: TabBar(
            indicatorColor: colors.primary,
            labelColor: colors.primary,
            unselectedLabelColor: colors.textSecondary,
            tabs: const [
              Tab(text: 'Mali Ozet'),
              Tab(text: 'Banka & Kredi'),
            ],
          ),
        ),
        body: ResponsiveLayout(
          maxWidth: 600,
          child: TabBarView(
            children: [
              // 1. Sekme: Mali Ozet
              ListView(
                padding: AppSpacing.paddingScreen,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: StatTile(
                          icon: Icons.account_balance_wallet_rounded,
                          label: 'Toplam Kasa',
                          value: currencyFormatter.format(gameState.balance),
                          trendPercentage: 3.2,
                          iconColor: colors.primary,
                        ),
                      ),
                      AppSpacing.hGapMd,
                      Expanded(
                        child: StatTile(
                          icon: Icons.show_chart_rounded,
                          label: 'Haftalik Net Kar',
                          value: currencyFormatter.format(gameState.weeklyProfit),
                          trendPercentage: 6.8,
                          iconColor: colors.success,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vGapLg,
                  AppCard(
                    title: 'Gunluk Gelir Tablosu',
                    icon: Icons.arrow_upward_rounded,
                    iconColor: colors.success,
                    child: Column(
                      children: [
                        _buildFinanceRow('Reklam Kusagi Gelirleri', 'TL 52.000', colors.success, colors),
                        Divider(color: colors.divider, height: 16),
                        _buildFinanceRow('Dizi Bolum Sponsorluklari', 'TL 18.000', colors.success, colors),
                        Divider(color: colors.divider, height: 16),
                        _buildFinanceRow('Yayin Hakki Paylasimi', 'TL 8.500', colors.success, colors),
                      ],
                    ),
                  ),
                  AppSpacing.vGapLg,
                  AppCard(
                    title: 'Gunluk Gider Tablosu',
                    icon: Icons.arrow_downward_rounded,
                    iconColor: colors.error,
                    child: Column(
                      children: [
                        _buildFinanceRow('Personel & Sunucu Maaslari', 'TL 28.000', colors.error, colors),
                        Divider(color: colors.divider, height: 16),
                        _buildFinanceRow('Studyo & Uydu Yayin Gideri', 'TL 12.000', colors.error, colors),
                        Divider(color: colors.divider, height: 16),
                        _buildFinanceRow('Lisans Amortisman Gideri', 'TL 6.500', colors.error, colors),
                      ],
                    ),
                  ),
                ],
              ),
              // 2. Sekme: Banka & Kredi (EmptyState)
              EmptyState(
                icon: Icons.account_balance_outlined,
                title: 'Banka Kredisi Kullanilmiyor',
                description: 'Kanalinizin nakit ihtiyaci olmasi durumunda ticari kredi limitleri burada gorunur.',
                buttonText: 'Kredi Limitlerini Sorgula',
                buttonIcon: Icons.search_rounded,
                onButtonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinanceRow(String title, String amount, Color amountColor, AppColorTheme colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bodyMedium(color: colors.textPrimary)),
        Text(amount, style: AppTextStyles.labelLarge(color: amountColor)),
      ],
    );
  }
}