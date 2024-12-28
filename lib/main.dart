import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure this import is correct
import 'package:myapp/loginpage/Login_Screen.dart';

import 'bottomscreen/bottom_screen.dart';
import 'Splashscreen/splash_screen.dart';

// Main Function
void main() {
  runApp(MultiVendorApp());
}

// Main App Configuration
class MultiVendorApp extends StatelessWidget {
  const MultiVendorApp({super.key});

  void _handleAnimationComplete(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => BottomBarscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String logoPath =
        'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png';

    final Color primaryColor = Color.fromARGB(255, 87, 0, 78);
    return MaterialApp(
      title: 'Franchise Management',
      theme: AppTheme.lightTheme,
      home: TopToBottomCoinsAnimation(
        logoPath: logoPath,
        primaryColor: primaryColor,
        onAnimationComplete: (context) => _handleAnimationComplete(context),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Color Palette
class AppColors {
  static const Color primaryPurple =
      Color(0xFF75006A); // Color.fromARGB(255, 117, 0, 106)
  static const Color secondaryPurple = Color(0xFF483D8B);
  static const Color backgroundWhite = Color(0xFFF5F5F5);
  static const Color textBlack = Color(0xFF1A1A1A);
  static const Color accentPurple = Color(0xFF8A4FFF);

  static var scaffoldGradient;
}

// App Theme
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryPurple,
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        // Use GoogleFonts correctly
        displayLarge: TextStyle(
          color: AppColors.textBlack,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textBlack,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryPurple,
        secondary: AppColors.secondaryPurple,
        background: AppColors.backgroundWhite,
      ),
    );
  }
}
