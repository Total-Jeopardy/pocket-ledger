import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_color_scheme.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class AppTheme {
  static const TextTheme _textTheme = TextTheme(
    displayLarge: AppTypography.h1,
    displayMedium: AppTypography.h2,
    displaySmall: AppTypography.h3,
    headlineLarge: AppTypography.h1,
    headlineMedium: AppTypography.h2,
    headlineSmall: AppTypography.h3,
    titleLarge: AppTypography.bodyLg,
    titleMedium: AppTypography.bodyMd,
    titleSmall: AppTypography.bodySm,
    bodyLarge: AppTypography.bodyLg,
    bodyMedium: AppTypography.bodyMd,
    bodySmall: AppTypography.bodySm,
    labelLarge: AppTypography.caption,
    labelMedium: AppTypography.caption,
    labelSmall: AppTypography.caption,
  );

  static ThemeData light() {
    const colors = AppColorScheme.light;
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.brandPrimary,
        secondary: AppColors.brandAccent,
        surface: AppColors.surfaceBgLight,
        error: AppColors.semanticError,
      ),
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme(colors),
      navigationBarTheme: _navigationBarTheme(colors),
      extensions: const [AppColorScheme.light],
    );
  }

  static ThemeData dark() {
    const colors = AppColorScheme.dark;
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.brandPrimary,
        secondary: AppColors.brandAccent,
        surface: AppColors.surfaceBgDark,
        error: AppColors.semanticError,
      ),
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme(colors),
      navigationBarTheme: _navigationBarTheme(colors),
      extensions: const [AppColorScheme.dark],
    );
  }

  static InputDecorationTheme _inputDecorationTheme(AppColorScheme colors) {
    return InputDecorationTheme(
      labelStyle: TextStyle(color: colors.textSecondary),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colors.borderSubtle),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colors.accentIndicator),
      ),
    );
  }

  static NavigationBarThemeData _navigationBarTheme(AppColorScheme colors) {
    return NavigationBarThemeData(
      backgroundColor: colors.surfaceCard,
      indicatorColor: colors.accentIndicator.withValues(alpha: 0.2),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return AppTypography.caption.copyWith(
          color: isSelected ? colors.accentIndicator : colors.textSecondary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: isSelected ? colors.accentIndicator : colors.textSecondary,
        );
      }),
    );
  }
}
