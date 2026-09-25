import 'package:flutter/material.dart';

/// Complete color palette for the Mi Zamora design system.
/// Based on the DESIGN.md spec with tonal layering architecture.
class AppColors {
  AppColors._();

  // ─── Brand Colors ────────────────────────────────────────────
  static const Color primary = Color(0xFF0B5B4F);
  static const Color primaryContainer = Color(0xFF0E806A);
  static const Color primaryFixed = Color(0xFFD3EFE1);
  static const Color primaryFixedDim = Color(0xFFA9D9C6);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryFixed = Color(0xFF06362F);
  static const Color onPrimaryFixedVariant = Color(0xFF0B5B4F);
  static const Color onPrimaryContainer = Color(0xFFDFF8EC);

  static const Color secondary = Color(0xFFB96E2B);
  static const Color secondaryContainer = Color(0xFFF6D7A8);
  static const Color secondaryFixed = Color(0xFFF5D19E);
  static const Color secondaryFixedDim = Color(0xFFE6B776);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryFixed = Color(0xFF3D210A);
  static const Color onSecondaryFixedVariant = Color(0xFF704019);
  static const Color onSecondaryContainer = Color(0xFF60320F);

  static const Color tertiary = Color(0xFFB54F3A);
  static const Color tertiaryContainer = Color(0xFFD76548);
  static const Color tertiaryFixed = Color(0xFFFFD7CA);
  static const Color tertiaryFixedDim = Color(0xFFFFB5A3);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryFixed = Color(0xFF44150D);
  static const Color onTertiaryFixedVariant = Color(0xFF7C2E20);
  static const Color onTertiaryContainer = Color(0xFFFFE1D8);

  // ─── Surface Colors (Tonal Layering) ────────────────────────
  static const Color surface = Color(0xFFF7F6EF);
  static const Color surfaceBright = Color(0xFFF7F6EF);
  static const Color surfaceDim = Color(0xFFD7DCD1);
  static const Color surfaceContainerLowest = Color(0xFFFFFDF7);
  static const Color surfaceContainerLow = Color(0xFFF1F2E8);
  static const Color surfaceContainer = Color(0xFFEAEDE0);
  static const Color surfaceContainerHigh = Color(0xFFE2E7DA);
  static const Color surfaceContainerHighest = Color(0xFFDCE1D4);
  static const Color surfaceVariant = Color(0xFFDCE1D4);
  static const Color onSurface = Color(0xFF1A231D);
  static const Color onSurfaceVariant = Color(0xFF45534A);

  // ─── Background ─────────────────────────────────────────────
  static const Color background = Color(0xFFF7F6EF);
  static const Color onBackground = Color(0xFF1A231D);

  // ─── Outline ────────────────────────────────────────────────
  static const Color outline = Color(0xFF6D7C71);
  static const Color outlineVariant = Color(0xFFC2CEC2);

  // ─── Error ──────────────────────────────────────────────────
  static const Color error = Color(0xFFBA3D2B);
  static const Color errorContainer = Color(0xFFFFDAD2);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF6F1C12);

  // ─── Inverse ────────────────────────────────────────────────
  static const Color inverseSurface = Color(0xFF2A332D);
  static const Color inverseOnSurface = Color(0xFFF0F4EC);
  static const Color inversePrimary = Color(0xFFA9D9C6);

  // ─── Surface Tint ──────────────────────────────────────────
  static const Color surfaceTint = Color(0xFF0E806A);
}
