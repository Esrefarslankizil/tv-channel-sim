import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/widgets/empty_state.dart';
import 'package:tv_channel_sim/core/widgets/list_tiles.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personel Yonetimi'),
          bottom: TabBar(
            indicatorColor: colors.primary,
            labelColor: colors.primary,
            unselectedLabelColor: colors.textSecondary,
            tabs: const [
              Tab(text: 'Mevcut Ekip'),
              Tab(text: 'Ilanlar & Adaylar'),
            ],
          ),
        ),
        body: ResponsiveLayout(
          maxWidth: 600,
          child: TabBarView(
            children: [
              // 1. Sekme: Mevcut Ekip (StaffListTile ornekleri)
              ListView(
                padding: AppSpacing.paddingScreen,
                children: [
                  const StaffListTile(
                    name: 'Deniz Soylu',
                    role: 'Ana Haber Bulteni Sunucusu',
                    salary: 45000,
                    skillLevel: 88,
                    icon: Icons.record_voice_over_rounded,
                  ),
                  AppSpacing.vGapMd,
                  const StaffListTile(
                    name: 'Can Akman',
                    role: 'Bas Yonetmen (Dizi)',
                    salary: 60000,
                    skillLevel: 92,
                    icon: Icons.movie_creation_rounded,
                  ),
                  AppSpacing.vGapMd,
                  const StaffListTile(
                    name: 'Selin Yildiz',
                    role: 'Gunduz Kusagi Moderatoru',
                    salary: 35000,
                    skillLevel: 76,
                    icon: Icons.mic_rounded,
                  ),
                  AppSpacing.vGapMd,
                  const StaffListTile(
                    name: 'Kemal Tekin',
                    role: 'Teknik Yonetmen & Reji Amiri',
                    salary: 30000,
                    skillLevel: 82,
                    icon: Icons.settings_input_composite_rounded,
                  ),
                ],
              ),
              // 2. Sekme: Ilanlar & Adaylar (EmptyState)
              EmptyState(
                icon: Icons.person_search_rounded,
                title: 'Aday Havuzu Bos',
                description: 'Kanaliniza yeni sunucu, senarist veya yonetmen transfer etmek icin ilan verin.',
                buttonText: 'Yeni Personel Ilani Ver',
                buttonIcon: Icons.add_rounded,
                onButtonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}