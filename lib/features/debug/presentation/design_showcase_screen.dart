import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tv_channel_sim/core/theme/app_colors.dart';
import 'package:tv_channel_sim/core/theme/app_spacing.dart';
import 'package:tv_channel_sim/core/theme/app_text_styles.dart';
import 'package:tv_channel_sim/core/widgets/app_buttons.dart';
import 'package:tv_channel_sim/core/widgets/app_card.dart';
import 'package:tv_channel_sim/core/widgets/content_type_chip.dart';
import 'package:tv_channel_sim/core/widgets/feedback_helpers.dart';
import 'package:tv_channel_sim/core/widgets/progress_bar_labeled.dart';
import 'package:tv_channel_sim/core/widgets/rating_badge.dart';
import 'package:tv_channel_sim/core/widgets/responsive_layout.dart';
import 'package:tv_channel_sim/core/widgets/section_header.dart';
import 'package:tv_channel_sim/core/widgets/stat_tile.dart';

/// TV Studyosu Tasarim Sistemi Vitrin (Showcase) Ekrani.
class DesignShowcaseScreen extends StatefulWidget {
  const DesignShowcaseScreen({super.key});

  @override
  State<DesignShowcaseScreen> createState() => _DesignShowcaseScreenState();
}

class _DesignShowcaseScreenState extends State<DesignShowcaseScreen> {
  ContentType _selectedContentType = ContentType.dizi;

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return const Scaffold(
        body: Center(
          child: Text('Bu ekran yalnizca hata ayiklama modunda kullanilabilir.'),
        ),
      );
    }

    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasarim Sistemi Vitrini'),
      ),
      body: ResponsiveLayout(
        maxWidth: 600,
        child: ListView(
          padding: AppSpacing.paddingScreen,
          children: [
            const SectionHeader(
              title: '1. Renk Paleti',
              subtitle: 'Studyo koyu tema, durum ve icerik turu renkleri',
            ),
            AppSpacing.vGapMd,
            _buildColorPalette(colors),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '2. Tipografi Hiyerarsisi',
              subtitle: 'Poppins (Baslik/Istatistik) & Inter (Govde/Etiket)',
            ),
            AppSpacing.vGapMd,
            _buildTypographySection(colors),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '3. Butonlar & Durumlar',
              subtitle: 'Primary, Secondary, Yukleniyor ve Devre Disi',
            ),
            AppSpacing.vGapMd,
            _buildButtonsSection(),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '4. Kart Bileseni (AppCard)',
              subtitle: 'Baslik, aksiyon, ikon ve ozel kenarlik destekli',
            ),
            AppSpacing.vGapMd,
            _buildCardSection(colors),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '5. Istatistik Gostergeleri (StatTile)',
              subtitle: 'Buyuk Poppins rakamlar ve pozitif/negatif trend oklari',
            ),
            AppSpacing.vGapMd,
            _buildStatTilesSection(colors),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '6. Ilerleme Cubuklari',
              subtitle: 'Etiketli, yuzdeli ve renk kodlu barlar',
            ),
            AppSpacing.vGapMd,
            _buildProgressBarsSection(colors),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '7. Reyting Rozetleri (RatingBadge)',
              subtitle: 'Dusuk (<4.0), Orta (4.0-7.0) ve Yuksek (>7.0)',
            ),
            AppSpacing.vGapMd,
            _buildRatingBadgesSection(),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '8. Icerik Turu Rozetleri',
              subtitle: 'Her yayin formati icin ozel renk ve ikon',
            ),
            AppSpacing.vGapMd,
            _buildContentTypeChipsSection(),
            AppSpacing.vGapXl,

            const SectionHeader(
              title: '9. Geri Bildirim & Diyaloglar',
              subtitle: 'ConfirmDialog ve tematik AppSnackBar bildirimleri',
            ),
            AppSpacing.vGapMd,
            _buildFeedbackSection(context),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
    );
  }

  Widget _buildColorPalette(AppColorTheme colors) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        _buildColorSwatch('Dark BG', colors.background),
        _buildColorSwatch('Surface', colors.surface),
        _buildColorSwatch('Card', colors.card),
        _buildColorSwatch('Primary', colors.primary),
        _buildColorSwatch('Secondary', colors.secondary),
        _buildColorSwatch('Success', colors.success),
        _buildColorSwatch('Warning', colors.warning),
        _buildColorSwatch('Error', colors.error),
        _buildColorSwatch('Dizi', AppColors.contentTypeDizi),
        _buildColorSwatch('Film', AppColors.contentTypeFilm),
        _buildColorSwatch('Yarisma', AppColors.contentTypeYarisma),
        _buildColorSwatch('Gunduz', AppColors.contentTypeGunduz),
        _buildColorSwatch('Tartisma', AppColors.contentTypeTartisma),
        _buildColorSwatch('Haber', AppColors.contentTypeHaber),
        _buildColorSwatch('Eglence', AppColors.contentTypeEglence),
      ],
    );
  }

  Widget _buildColorSwatch(String label, Color color) {
    return Container(
      width: 100,
      padding: AppSpacing.paddingSm,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppSpacing.borderRadiusSmall,
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: AppSpacing.borderRadiusXs,
            ),
            child: Text(
              label,
              style: AppTextStyles.labelSmall(color: Colors.white),
            ),
          ),
          AppSpacing.vGapXs,
          Text(
            '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
            style: AppTextStyles.labelSmall(
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographySection(AppColorTheme colors) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('TL 1.450.000', style: AppTextStyles.statNumberLarge(color: colors.primary)),
          Text('TL 750.000 (Stat Number)', style: AppTextStyles.statNumber(color: colors.textPrimary)),
          Text('%65 Itibar (Stat Small)', style: AppTextStyles.statNumberSmall(color: colors.secondary)),
          AppSpacing.vGapMd,
          const Divider(),
          AppSpacing.vGapMd,
          Text('Title Large (Poppins 20)', style: AppTextStyles.titleLarge(color: colors.textPrimary)),
          Text('Title Medium (Poppins 16)', style: AppTextStyles.titleMedium(color: colors.textPrimary)),
          Text('Title Small (Poppins 14)', style: AppTextStyles.titleSmall(color: colors.textPrimary)),
          AppSpacing.vGapMd,
          const Divider(),
          AppSpacing.vGapMd,
          Text('Body Large: TV kanal simulasyonunda haftalik yayin akisini planlayin.', style: AppTextStyles.bodyLarge(color: colors.textPrimary)),
          Text('Body Medium: Prime Time kusaginda dizi yayinlamak reytinginizi artirir.', style: AppTextStyles.bodyMedium(color: colors.textSecondary)),
          Text('Body Small: 20:00 - 22:30 arasi yayinlanan program verileri.', style: AppTextStyles.bodySmall(color: colors.textDisabled)),
          AppSpacing.vGapMd,
          const Divider(),
          AppSpacing.vGapMd,
          Text('LABEL LARGE (INTER)', style: AppTextStyles.labelLarge(color: colors.primary)),
          Text('LABEL MEDIUM (INTER)', style: AppTextStyles.labelMedium(color: colors.textSecondary)),
          Text('LABEL SMALL (INTER)', style: AppTextStyles.labelSmall(color: colors.secondary)),
        ],
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Column(
      children: [
        PrimaryButton(
          text: 'Sonraki Gune Gec',
          icon: Icons.fast_forward_rounded,
          onPressed: () {},
        ),
        AppSpacing.vGapMd,
        const PrimaryButton(
          text: 'Yukleniyor Durumu',
          isLoading: true,
          onPressed: null,
        ),
        AppSpacing.vGapMd,
        const PrimaryButton(
          text: 'Devre Disi Birincil Buton',
          onPressed: null,
        ),
        AppSpacing.vGapMd,
        SecondaryButton(
          text: 'Yayin Akisini Sifirla',
          icon: Icons.refresh_rounded,
          onPressed: () {},
        ),
        AppSpacing.vGapMd,
        const SecondaryButton(
          text: 'Devre Disi Ikincil Buton',
          onPressed: null,
        ),
      ],
    );
  }

  Widget _buildCardSection(AppColorTheme colors) {
    return Column(
      children: [
        AppCard(
          title: 'Canli Yayin Studyosu',
          icon: Icons.live_tv_rounded,
          action: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: colors.error.withValues(alpha: 0.15),
              borderRadius: AppSpacing.borderRadiusSmall,
              border: Border.all(color: colors.error),
            ),
            child: Text(
              'ON AIR',
              style: AppTextStyles.labelSmall(color: colors.error),
            ),
          ),
          child: Text(
            'Su anda Prime Time kusaginda "Karanlik Vadi" dizisi yayinda. Izlenme orani %18.4.',
            style: AppTextStyles.bodyMedium(color: colors.textSecondary),
          ),
        ),
        AppSpacing.vGapMd,
        AppCard(
          borderColor: colors.primary,
          child: Row(
            children: [
              Icon(Icons.workspace_premium_rounded, color: colors.primary, size: 28),
              AppSpacing.hGapMd,
              Expanded(
                child: Text(
                  'Ozel Vurgulu Kart: Kanaliniz bu hafta en cok izlenen 3. kanal oldu!',
                  style: AppTextStyles.bodyMedium(color: colors.textPrimary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatTilesSection(AppColorTheme colors) {
    return Row(
      children: [
        Expanded(
          child: StatTile(
            icon: Icons.account_balance_wallet_rounded,
            label: 'Kasa Bakiyesi',
            value: 'TL 750.000',
            trendPercentage: 12.4,
            iconColor: colors.primary,
            onTap: () {},
          ),
        ),
        AppSpacing.hGapMd,
        Expanded(
          child: StatTile(
            icon: Icons.trending_up_rounded,
            label: 'Ortalama Reyting',
            value: '4.8',
            trendPercentage: -2.1,
            iconColor: colors.secondary,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBarsSection(AppColorTheme colors) {
    return AppCard(
      child: Column(
        children: [
          ProgressBarLabeled(
            icon: Icons.star_rounded,
            label: 'Kanal Itibari',
            value: 0.65,
            progressColor: colors.warning,
          ),
          AppSpacing.vGapMd,
          ProgressBarLabeled(
            icon: Icons.calendar_today_rounded,
            label: 'Yayin Kusagi Doluluk Orani',
            value: 0.85,
            progressColor: colors.primary,
          ),
          AppSpacing.vGapMd,
          ProgressBarLabeled(
            icon: Icons.campaign_rounded,
            label: 'Reklam Hedefi',
            value: 0.40,
            progressColor: colors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadgesSection() {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBadge(rating: 2.8, label: 'Dusuk'),
        RatingBadge(rating: 5.4, label: 'Orta'),
        RatingBadge(rating: 8.9, label: 'Yuksek'),
        RatingBadge(rating: 9.3, isLarge: true, label: 'Efsane'),
      ],
    );
  }

  Widget _buildContentTypeChipsSection() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: ContentType.values.map((type) {
        final isSelected = type == _selectedContentType;
        return ContentTypeChip(
          type: type,
          isSelected: isSelected,
          onTap: () {
            setState(() {
              _selectedContentType = type;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildFeedbackSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                text: 'Onay Penceresi Ac',
                icon: Icons.help_outline_rounded,
                onPressed: () async {
                  final result = await ConfirmDialog.show(
                    context,
                    title: 'Bolumu Satin Al',
                    content: 'Bu dizinin yayin haklari icin TL 150.000 odenecektir. Onayliyor musunuz?',
                    confirmText: 'Satin Al',
                    icon: Icons.shopping_cart_outlined,
                  );
                  if (context.mounted && result == true) {
                    AppSnackBar.showSuccess(context, 'Dizi haklari basariyla satin alindi!');
                  }
                },
              ),
            ),
          ],
        ),
        AppSpacing.vGapMd,
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                text: 'Basari Bildirimi',
                icon: Icons.check_circle_outline_rounded,
                onPressed: () => AppSnackBar.showSuccess(context, 'Yeni gun simulasyonu tamamlandi!'),
              ),
            ),
            AppSpacing.hGapSm,
            Expanded(
              child: SecondaryButton(
                text: 'Hata Bildirimi',
                icon: Icons.error_outline_rounded,
                onPressed: () => AppSnackBar.showError(context, 'Kasanizda yeterli bakiye bulunmuyor!'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}