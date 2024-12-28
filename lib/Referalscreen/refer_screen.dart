import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class ReferEarningsScreen extends StatefulWidget {
  const ReferEarningsScreen({Key? key}) : super(key: key);

  @override
  _ReferEarningsScreenState createState() => _ReferEarningsScreenState();
}

class _ReferEarningsScreenState extends State<ReferEarningsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Comprehensive Referral Earnings Data
  final List<Map<String, dynamic>> _referralData = [
    {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'totalEarnings': 1250.50,
      'referralDate': '2024-01-15',
      'status': 'Active',
      'referredUsers': 5,
      'commissionRate': 0.15
    },
    {
      'name': 'Emily Smith',
      'email': 'emily.smith@example.com',
      'totalEarnings': 875.25,
      'referralDate': '2024-01-10',
      'status': 'Active',
      'referredUsers': 3,
      'commissionRate': 0.10
    },
    {
      'name': 'Michael Johnson',
      'email': 'michael.j@example.com',
      'totalEarnings': 2100.75,
      'referralDate': '2024-01-05',
      'status': 'Top Performer',
      'referredUsers': 8,
      'commissionRate': 0.20
    },
    {
      'name': 'Sarah Williams',
      'email': 'sarah.w@example.com',
      'totalEarnings': 450.00,
      'referralDate': '2024-01-20',
      'status': 'New',
      'referredUsers': 2,
      'commissionRate': 0.05
    }
  ];

  // Total Earnings Calculation
  double get _totalReferralEarnings {
    return _referralData.fold(0, (sum, item) => sum + item['totalEarnings']);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Earnings Distribution Pie Chart
  Widget _buildEarningsPieChart() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: PieChart(
        PieChartData(
          sections: _referralData.map((referral) {
            return PieChartSectionData(
              color: _getColorForEarnings(referral['totalEarnings']),
              value: referral['totalEarnings'],
              title: referral['name'],
              radius: 100,
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  // Color selection based on earnings
  Color _getColorForEarnings(double earnings) {
    if (earnings > 2000) return Color.fromARGB(255, 117, 0, 106);
    if (earnings > 1000) return Color.fromARGB(255, 117, 0, 106);
    if (earnings > 500) return Color.fromARGB(255, 117, 0, 106);
    return Color.fromARGB(255, 117, 0, 106);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Color.fromARGB(255, 117, 0, 106),
                Colors.black,
              ],
            ),
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
          'Referral Earnings Report',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share referral earnings report
              _showShareDialog();
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: FadeTransition(
          opacity: _animation,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Total Earnings Summary Card
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Color.fromARGB(255, 216, 0, 194),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Total Referral Earnings',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '₹${_totalReferralEarnings.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Referral Details List
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Referral Details',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Referral List with Detailed Information
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _referralData.length,
                  itemBuilder: (context, index) {
                    final referral = _referralData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        color: Colors.white.withOpacity(0.2),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none, // Removes border
                        ),
                        child: ExpansionTile(
                          title: Text(
                            referral['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'Earnings: \₹${referral['totalEarnings'].toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 21, 209, 30),
                            ),
                          ),
                          trailing: Chip(
                            label: Text(
                              referral['status'],
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                                _getColorForEarnings(referral['totalEarnings']),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailRow(
                                    'Email',
                                    referral['email'],
                                  ),
                                  _buildDetailRow(
                                    'Referred Users',
                                    referral['referredUsers'].toString(),
                                  ),
                                  _buildDetailRow(
                                    'Commission Rate',
                                    '${(referral['commissionRate'] * 100).toStringAsFixed(0)}%',
                                  ),
                                  _buildDetailRow(
                                    'Referral Date',
                                    DateFormat('MMM dd, yyyy').format(
                                      DateTime.parse(referral['referralDate']),
                                    ),
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Invite new referrals
          _showReferralInviteDialog();
        },
        icon: Icon(Icons.add),
        label: Text('Invite Referral'),
      ),
    );
  }




  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Share Dialog
  void _showShareDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Share Referral Report'),
        content: Text('Generate and share referral earnings report?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Report shared successfully!')),
              );
            },
            child: Text('Share'),
          ),
        ],
      ),
    );
  }

  // Referral Invite Dialog
  void _showReferralInviteDialog() {
    final _emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Invite New Referral'),
        content: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Enter email address',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement actual referral invite logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Invitation sent!')),
              );
            },
            child: Text('Send Invite'),
          ),
        ],
      ),
    );
  }
}