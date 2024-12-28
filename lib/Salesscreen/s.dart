import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../bottomscreen/bottom_screen.dart';
import '../colors/colors.dart';
import 'sales.dart';
import 'salesdetails.dart';

class SalesEarningsDetailsScreen extends StatefulWidget {
  const SalesEarningsDetailsScreen({super.key});

  @override
  _SalesEarningsDetailsScreenState createState() =>
      _SalesEarningsDetailsScreenState();
}

class _SalesEarningsDetailsScreenState
    extends State<SalesEarningsDetailsScreen> {
  final List<Map<String, dynamic>> _salesData = [
    {
      'shop': 'Main Store Downtown',
      'totalEarnings': 5600.50,
      'date': '2024-01-15T12:00:00',
      'image':
          'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
      'products': [
        {'name': 'Electronics', 'revenue': 25000.00},
        {'name': 'Clothing', 'revenue': 18000.00},
        {'name': 'Accessories', 'revenue': 13000.50},
      ]
    },
    {
      'shop': 'City Branch Plaza',
      'totalEarnings': 4200.75,
      'date': '2024-01-16T14:30:00',
      'image': 'assets/images/Screenshot 2024-12-21 111758.png',
      // Added image path
      'products': [
        {'name': 'Home Goods', 'revenue': 20000.00},
        {'name': 'Kitchen Appliances', 'revenue': 12000.75},
        {'name': 'Home Decor', 'revenue': 10000.00},
      ]
    },
    {
      'shop': 'Online Store Platform',
      'totalEarnings': 7800.25,
      'date': '2024-01-17T08:15:00',
      'image':
          'assets/images/Screenshot 2024-12-21 111959.png', // Added image path
      'products': [
        {'name': 'Tech Gadgets', 'revenue': 35000.00},
        {'name': 'Fashion', 'revenue': 28000.25},
        {'name': 'Beauty Products', 'revenue': 15000.00},
      ]
    },
    {
      'shop': 'Suburban Mall Branch',
      'totalEarnings': 3500.00,
      'date': '2024-01-18T17:45:00',
      'image':
          'assets/images/Screenshot 2024-12-21 111829.png', // Added image path
      'products': [
        {'name': 'Sports Equipment', 'revenue': 15000.00},
        {'name': 'Outdoor Gear', 'revenue': 12000.00},
        {'name': 'Fitness Accessories', 'revenue': 8000.00},
      ]
    },
    {
      'shop': 'Airport Convenience Store',
      'totalEarnings': 2200.50,
      'date': '2024-01-19T13:00:00',
      'image':
          'assets/images/Screenshot 2024-12-21 111758.png', // Added image path
// Added image path
      'products': [
        {'name': 'Travel Accessories', 'revenue': 10000.00},
        {'name': 'Snacks & Drinks', 'revenue': 7500.50},
        {'name': 'Electronics', 'revenue': 4500.00},
      ]
    },
    {
      'shop': 'University Campus Store',
      'totalEarnings': 4500.75,
      'date': '2024-01-20T09:30:00',
      'image':
          'assets/images/Screenshot 2024-12-21 111546.png', // Added image path
      // Added image path
      'products': [
        {'name': 'Textbooks', 'revenue': 20000.00},
        {'name': 'School Supplies', 'revenue': 15000.75},
        {'name': 'University Merchandise', 'revenue': 10000.00},
      ]
    },
    {
      'shop': 'Beachfront Boutique',
      'totalEarnings': 3300.25,
      'date': '2024-01-21T16:00:00',
      'image':
          'assets/images/Screenshot 2024-12-21 112024.png', // Added image path
      // Added image path
      'products': [
        {'name': 'Swimwear', 'revenue': 15000.00},
        {'name': 'Beach Accessories', 'revenue': 10000.25},
        {'name': 'Sunscreen & Cosmetics', 'revenue': 8000.00},
      ]
    },
    {
      'shop': 'Mountain Resort Gift Shop',
      'totalEarnings': 2800.00,
      'date': '2024-01-22T10:30:00',
      'image':
          'assets/images/Screenshot 2024-12-21 111959.png', // Added image path
      // Added image path
      'products': [
        {'name': 'Outdoor Clothing', 'revenue': 12000.00},
        {'name': 'Hiking Gear', 'revenue': 10000.00},
        {'name': 'Souvenirs', 'revenue': 6000.00},
      ]
    },
    {
      'shop': 'Premium Center',
      'totalEarnings': 9500.50,
      'date': '2024-01-23T15:30:00',
      'image':
          'assets/images/Screenshot 2024-12-21 111829.png', // Added image path

      'products': [
        {'name': 'Luxury Brands', 'revenue': 45000.00},
        {'name': 'Designer Accessories', 'revenue': 30000.50},
        {'name': 'High-End Electronics', 'revenue': 20000.00},
      ]
    },
    {
      'shop': 'Rural Market',
      'totalEarnings': 1800.25,
      'date': '2024-01-24T11:00:00',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      // Added image path
      // Added image path
      'products': [
        {'name': 'Local Produce', 'revenue': 8000.00},
        {'name': 'Handcrafted Goods', 'revenue': 6000.25},
        {'name': 'Community Essentials', 'revenue': 4000.00},
      ]
    }
    // Add more sales data here
  ];

  String filter = 'All';

  double get _totalSalesEarnings {
    return _salesData.fold(0, (sum, item) => sum + item['totalEarnings']);
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    // Calculate safe area heights
    final safeHeight = size.height - padding.top - padding.bottom;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(safeHeight * 0.08), // Responsive app bar height
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors.blackGradient,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomBarscreen()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: size.width * 0.05, // Responsive icon size
            ),
          ),
          title: Text(
            'Sales Earnings Details',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.045, // Responsive text size
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.tune_outlined,
                color: Colors.white,
                size: size.width * 0.05, // Responsive icon size
              ),
              onPressed: () => _showFilterOptions(context),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: Column(
          children: [
            // Total Sales Earnings widget

            Container(
              height: safeHeight * 0.2, // Responsive height
              padding: EdgeInsets.all(size.width * 0.04),
              margin: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                gradient: AppColors.bannerGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.goldPurpleShader(bounds),
                    child: Text(
                      'Total Sales Earnings',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: safeHeight * 0.01),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.goldPurpleShader(bounds),
                    child: Text(
                      '₹${_totalSalesEarnings.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Earnings Details Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Earnings Details',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle See All
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List of earnings
            Expanded(
              child: ListView.builder(
                itemCount: _salesData.length,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                itemBuilder: (context, index) {
                  final shop = _salesData[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: safeHeight * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantDetailPage(
                              image: shop['image'],
                              shopName: shop['shop'],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          // Shop Image
                          Container(
                            width: size.width * 0.2,
                            height: size.width * 0.2,
                            child: Image.asset(
                              shop['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: size.width * 0.03),
                          // Shop Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  shop['shop'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.005),
                                Row(
                                  children: [
                                    Text(
                                      'Total Earnings: ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: size.width * 0.035,
                                      ),
                                    ),
                                    Text(
                                      '₹${shop['totalEarnings'].toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 68, 185, 39),
                                        fontSize: size.width * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    final size = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Filter Transactions',
            style: TextStyle(fontSize: size.width * 0.045),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterOption('Last 6 months', size),
              _buildFilterOption('Last 1 year', size),
              _buildFilterOption('Last month', size),
              _buildFilterOption('All Transactions', size),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String title, Size size) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: size.width * 0.04),
      ),
      onTap: () {
        setState(() => filter = title);
        Navigator.pop(context);
      },
    );
  }
}
