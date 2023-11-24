import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onError.withOpacity(1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.purple500.withOpacity(0.72),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.h),
          ),
          shadowColor: colorScheme.primary,
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primaryContainer,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray200,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray80001,
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray600,
          fontSize: 14.fSize,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.primary.withOpacity(0.8),
          fontSize: 11.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 38.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 30.fSize,
          fontFamily: 'Advent Pro',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 25.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray700,
          fontSize: 13.fSize,
          fontFamily: 'Noto Sans KR',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary.withOpacity(0.8),
          fontSize: 11.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onError.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 15.fSize,
          fontFamily: 'Advent Pro',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X3F000000),
    primaryContainer: Color(0XFF181D20),
    secondaryContainer: Color(0XFF2574FF),

    // Error colors
    errorContainer: Color(0XD348BAF9),
    onError: Color(0X7EFFFFFF),

    // On colors(text colors)
    onPrimary: Color(0XFF2F2D51),
    onPrimaryContainer: Color(0XFF9DB2CE),
    onSecondaryContainer: Color(0XCE270644),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF080808);

  // Blue
  Color get blue500 => Color(0XFF189FFA);
  Color get blueA700 => Color(0XFF016DFF);

  // BlueDd
  Color get blue900Dd => Color(0XDD0B4397);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray50 => Color(0XFFE8EEF3);
  Color get blueGray600 => Color(0XFF646E77);
  Color get blueGray900 => Color(0XFF333333);

  // DeepPurple
  Color get deepPurple50 => Color(0XFFEBE1FA);
  Color get deepPurple5001 => Color(0XFFEBE2FB);

  // Gray
  Color get gray100 => Color(0XFFEDF5FA);
  Color get gray200 => Color(0XFFEEEEEF);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray600 => Color(0XFF7B7B7B);
  Color get gray700 => Color(0XFF666666);
  Color get gray800 => Color(0XFF484242);
  Color get gray80001 => Color(0XFF484343);
  Color get gray900 => Color(0XFF222222);

  // Indigo
  Color get indigo50 => Color(0XFFE1E8FB);
  Color get indigoA400 => Color(0XFF386BF6);
  Color get indigoA700 => Color(0XFF0949EB);

  // Orange
  Color get orangeA200 => Color(0XFFFFAC4B);

  // Purple
  Color get purple500 => Color(0XFFAC0491);
  Color get purple600 => Color(0XFF8A09B7);

  // Red
  Color get red100 => Color(0XFFFFC9C9);

  // Yellow
  Color get yellow100 => Color(0XFFFFE9C9);
  Color get yellowA400 => Color(0XFFFFEB00);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
