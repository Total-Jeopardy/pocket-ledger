import 'package:flutter/material.dart';

/// PocketLedger brand palette. Field names and structure are the contract
/// other design system files depend on; only the values here changed.
abstract final class AppColors {
  AppColors._();

  // --- Brand ---

  static const Color brandPrimary = Color(0xFF22C55E);
  static const Color brandAccent = Color(0xFF1E293B);

  // --- Surfaces ---

  static const Color surfaceBgLight = Color(0xFFFFFFFF);
  static const Color surfaceBgDark = Color(0xFF0F172A);
  static const Color surfaceCardLight = Color(0xFFF5F5F5);
  static const Color surfaceCardDark = Color(0xFF1E293B);

  // --- Text ---

  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // --- Border ---

  static const Color borderSubtle = Color(0xFFCBD5E1);

  // --- Semantic ---

  static const Color semanticError = Color(0xFFFF8B7C);
  static const Color semanticSuccess = Color(0xFF22C55E);
  static const Color semanticHighlightLight = Color(0xFFEDEDED);
  static const Color semanticHighlightDark = Color(0xFF334155);
}
