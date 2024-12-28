import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors.dart';

class RestaurantDetailPage extends StatelessWidget {
  final String image;
  final String shopName;

  RestaurantDetailPage({required this.image, required this.shopName});

  @override
  Widget build(BuildContext context) {
    // Get device screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image Section
              Stack(
                children: [
                  Container(
                    height: screenSize.height * 0.35, // 35% of screen height
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 16,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.black.withOpacity(0.4)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          shopName,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize:
                                screenSize.width * 0.06, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Filter Section
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.tune_outlined,
                            color: Colors.white, size: 24),
                        SizedBox(width: 8),
                        Text(
                          'Earnings History',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(Icons.sort, color: Colors.white),
                  ],
                ),
              ),

              // Details Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildDetailRow('Transaction id:', '49719739727484'),
                    _buildDetailRow('Total Purchase Amount', '₹ 44343',
                        isGreen: true),
                    _buildDetailRow('Today Earnings', '₹ 34343', isGreen: true),
                    _buildDetailRow('Commission', '₹ 2343', isGreen: true),
                  ],
                ),
              ),

              // Date and Time Section
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: 21/12/2020',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Time: 03:33 PM',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Contact Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    _buildDetailRow('Contact Number:', '+91 9438762343'),
                    _buildDetailRow('Email Id:', 'fastdelivery@gmail.com'),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),

              // Bottom padding
              SizedBox(height: 180),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isGreen = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isGreen ? Color(0xFF25E235) : Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
