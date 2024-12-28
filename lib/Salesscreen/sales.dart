import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottomscreen/bottom_screen.dart';
import '../colors/colors.dart';

class SalesListPage extends StatefulWidget {
  @override
  State<SalesListPage> createState() => _SalesListPageState();
}

class _SalesListPageState extends State<SalesListPage> {
  final List<Map<String, dynamic>> _salesData = [
    {
      'date': '2024-12-21T10:00:00Z',
      'totalEarnings': 1500.0,
      'shop': 'Shop A',
      'image': 'assets/images/Screenshot 2024-12-21 112112.png',
    },
    {
      'date': '2024-12-22T11:00:00Z',
      'totalEarnings': 1200.0,
      'shop': 'Shop B',
      'image': 'assets/images/Screenshot 2024-12-21 112112.png',
    },
    // Add more sales data here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          ),
        ),
        title: Text(
          'Sales List',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () => _showFilterOptions(context),
          ),

        ],
      ),
      body: ListView.builder(
        itemCount: _salesData.length,
        itemBuilder: (context, index) {
          final sale = _salesData[index];
          return ListTile(
            leading: Image.asset(sale['image']),
            title: Text(sale['shop']),
            subtitle: Text('Earnings: ₹${sale['totalEarnings']}'),
          );
        },
      ),
    );
  }
}


 String filter = 'All'; // Default filter option

  void _showFilterOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Transactions'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Last 6 months'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last 1 year'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last month'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('All Transactions'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }