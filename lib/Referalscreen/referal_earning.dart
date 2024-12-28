import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors/colors.dart'; // Import NumberFormat

class ReferralEarningsScreen extends StatefulWidget {
  const ReferralEarningsScreen({super.key});

  @override
  State<ReferralEarningsScreen> createState() => _ReferralEarningsScreenState();
}

class _ReferralEarningsScreenState extends State<ReferralEarningsScreen> {
  var color = const Color.fromARGB(255, 255, 255, 255);
  var color2 = Color.fromARGB(255, 201, 201, 201);

  String filter = 'All'; // Default filter

  final List<Map<String, dynamic>> referralEarnings = [
    {
      'referredUser': 'John Doe',
      'date': '2024-01-15 03:44 PM',
      'earnings': 1250.50,
      'time': '10:30 AM'
    },
    {
      'referredUser': 'Jane Smith',
      'date': '2024-02-20 03:03 PM',
      'earnings': 1675.75,
      'time': '02:15 PM'
    },
    {
      'referredUser': 'John Doe',
      'date': '2024-01-15 02:54 PM',
      'earnings': 1250.50,
      'time': '10:30 AM'
    },
    {
      'referredUser': 'Jane Smith',
      'date': '2024-02-20 01:34 PM',
      'earnings': 1675.75,
      'time': '02:15 PM'
    },
    {
      'referredUser': 'John Doe',
      'date': '2024-01-15 01:24 PM',
      'earnings': 1250.50,
      'time': '10:30 AM'
    },
    {
      'referredUser': 'Jane Smith',
      'date': '2024-02-20 12:14 PM',
      'earnings': 1675.75,
      'time': '02:15 PM'
    },
  ];

  List<Map<String, dynamic>> _filteredReferralEarnings() {
    DateTime now = DateTime.now();
    List<Map<String, dynamic>> filteredList = referralEarnings;

    if (filter == 'Last 6 months') {
      filteredList = referralEarnings.where((earning) {
        DateTime earningDate =
            DateFormat('yyyy-MM-dd hh:mm a').parse(earning['date']);
        return now.difference(earningDate).inDays <= 180;
      }).toList();
    } else if (filter == 'Last 1 year') {
      filteredList = referralEarnings.where((earning) {
        DateTime earningDate =
            DateFormat('yyyy-MM-dd hh:mm a').parse(earning['date']);
        return now.difference(earningDate).inDays <= 365;
      }).toList();
    } else if (filter == 'Last month') {
      filteredList = referralEarnings.where((earning) {
        DateTime earningDate =
            DateFormat('yyyy-MM-dd hh:mm a').parse(earning['date']);
        return earningDate.month == now.month && earningDate.year == now.year;
      }).toList();
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total earnings from filtered list
    double totalEarnings = _filteredReferralEarnings()
        .fold(0, (previous, current) => previous + current['earnings']);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        title: Text(
          'Referral Earnings',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.blackGradient),
        child: Column(
          children: [
            // Total Earnings Container
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFD700), // Bright gold
                    Color(0xFFFFE135), // Light gold
                    Color(0xFFC5A000), // Dark gold
                    Color(0xFFFFD700)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Total Referral Earnings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '₹${NumberFormat('#,##,##0.00').format(totalEarnings)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Earnings List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filteredReferralEarnings().length,
                itemBuilder: (context, index) {
                  final earning = _filteredReferralEarnings()[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 97, 97)
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: color2,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      title: Text(
                        earning['referredUser'],
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        earning['date'],
                        style: TextStyle(color: color2),
                      ),
                      trailing: Text(
                        '₹${NumberFormat('#,##,##0.00').format(earning['earnings'])}',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.people_outline, color: Colors.black),
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

  // Method to show filter options in a dialog
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
                  setState(() {
                    filter = 'Last 6 months';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last 1 year'),
                onTap: () {
                  setState(() {
                    filter = 'Last 1 year';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last month'),
                onTap: () {
                  setState(() {
                    filter = 'Last month';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('All Transactions'),
                onTap: () {
                  setState(() {
                    filter = 'All';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
