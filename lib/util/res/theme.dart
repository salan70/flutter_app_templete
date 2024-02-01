import 'package:flutter/material.dart';

/// Migrating a Flutter app to Material 3
/// https://blog.codemagic.io/migrating-a-flutter-app-to-material-3/

const _lineFontFamily = 'LINESeedJP';

ThemeData getAppTheme() {
  final base = ThemeData(
    fontFamily: _lineFontFamily,
    useMaterial3: true,
  );
  return base;
}

ThemeData getAppThemeDark() {
  final base = ThemeData(
    fontFamily: _lineFontFamily,
    useMaterial3: true,
  );
  return base;
}
