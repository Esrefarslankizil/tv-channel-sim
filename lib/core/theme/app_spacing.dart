import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // ── Boşluk Ölçekleri (Spacing Scale) ───────────────────
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;

  // ── Dokunmatik Hedef Sabiti (WCAG / Touch Target) ──────
  static const double minTouchTarget = 48.0;

  // ── Köşe Yuvarlaklığı Sabitleri (Border Radius) ────────
  static const double radiusXs = 4.0;
  static const double radiusSmall = 8.0;
  static const double radiusButton = 12.0;
  static const double radiusCard = 16.0;
  static const double radiusDialog = 20.0;
  static const double radiusPill = 999.0;

  static const BorderRadius borderRadiusXs = BorderRadius.all(Radius.circular(radiusXs));
  static const BorderRadius borderRadiusSmall = BorderRadius.all(Radius.circular(radiusSmall));
  static const BorderRadius borderRadiusButton = BorderRadius.all(Radius.circular(radiusButton));
  static const BorderRadius borderRadiusCard = BorderRadius.all(Radius.circular(radiusCard));
  static const BorderRadius borderRadiusDialog = BorderRadius.all(Radius.circular(radiusDialog));
  static const BorderRadius borderRadiusPill = BorderRadius.all(Radius.circular(radiusPill));

  // ── EdgeInsets Hazır Sabitleri ─────────────────────────
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  static const EdgeInsets paddingCard = EdgeInsets.all(lg);
  static const EdgeInsets paddingScreen = EdgeInsets.all(lg);
  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingButton = EdgeInsets.symmetric(horizontal: xl, vertical: md);

  // ── SizedBox Boşlukları (Gaps) ─────────────────────────
  static const SizedBox gapXs = SizedBox(width: xs, height: xs);
  static const SizedBox gapSm = SizedBox(width: sm, height: sm);
  static const SizedBox gapMd = SizedBox(width: md, height: md);
  static const SizedBox gapLg = SizedBox(width: lg, height: lg);
  static const SizedBox gapXl = SizedBox(width: xl, height: xl);
  static const SizedBox gapXxl = SizedBox(width: xxl, height: xxl);

  static const SizedBox hGapXs = SizedBox(width: xs);
  static const SizedBox hGapSm = SizedBox(width: sm);
  static const SizedBox hGapMd = SizedBox(width: md);
  static const SizedBox hGapLg = SizedBox(width: lg);
  static const SizedBox hGapXl = SizedBox(width: xl);
  static const SizedBox hGapXxl = SizedBox(width: xxl);

  static const SizedBox vGapXs = SizedBox(height: xs);
  static const SizedBox vGapSm = SizedBox(height: sm);
  static const SizedBox vGapMd = SizedBox(height: md);
  static const SizedBox vGapLg = SizedBox(height: lg);
  static const SizedBox vGapXl = SizedBox(height: xl);
  static const SizedBox vGapXxl = SizedBox(height: xxl);
}
