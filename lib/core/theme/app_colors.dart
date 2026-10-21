import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Sabitler & Ortak Renkler ───────────────────────────
  static const Color primaryOrange = Color(0xFFFF7A1A);
  static const Color primaryOrangeLight = Color(0xFFFF9447);
  static const Color secondaryCyan = Color(0xFF22D3EE);

  // ── Koyu Tema (TV Stüdyosu Hissi) ──────────────────────
  static const Color darkBackground = Color(0xFF0E1424);
  static const Color darkSurface = Color(0xFF131B2E);
  static const Color darkCard = Color(0xFF172036);
  static const Color darkCardBorder = Color(0xFF1E293B);
  static const Color darkDivider = Color(0xFF1E293B);

  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkTextDisabled = Color(0xFF475569);

  static const Color darkSuccess = Color(0xFF10B981);
  static const Color darkWarning = Color(0xFFF59E0B);
  static const Color darkError = Color(0xFFEF4444);

  // ── Açık Tema Karşılıkları ─────────────────────────────
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFF1F5F9);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightCardBorder = Color(0xFFE2E8F0);
  static const Color lightDivider = Color(0xFFE2E8F0);

  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);
  static const Color lightTextDisabled = Color(0xFF94A3B8);

  static const Color lightSuccess = Color(0xFF16A34A);
  static const Color lightWarning = Color(0xFFD97706);
  static const Color lightError = Color(0xFFDC2626);

  // ── İçerik Türü Renkleri ──────────────────────────────
  static const Color contentTypeDizi = Color(0xFF8B5CF6); // Mor
  static const Color contentTypeFilm = Color(0xFF3B82F6); // Mavi
  static const Color contentTypeYarisma = Color(0xFFEC4899); // Pembe
  static const Color contentTypeGunduz = Color(0xFFF59E0B); // Amber
  static const Color contentTypeTartisma = Color(0xFF06B6D4); // Cyan
  static const Color contentTypeHaber = Color(0xFFEF4444); // Kırmızı
  static const Color contentTypeEglence = Color(0xFF10B981); // Yeşil
}

@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color background;
  final Color surface;
  final Color card;
  final Color cardBorder;
  final Color divider;
  final Color primary;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color error;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;

  const AppColorTheme({
    required this.background,
    required this.surface,
    required this.card,
    required this.cardBorder,
    required this.divider,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
  });

  static const AppColorTheme dark = AppColorTheme(
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    card: AppColors.darkCard,
    cardBorder: AppColors.darkCardBorder,
    divider: AppColors.darkDivider,
    primary: AppColors.primaryOrange,
    secondary: AppColors.secondaryCyan,
    success: AppColors.darkSuccess,
    warning: AppColors.darkWarning,
    error: AppColors.darkError,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    textDisabled: AppColors.darkTextDisabled,
  );

  static const AppColorTheme light = AppColorTheme(
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    card: AppColors.lightCard,
    cardBorder: AppColors.lightCardBorder,
    divider: AppColors.lightDivider,
    primary: AppColors.primaryOrange,
    secondary: AppColors.secondaryCyan,
    success: AppColors.lightSuccess,
    warning: AppColors.lightWarning,
    error: AppColors.lightError,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    textDisabled: AppColors.lightTextDisabled,
  );

  @override
  AppColorTheme copyWith({
    Color? background,
    Color? surface,
    Color? card,
    Color? cardBorder,
    Color? divider,
    Color? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
  }) {
    return AppColorTheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      cardBorder: cardBorder ?? this.cardBorder,
      divider: divider ?? this.divider,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
    );
  }

  @override
  AppColorTheme lerp(ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) {
      return this;
    }
    return AppColorTheme(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
    );
  }
}

extension AppColorsContextX on BuildContext {
  AppColorTheme get colors {
    return Theme.of(this).extension<AppColorTheme>() ?? AppColorTheme.dark;
  }
}
