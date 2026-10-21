import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/widgets/content_type_chip.dart';
import 'package:tv_channel_sim/core/widgets/empty_state.dart';
import 'package:tv_channel_sim/core/widgets/list_tiles.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Icerik Yonetimi'),
          bottom: TabBar(
            indicatorColor: colors.primary,
            labelColor: colors.primary,
            unselectedLabelColor: colors.textSecondary,
            tabs: const [
              Tab(text: 'Kanal Kutuphanesi'),
              Tab(text: 'Icerik Pazari'),
            ],
          ),
        ),
        body: ResponsiveLayout(
          maxWidth: 600,
          child: TabBarView(
            children: [
              // 1. Sekme: Mevcut Kutuphane (ContentListTile ornekleri)
              ListView(
                padding: AppSpacing.paddingScreen,
                children: [
                  const ContentListTile(
                    title: 'Karanlik Vadi',
                    contentType: ContentType.dizi,
                    duration: '90 dk (Haftalik)',
                    rating: 8.4,
                    remainingDays: 3,
                  ),
                  AppSpacing.vGapMd,
                  const ContentListTile(
                    title: 'Sabah Gundemi',
                    contentType: ContentType.haber,
                    duration: '60 dk (Canli)',
                    rating: 5.2,
                    remainingDays: 45,
                  ),
                  AppSpacing.vGapMd,
                  const ContentListTile(
                    title: 'Mutfakta Sevgi Var',
                    contentType: ContentType.gunduz,
                    duration: '75 dk (Gunluk)',
                    rating: 6.5,
                    remainingDays: 18,
                  ),
                  AppSpacing.vGapMd,
                  const ContentListTile(
                    title: 'Buyuk Odul',
                    contentType: ContentType.yarisma,
                    duration: '110 dk (Hafta Sonu)',
                    rating: 7.1,
                    remainingDays: 12,
                  ),
                ],
              ),
              // 2. Sekme: Icerik Pazari (EmptyState)
              EmptyState(
                icon: Icons.shopping_bag_outlined,
                title: 'Icerik Pazari Hazirlaniyor',
                description: 'Yeni sezon dizileri ve yabanci film paketleri yakinda burada sergilenecek.',
                buttonText: 'Pazari Tara',
                buttonIcon: Icons.refresh_rounded,
                onButtonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}