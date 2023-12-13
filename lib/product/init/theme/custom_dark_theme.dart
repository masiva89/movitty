import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/init/index.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        appBarTheme: CustomAppBarTheme.appBarTheme,
        bottomSheetTheme: CustomBottomsheetTheme.bottomSheetThemeData,
        splashColor: ColorName.primary2.withOpacity(0.2),
        highlightColor: ColorName.primary2.withOpacity(0.2),
        scaffoldBackgroundColor: ColorName.backgroundPrimary,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
