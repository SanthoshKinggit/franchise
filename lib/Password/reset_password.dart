// ignore_for_file: unused_field, use_super_parameters, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'dart:async';

import '../colors/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _mobileNumber = '';
  String _otp = '';
  bool _showOTPField = false;
  bool _isOTPSent = false;
  int _otpExpirationTimer = 60;

  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  late AnimationController _animationController;
  late Animation<double> _formAnimation;

  // Use color from prime.dart consistently
  final Color _primaryColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _formAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );
  }

  Future<void> _sendOTP() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Simulated OTP sending - replace with actual API call
        await _simulateSendOTP(_mobileNumberController.text);

        setState(() {
          _showOTPField = true;
          _isOTPSent = true;
          _startOTPExpirationTimer();
          _animationController.forward();
        });
      } catch (e) {
        _showErrorSnackBar('Failed to send OTP. Please try again.');
      }
    }
  }

  Future<void> _simulateSendOTP(String mobileNumber) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    // In a real app, implement actual OTP sending logic
  }

  void _startOTPExpirationTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpExpirationTimer > 0) {
          _otpExpirationTimer--;
        } else {
          timer.cancel();
          _isOTPSent = false;
        }
      });
    });
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      try {
        // Implement actual password reset logic
        _showSuccessSnackBar('Password reset successful!');
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        _showErrorSnackBar('Password reset failed. Please try again.');
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _primaryColor,
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String hintText,
    required IconData iconData,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 219, 219, 219),
          fontFamily: 'Nunito',
          fontSize: 22,
        ),
        prefixIcon: Icon(
          iconData,
          color: Colors.amber,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 249, 249, 249).withOpacity(0.30));
  }

  @override
  void dispose() {
    _mobileNumberController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width * 0.90;
    final screenHeight = MediaQuery.of(context).size.height * 0.90;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
          
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Image.asset(
                        'assets/images/qqqqqqqqqq.png',
                        height: 140,
                      ),
                      const SizedBox(height: 32.0),

                      // Mobile Number Field
                      TextFormField(
                        controller: _mobileNumberController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: 16,
                        ),
                        decoration: _buildInputDecoration(
                          hintText: 'Enter Mobile Number',
                          iconData: Icons.phone,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          // Add more robust phone number validation if needed
                          return null;
                        },
                        onSaved: (value) => _mobileNumber = value ?? '',
                      ),

                      // OTP and Password Fields (when OTP is sent)
                      if (_isOTPSent) ...[
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                          ),
                          decoration: _buildInputDecoration(
                            hintText: 'Enter OTP',
                            iconData: Icons.security,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the OTP';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14.0),
                        Text(
                          'OTP expires in $_otpExpirationTimer seconds',
                          style: TextStyle(
                            color: _primaryColor.withOpacity(0.7),
                            fontFamily: 'Nunito',
                            fontSize: 14,
                          ),
                        ),

                        // New Password Fields
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _newPasswordController,
                          obscureText: !_isNewPasswordVisible,
                          cursorColor: _primaryColor,
                          style: TextStyle(
                            color: _primaryColor,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                          ),
                          decoration: _buildInputDecoration(
                            hintText: 'New Password',
                            iconData: Icons.lock_outline,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isNewPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isNewPasswordVisible =
                                      !_isNewPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a new password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            // Add more password complexity checks if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !_isConfirmPasswordVisible,
                          cursorColor: _primaryColor,
                          style: TextStyle(
                            color: _primaryColor,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                          ),
                          decoration: _buildInputDecoration(
                            hintText: 'Confirm New Password',
                            iconData: Icons.lock,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your new password';
                            }
                            if (value != _newPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ],

                      const SizedBox(height: 32.0),
                      Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 53, 0, 48),
                              const Color.fromARGB(255, 117, 0, 106),
                              const Color.fromARGB(255, 255, 0, 230),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: ElevatedButton(
                          onPressed: _isOTPSent ? _resetPassword : _sendOTP,
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
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 255, 247, 175),
                                    const Color.fromARGB(255, 255, 234, 41),
                                    const Color.fromARGB(255, 192, 144, 0),
                                    const Color.fromARGB(255, 255, 250, 205)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: Text(
                                _isOTPSent ? 'Reset Password' : 'Send OTP',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors
                                      .amber, // Contrast color for better readability
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
