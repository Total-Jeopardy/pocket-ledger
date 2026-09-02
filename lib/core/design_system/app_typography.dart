import 'package:flutter/material.dart';

/// Typography tokens for the design system.
///
/// Uses platform default font (no extra font packages).
abstract final class AppTypography {
  AppTypography._();

  static const FontWeight _bold = FontWeight.w700;

  /// Screen titles (not used in header).
  static const TextStyle h1 = TextStyle(fontSize: 32, fontWeight: _bold);

  /// Major section titles.
  static const TextStyle h2 = TextStyle(fontSize: 28, fontWeight: _bold);

  /// Detail screen title in app bars.
  static const TextStyle h3 = TextStyle(fontSize: 24, fontWeight: _bold);

  /// Large body — list row primary title.
  static const TextStyle bodyLg = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  /// Standard body text.
  static const TextStyle bodyMd = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// Alias matching common UI naming; same as [bodyMd].
  static const TextStyle body = bodyMd;

  /// Secondary / subdued text.
  static const TextStyle bodySm = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// Small labels — bottom nav, captions.
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  /// Readable body at a user-selected size (e.g. accessibility presets).
  static TextStyle scaledBody({required double fontSizeSp}) =>
      TextStyle(fontSize: fontSizeSp, fontWeight: FontWeight.w400);
}
