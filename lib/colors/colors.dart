import 'package:flutter/material.dart';

// Common Colors
class AppColors {
  static const Color primaryColor = Color(0xFFCEA2FD); // Base color
  static const Color darkPrimaryColor =
      Colors.black; // Dark variant of the base color
  static const Color purpleColor = Color(0xFF743089); // Active color
  static const Color secondaryColor = Color(0xFFA865B5);
  static const Color darkSecondaryColor =
      Color.fromARGB(255, 13, 0, 15); // Inactive thumb

  static const Color mainColor = Color(0xFF670053);
  static const Color smalltextColor = Colors.white;
  static const Color appBarColor = Color.fromARGB(255, 80, 2, 64);

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFFFFD700), // Bright gold
      Color(0xFFFFE135), // Light gold
      Color(0xFFC5A000), // Dark gold
      Color(0xFFFFD700),
    ],

    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: [0.1, 0.5, 1.4],
  );
  // Gradients
  static const LinearGradient blackGradient = LinearGradient(
    colors: [
      Colors.black,
      Color.fromARGB(255, 49, 48, 48),

      // Color(0xFF670053),
      // Color.fromARGB(255, 77, 76, 76), // Center color (dark grey)
      Colors.black,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: [0.1, 0.5, 1.4],
  );
  static const LinearGradient bottombarGradient = LinearGradient(
    colors: [
      Colors.black,
      Color.fromARGB(255, 109, 108, 108),

      // Color(0xFF670053),
      // Color.fromARGB(255, 77, 76, 76), // Center color (dark grey)
      Colors.black,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    // stops: [0.1, 0.5, 1.4],
  );
  static Shader goldPurpleShader(Rect bounds) {
    return LinearGradient(
      colors: [
        Color(0xFFFFD700), // Bright gold
        Color(0xFFFFE135), // Light gold
        Color(0xFFC5A000), // Dark gold
        Color(0xFFFFD700), // Bright gold
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
  }

  static const LinearGradient scaffoldGradient = LinearGradient(
    colors: [
      Colors.black,
      Color.fromARGB(255, 49, 48, 48),
      // Color.fromARGB(255, 80, 2, 64),
      // Color.fromARGB(255, 77, 76, 76), // Center color (dark grey)
      Colors.black,
      //  Color.fromARGB(255, 80, 2, 64),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.5, 1.4],
  );

  static const LinearGradient bannerGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 73, 73, 73),
      Colors.black,
      Color.fromARGB(255, 73, 73, 73),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [
      Color(0xFFFFD700), // Bright gold
      Color(0xFFFFE135), // Light gold
      Color(0xFFC5A000), // Dark gold
      Color(0xFFFFD700), // Bright gold
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.4, 1.4],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Colors.black,
      Color(0xFF670053),
      // Color.fromARGB(255, 77, 76, 76), // Center color (dark grey)
      Colors.black,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: [0.0, 0.3, 0.7, 1.0],
  );

  static const LinearGradient whiteGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 233, 208, 228),
      Colors.white,
      Color.fromARGB(255, 233, 208, 228),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: [0.0, 0.3, 0.7, 1.0],
  );

  static Shader pinkPurpleShader(Rect bounds) {
    return LinearGradient(
      colors: [
        Colors.black,
        Color.fromARGB(255, 80, 2, 64),
        // Color.fromARGB(255, 77, 76, 76), // Center color (dark grey)
        Colors.black,
//  Color(0xFF670053)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
  }

  static Shader goldenPurpleShader(Rect bounds) {
    return LinearGradient(
      colors: [
        Color(0xFFFFD700), // Bright gold
        Color(0xFFFFE135), // Light gold
        Color(0xFFC5A000), // Dark gold
        Color(0xFFFFD700)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
  }

  static Shader primaryPurpleShader(Rect bounds) {
    return LinearGradient(
      colors: [Color(0xFF743089), Color(0xFFA865B5)], // Gradient colors
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0], // Adjust stops to control where the colors change
    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
  }

  static const LinearGradient textGradient = LinearGradient(
    colors: [
      Color(0xFF743089), // Start color
      Color(0xFFA865B5), // End color
    ],
    tileMode: TileMode.clamp,
  );

  static const LinearGradient text2Gradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 226, 2, 181),
      Color.fromARGB(255, 191, 86, 240),
    ],
    tileMode: TileMode.clamp,
  );

  static const LinearGradient iconGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 226, 2, 181), // Start color
      Color.fromARGB(255, 191, 86, 240), // End color
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color getPrimaryColor(bool isDarkMode) {
    return isDarkMode ? darkPrimaryColor : primaryColor;
  }

  static Color getSecondaryColor(bool isDarkMode) {
    return isDarkMode ? darkSecondaryColor : secondaryColor;
  }

  static LinearGradient getGradient(bool isDarkMode) {
    return isDarkMode ? goldGradient : purpleGradient;
  }
}
