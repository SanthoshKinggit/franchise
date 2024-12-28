// ignore_for_file: prefer_const_constructors, unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottomscreen/bottom_screen.dart';
import '../colors/colors.dart';
import '../homescreen/dhashbroad.dart';
import '../Password/reset_password.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  // Add controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // To allow vertical scrolling
        physics: BouncingScrollPhysics(),
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      screenWidth * 0.06, // Responsive horizontal padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    // Logo Image
                    Image.asset(
                      'assets/images/image-removebg-preview.png',
                      height: screenHeight * 0.2,
                      width: double.infinity,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Log in your Account',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 227, 170, 0),
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Email TextField
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: _isEmailValid,
                      screenWidth: screenWidth,
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Password TextField
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: !_isPasswordVisible,
                      validator: _isPasswordValid,
                      screenWidth: screenWidth,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // Remember me checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(color: Colors.grey[500]!),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Sign in button
                    Container(
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 49, 48, 48),
                          const Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(255, 49, 48, 48),
                        ]),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ],
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Transparent to show the gradient
                          shadowColor: Colors
                              .transparent, // No shadow for clean gradient
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBarscreen()),
                          );

                          final snackBar = SnackBar(
                            content: Center(child: Text('Login Successful')),
                            backgroundColor: Colors.black87, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Apply border radius
                            ),
                            behavior: SnackBarBehavior
                                .floating, // Make the SnackBar floating
                            margin: EdgeInsets.symmetric(
                                horizontal: 80.0,
                                vertical: 10.0), // Margin to center it
                            duration: Duration(
                                seconds: 3), // Snackbar display duration
                          );

                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar); // Show
                        },
                        child: Center(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  Color(0xFFFFD700), // Bright gold
                                  Color(0xFFFFE135), // Light gold
                                  Color(0xFFC5A000), // Dark gold
                                  Color(0xFFFFD700),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors
                                    .white, // Contrast color for better readability
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: const Color.fromARGB(255, 255, 196, 0),
                            fontSize: screenWidth * 0.035,
                          ),
                        )),

                    SizedBox(height: screenHeight * 0.06),
                    Text(
                      'or Login With',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: const Color.fromARGB(255, 255, 196, 0),
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: Image.asset(
                            'assets/images/Google_Icons-09-512.webp',
                            height: 40,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              'assets/images/apple-logo-transparent.png',
                              height: 40,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              'assets/images/Facebook_Logo_2023.png',
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Center(
                    //   child: InkWell(
                    //     onTap: () {
                    //       // Navigator.push(
                    //       //   context,
                    //       //   MaterialPageRoute(builder: (context) => Homepage1()),
                    //       // );
                    //     },
                    //     child: RichText(
                    //       text: TextSpan(
                    //         text: "Create New Account  ",
                    //         style: TextStyle(
                    //           fontFamily: 'Nunito',
                    //           color: const Color.fromARGB(255, 255, 255, 255),
                    //           fontSize: screenWidth * 0.035,
                    //         ),
                    //         children: const [
                    //           TextSpan(
                    //             text: "  Create Account",
                    //             style: TextStyle(
                    //               fontFamily: 'Nunito',
                    //               color: Colors.amber,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required bool Function(String) validator,
    required double screenWidth,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: const Color.fromARGB(255, 255, 255, 255),
      onChanged: (value) {
        setState(() {}); // Rebuild to show validation
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 212, 212, 212),
          fontFamily: 'Nunito',
          fontSize: screenWidth * 0.04,
        ),
        prefixIcon:
            Icon(prefixIcon, color: const Color.fromARGB(255, 255, 255, 255)),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 247, 247, 247).withOpacity(0.30),
      ),
    );
  }

  // Validation methods
  bool _isEmailValid(String email) {
    if (email.isEmpty) return true; // Don't show error for empty field
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.isEmpty) return true; // Don't show error for empty field
    return password.length >= 6;
  }

  bool _isFormValid() {
    return _isEmailValid(_emailController.text) &&
        _isPasswordValid(_passwordController.text) &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
