import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woodcore_assessment/core/utils/theme/app_colors.dart';
import 'package:woodcore_assessment/core/utils/theme/app_textstyles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    // appBarTheme: AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // White icons
        statusBarBrightness: Brightness.dark, // For iOS
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
    ),
    splashFactory: NoSplash.splashFactory,

    scaffoldBackgroundColor: AppColors.lightGray,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      primary: AppColors.primaryBlue,
      secondary: AppColors.mediumGray,
      background: AppColors.lightGray,
      surface: AppColors.white,
      onPrimary: AppColors.white,
      onBackground: AppColors.darkGray,
      onSurface: AppColors.darkGray,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      displaySmall: AppTextStyle.displaySmall,
      headlineLarge: AppTextStyle.headlineLarge,
      headlineSmall: AppTextStyle.headlineSmall,
      labelLarge: AppTextStyle.labelLarge,
      labelMedium: AppTextStyle.labelMedium,
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
    ),
  );
}
