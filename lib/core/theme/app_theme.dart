import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  // ── Koyu Tema (Varsayılan TV Stüdyosu Teması) ──────────
  static ThemeData get darkTheme {
    final textTheme = AppTextStyles.createTextTheme(
      AppColors.darkTextPrimary,
      AppColors.darkTextSecondary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryOrange,
        onPrimary: Colors.white,
        secondary: AppColors.secondaryCyan,
        onSecondary: Colors.black,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,
        error: AppColors.darkError,
        onError: Colors.white,
      ),
      textTheme: textTheme,
      extensions: const [AppColorTheme.dark],

      // ── Card Stili ───────────────────────────────────────
      cardTheme: const CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusCard,
          side: BorderSide(color: AppColors.darkCardBorder, width: 1),
        ),
      ),

      // ── AppBar Stili ─────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleMedium(color: AppColors.darkTextPrimary),
        iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
      ),

      // ── NavigationBar Stili ──────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        elevation: 8,
        height: 64,
        indicatorColor: AppColors.primaryOrange.withValues(alpha: 0.18),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryOrange, size: 24);
          }
          return const IconThemeData(color: AppColors.darkTextSecondary, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall(color: AppColors.primaryOrange);
          }
          return AppTextStyles.labelSmall(color: AppColors.darkTextSecondary);
        }),
      ),

      // ── Buton Stilleri ───────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, AppSpacing.minTouchTarget),
          padding: AppSpacing.paddingButton,
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusButton,
          ),
          textStyle: AppTextStyles.labelLarge(color: Colors.white),
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkTextPrimary,
          minimumSize: const Size(double.infinity, AppSpacing.minTouchTarget),
          padding: AppSpacing.paddingButton,
          side: const BorderSide(color: AppColors.darkCardBorder, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusButton,
          ),
          textStyle: AppTextStyles.labelLarge(color: AppColors.darkTextPrimary),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryOrange,
          minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSmall,
          ),
          textStyle: AppTextStyles.labelMedium(color: AppColors.primaryOrange),
        ),
      ),

      // ── Input Decoration Stili ───────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        hintStyle: AppTextStyles.bodyMedium(color: AppColors.darkTextDisabled),
        labelStyle: AppTextStyles.bodyMedium(color: AppColors.darkTextSecondary),
        border: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusButton,
          borderSide: BorderSide(color: AppColors.darkCardBorder),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusButton,
          borderSide: BorderSide(color: AppColors.darkCardBorder),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusButton,
          borderSide: BorderSide(color: AppColors.primaryOrange, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusButton,
          borderSide: BorderSide(color: AppColors.darkError),
        ),
      ),

      // ── Chip Stili ───────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface,
        disabledColor: AppColors.darkCardBorder,
        selectedColor: AppColors.primaryOrange.withValues(alpha: 0.2),
        secondarySelectedColor: AppColors.primaryOrange,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
        labelStyle: AppTextStyles.labelSmall(color: AppColors.darkTextPrimary),
        secondaryLabelStyle: AppTextStyles.labelSmall(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          side: BorderSide(color: AppColors.darkCardBorder),
        ),
      ),

      // ── Dialog Stili ─────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkCard,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusDialog,
          side: BorderSide(color: AppColors.darkCardBorder),
        ),
        titleTextStyle: AppTextStyles.titleMedium(color: AppColors.darkTextPrimary),
        contentTextStyle: AppTextStyles.bodyMedium(color: AppColors.darkTextSecondary),
      ),

      // ── Bottom Sheet Stili ───────────────────────────────
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.darkCard,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusDialog)),
        ),
      ),

      // ── SnackBar Stili ───────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkCard,
        contentTextStyle: AppTextStyles.bodyMedium(color: AppColors.darkTextPrimary),
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          side: BorderSide(color: AppColors.darkCardBorder),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // ── Divider Stili ────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.darkDivider,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // ── Açık Tema ──────────────────────────────────────────
  static ThemeData get lightTheme {
    final textTheme = AppTextStyles.createTextTheme(
      AppColors.lightTextPrimary,
      AppColors.lightTextSecondary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryOrange,
        onPrimary: Colors.white,
        secondary: AppColors.secondaryCyan,
        onSecondary: Colors.black,
        surface: AppColors.lightCard,
        onSurface: AppColors.lightTextPrimary,
        error: AppColors.lightError,
        onError: Colors.white,
      ),
      textTheme: textTheme,
      extensions: const [AppColorTheme.light],

      cardTheme: const CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusCard,
          side: BorderSide(color: AppColors.lightCardBorder, width: 1),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightCard,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleMedium(color: AppColors.lightTextPrimary),
        iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightCard,
        elevation: 4,
        height: 64,
        indicatorColor: AppColors.primaryOrange.withValues(alpha: 0.15),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryOrange, size: 24);
          }
          return const IconThemeData(color: AppColors.lightTextSecondary, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall(color: AppColors.primaryOrange);
          }
          return AppTextStyles.labelSmall(color: AppColors.lightTextSecondary);
        }),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, AppSpacing.minTouchTarget),
          padding: AppSpacing.paddingButton,
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusButton,
          ),
          textStyle: AppTextStyles.labelLarge(color: Colors.white),
          elevation: 0,
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightCard,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusDialog,
          side: BorderSide(color: AppColors.lightCardBorder),
        ),
        titleTextStyle: AppTextStyles.titleMedium(color: AppColors.lightTextPrimary),
        contentTextStyle: AppTextStyles.bodyMedium(color: AppColors.lightTextSecondary),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.lightDivider,
        thickness: 1,
        space: 1,
      ),
    );
  }
}