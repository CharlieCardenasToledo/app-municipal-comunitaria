import 'package:flutter/material.dart';

/// Complete color palette for the Zamora Conecta design system.
/// Based on the DESIGN.md spec with tonal layering architecture.
class AppColors {
  AppColors._();

  // ─── Brand Colors ────────────────────────────────────────────
  static const Color primary = Color(0xFF0040A1);
  static const Color primaryContainer = Color(0xFF0056D2);
  static const Color primaryFixed = Color(0xFFDAE2FF);
  static const Color primaryFixedDim = Color(0xFFB2C5FF);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryFixed = Color(0xFF001847);
  static const Color onPrimaryFixedVariant = Color(0xFF0040A1);
  static const Color onPrimaryContainer = Color(0xFFCCD8FF);

  static const Color secondary = Color(0xFF1B6D24);
  static const Color secondaryContainer = Color(0xFFA0F399);
  static const Color secondaryFixed = Color(0xFFA3F69C);
  static const Color secondaryFixedDim = Color(0xFF88D982);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryFixed = Color(0xFF002204);
  static const Color onSecondaryFixedVariant = Color(0xFF005312);
  static const Color onSecondaryContainer = Color(0xFF217128);

  static const Color tertiary = Color(0xFF862300);
  static const Color tertiaryContainer = Color(0xFFAC350A);
  static const Color tertiaryFixed = Color(0xFFFFDBD0);
  static const Color tertiaryFixedDim = Color(0xFFFFB59F);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryFixed = Color(0xFF3A0A00);
  static const Color onTertiaryFixedVariant = Color(0xFF852300);
  static const Color onTertiaryContainer = Color(0xFFFFCEC0);

  // ─── Surface Colors (Tonal Layering) ────────────────────────
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceBright = Color(0xFFF8F9FA);
  static const Color surfaceDim = Color(0xFFD9DADB);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF3F4F5);
  static const Color surfaceContainer = Color(0xFFEDEEEF);
  static const Color surfaceContainerHigh = Color(0xFFE7E8E9);
  static const Color surfaceContainerHighest = Color(0xFFE1E3E4);
  static const Color surfaceVariant = Color(0xFFE1E3E4);
  static const Color onSurface = Color(0xFF191C1D);
  static const Color onSurfaceVariant = Color(0xFF424654);

  // ─── Background ─────────────────────────────────────────────
  static const Color background = Color(0xFFF8F9FA);
  static const Color onBackground = Color(0xFF191C1D);

  // ─── Outline ────────────────────────────────────────────────
  static const Color outline = Color(0xFF737785);
  static const Color outlineVariant = Color(0xFFC3C6D6);

  // ─── Error ──────────────────────────────────────────────────
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ─── Inverse ────────────────────────────────────────────────
  static const Color inverseSurface = Color(0xFF2E3132);
  static const Color inverseOnSurface = Color(0xFFF0F1F2);
  static const Color inversePrimary = Color(0xFFB2C5FF);

  // ─── Surface Tint ──────────────────────────────────────────
  static const Color surfaceTint = Color(0xFF0056D2);
}
