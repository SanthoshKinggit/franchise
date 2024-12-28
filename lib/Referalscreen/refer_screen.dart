import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors/colors.dart';

class ReferralEarningsScreen extends StatefulWidget {
  const ReferralEarningsScreen({super.key});

  @override
  State<ReferralEarningsScreen> createState() => _ReferralEarningsScreenState();
}

class _ReferralEarningsScreenState extends State<ReferralEarningsScreen> {
  String filter = 'All';

  final List<Map<String, dynamic>> referralEarnings = [
    {
      'referredUser': 'Michael Brown',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-02-25 01:30 PM',
      'earnings': 1425.00,
      'planAmount': 2000.00,
      'planName': 'Platinum',
      'referralType': 'customer',
      'time': '01:30 PM',
      'transactionId': 'TRX001425',
      'commission': 200,
    },
    {
      'referredUser': 'Sarah Johnson',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-02-28 11:15 AM',
      'earnings': 850.25,
      'planAmount': 1000.00,
      'planName': 'Gold',
      'referralType': 'shop',
      'time': '11:15 AM',
      'transactionId': 'TRX001426',
      'commission': 100,
    },
    {
      'referredUser': 'David Wilson',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-03-02 04:20 PM',
      'earnings': 275.50,
      'planAmount': 500.00,
      'planName': 'Silver',
      'referralType': 'customer',
      'time': '04:20 PM',
      'transactionId': 'TRX001427',
      'commission': 50,
    },
    {
      'referredUser': 'Emma Davis',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-03-05 09:45 AM',
      'earnings': 725.75,
      'planAmount': 1000.00,
      'planName': 'Gold',
      'referralType': 'shop',
      'time': '09:45 AM',
      'transactionId': 'TRX001428',
      'commission': 100,
    },
    {
      'referredUser': 'James Taylor',
            'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',

      'date': '2024-03-08 02:50 PM',
      'earnings': 225.25,
      'planAmount': 500.00,
      'planName': 'Silver',
      'referralType': 'customer',
      'time': '02:50 PM',
      'transactionId': 'TRX001429',
      'commission': 100,
    },
     {
      'referredUser': 'Sarah Johnson',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-02-28 11:15 AM',
      'earnings': 850.25,
      'planAmount': 1000.00,
      'planName': 'Gold',
      'referralType': 'shop',
      'time': '11:15 AM',
      'transactionId': 'TRX001426',
      'commission': 100,
    },
    {
      'referredUser': 'David Wilson',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-03-02 04:20 PM',
      'earnings': 275.50,
      'planAmount': 500.00,
      'planName': 'Silver',
      'referralType': 'customer',
      'time': '04:20 PM',
      'transactionId': 'TRX001427',
      'commission': 50,
    },
    {
      'referredUser': 'Emma Davis',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-03-05 09:45 AM',
      'earnings': 725.75,
      'planAmount': 1000.00,
      'planName': 'Gold',
      'referralType': 'shop',
      'time': '09:45 AM',
      'transactionId': 'TRX001428',
      'commission': 100,
    },
     {
      'referredUser': 'Sarah Johnson',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-02-28 11:15 AM',
      'earnings': 850.25,
      'planAmount': 1000.00,
      'planName': 'Gold',
      'referralType': 'shop',
      'time': '11:15 AM',
      'transactionId': 'TRX001426',
      'commission': 100,
    },
    {
      'referredUser': 'David Wilson',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-03-02 04:20 PM',
      'earnings': 275.50,
      'planAmount': 500.00,
      'planName': 'Silver',
      'referralType': 'customer',
      'time': '04:20 PM',
      'transactionId': 'TRX001427',
      'commission': 50,
    },
    {
      'referredUser': 'Emma Davis',
      'profileImage': 'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
      'date': '2024-03-05 09:45 AM',
      'earnings': 725.75,
      'planAmount': 1000.00,
      'planName': 'Gold',
      'referralType': 'shop',
      'time': '09:45 AM',
      'transactionId': 'TRX001428',
      'commission': 100,
    },
  ];

  List<Map<String, dynamic>> _filteredReferralEarnings() {
    DateTime now = DateTime.now();
    List<Map<String, dynamic>> filteredList = referralEarnings;

    if (filter == 'Last 6 months') {
      filteredList = referralEarnings.where((earning) {
        DateTime earningDate = DateFormat('yyyy-MM-dd hh:mm a').parse(earning['date']);
        return now.difference(earningDate).inDays <= 180;
      }).toList();
    } else if (filter == 'Last 1 year') {
      filteredList = referralEarnings.where((earning) {
        DateTime earningDate = DateFormat('yyyy-MM-dd hh:mm a').parse(earning['date']);
        return now.difference(earningDate).inDays <= 365;
      }).toList();
    } else if (filter == 'Last month') {
      filteredList = referralEarnings.where((earning) {
        DateTime earningDate = DateFormat('yyyy-MM-dd hh:mm a').parse(earning['date']);
        return earningDate.month == now.month && earningDate.year == now.year;
      }).toList();
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text('Referral Earnings', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () => _showFilterOptions(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
                  gradient: AppColors.blackGradient,

        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: AppColors.bannerGradient,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ShaderMask(
                      shaderCallback: (bounds) =>
                      AppColors.goldPurpleShader(bounds),
                    child: Text(
                      'Total Earnings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ShaderMask(
                      shaderCallback: (bounds) =>
                      AppColors.goldPurpleShader(bounds),
                    child: Text(
                      '₹${NumberFormat('#,##,##0.00').format(totalEarnings)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filteredReferralEarnings().length,
                itemBuilder: (context, index) {
                  final earning = _filteredReferralEarnings()[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ExpansionTile(
                      leading: Icon(
                        earning['referralType'] == 'customer' 
                            ? Icons.person_outline
                            : Icons.store_outlined,
                            size: 30,
                        color: const Color.fromARGB(255, 90, 90, 90),
                      ),
                      title: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(earning['profileImage']),
                            backgroundColor: Colors.grey[300],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  earning['referredUser'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Trans ID: ${earning['transactionId']}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  earning['date'],
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Commission :',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹ ${NumberFormat('#,##,##0.00').format(earning['commission'])}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Plan: ${earning['planName']}',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Amount: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        '₹ ${NumberFormat('#,##,##0.00').format(earning['planAmount'])}',
                                        style: TextStyle(color: const Color.fromARGB(255, 54, 54, 54),fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Earnings: ',
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 78, 78, 78),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '₹ ${NumberFormat('#,##,##0.00').format(earning['earnings'])}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                  setState(() => filter = 'Last 6 months');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last 1 year'),
                onTap: () {
                  setState(() => filter = 'Last 1 year');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Last month'),
                onTap: () {
                  setState(() => filter = 'Last month');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('All Transactions'),
                onTap: () {
                  setState(() => filter = 'All');
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
