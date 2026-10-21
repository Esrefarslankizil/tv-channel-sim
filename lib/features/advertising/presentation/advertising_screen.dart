import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/app_card.dart';
import 'package:tv_channel_sim/core/widgets/empty_state.dart';
import 'package:tv_channel_sim/core/widgets/progress_bar_labeled.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';

class AdvertisingScreen extends StatelessWidget {
  const AdvertisingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reklam & Sponsorluk'),
          bottom: TabBar(
            indicatorColor: colors.primary,
            labelColor: colors.primary,
            unselectedLabelColor: colors.textSecondary,
            tabs: const [
              Tab(text: 'Aktif Anlasmalar'),
              Tab(text: 'Gelen Teklifler'),
            ],
          ),
        ),
        body: ResponsiveLayout(
          maxWidth: 600,
          child: TabBarView(
            children: [
              // 1. Sekme: Aktif Anlasmalar
              ListView(
                padding: AppSpacing.paddingScreen,
                children: [
                  _buildContractCard(
                    brandName: 'Turkcell / Mega Iletisim',
                    dealType: 'Prime Time Kusak Sponsoru',
                    dailyIncome: 45000,
                    progress: 0.75,
                    remainingDays: 5,
                    colors: colors,
                  ),
                  AppSpacing.vGapMd,
                  _buildContractCard(
                    brandName: 'Anadolu Gida A.S.',
                    dealType: 'Gunduz Kusagi Bant Reklam',
                    dailyIncome: 18000,
                    progress: 0.40,
                    remainingDays: 14,
                    colors: colors,
                  ),
                  AppSpacing.vGapMd,
                  _buildContractCard(
                    brandName: 'OtoMax Otomotiv',
                    dealType: 'Haber Bulteni Sonu Reklam',
                    dailyIncome: 25000,
                    progress: 0.90,
                    remainingDays: 2,
                    colors: colors,
                  ),
                ],
              ),
              // 2. Sekme: Gelen Teklifler (EmptyState)
              EmptyState(
                icon: Icons.campaign_rounded,
                title: 'Bekleyen Reklam Teklifi Yok',
                description: 'Kanalinizin izlenme oranlari arttikca markalardan sponsorluk teklifleri gelecektir.',
                buttonText: 'Piyasayi Tara',
                buttonIcon: Icons.travel_explore_rounded,
                onButtonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContractCard({
    required String brandName,
    required String dealType,
    required double dailyIncome,
    required double progress,
    required int remainingDays,
    required AppColorTheme colors,
  }) {
    return AppCard(
      title: brandName,
      icon: Icons.business_rounded,
      action: Text(
        '+TL ${dailyIncome.toStringAsFixed(0)} / gun',
        style: AppTextStyles.labelLarge(color: colors.success),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dealType,
            style: AppTextStyles.bodyMedium(color: colors.textSecondary),
          ),
          AppSpacing.vGapMd,
          ProgressBarLabeled(
            label: 'Sozlesme Suresi ($remainingDays gun kaldi)',
            value: progress,
            progressColor: colors.primary,
          ),
        ],
      ),
    );
  }
}