import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── Büyük Sayılar / İstatistikler (Poppins) ────────────
  static TextStyle statNumber({Color? color}) => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
        color: color,
      );

  static TextStyle statNumberLarge({Color? color}) => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: -1.0,
        color: color,
      );

  static TextStyle statNumberSmall({Color? color}) => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        color: color,
      );

  // ── Başlıklar (Poppins) ────────────────────────────────
  static TextStyle titleLarge({Color? color}) => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        color: color,
      );

  static TextStyle titleMedium({Color? color}) => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: color,
      );

  static TextStyle titleSmall({Color? color}) => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: color,
      );

  // ── Gövde Metinleri (Inter) ────────────────────────────
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: color,
      );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: color,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: color,
      );

  // ── Etiketler & Butonlar (Inter) ───────────────────────
  static TextStyle labelLarge({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
        color: color,
      );

  static TextStyle labelMedium({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: color,
      );

  static TextStyle labelSmall({Color? color}) => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: color,
      );

  // ── TextTheme Oluşturucu (ThemeData için) ──────────────
  static TextTheme createTextTheme(Color primaryTextColor, Color secondaryTextColor) {
    return TextTheme(
      displayLarge: statNumberLarge(color: primaryTextColor),
      displayMedium: statNumber(color: primaryTextColor),
      displaySmall: statNumberSmall(color: primaryTextColor),
      titleLarge: titleLarge(color: primaryTextColor),
      titleMedium: titleMedium(color: primaryTextColor),
      titleSmall: titleSmall(color: primaryTextColor),
      bodyLarge: bodyLarge(color: primaryTextColor),
      bodyMedium: bodyMedium(color: primaryTextColor),
      bodySmall: bodySmall(color: secondaryTextColor),
      labelLarge: labelLarge(color: primaryTextColor),
      labelMedium: labelMedium(color: secondaryTextColor),
      labelSmall: labelSmall(color: secondaryTextColor),
    );
  }
}
