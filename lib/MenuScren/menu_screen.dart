import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDashboard extends StatefulWidget {
  const ListDashboard({Key? key}) : super(key: key);

  @override
  _ListDashboardState createState() => _ListDashboardState();
}

class _ListDashboardState extends State<ListDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Section
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Store Manager',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Statistics List
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Sales Summary Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sales Summary',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.attach_money, color: Colors.white),
                          ),
                          title: Text(
                            'Total Sales',
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: Text(
                            '₹45,250',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.trending_up, color: Colors.white),
                          ),
                          title: Text(
                            "Today's Sales",
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: Text(
                            '₹8,450',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Referral Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Referral Earnings',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.people, color: Colors.white),
                          ),
                          title: Text(
                            'Total Referrals',
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: Text(
                            '₹2,840',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.purple,
                            child: Icon(Icons.timeline, color: Colors.white),
                          ),
                          title: Text(
                            "Today's Referrals",
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: Text(
                            '₹520',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Store Stats Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Statistics',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Icon(Icons.store, color: Colors.white),
                          ),
                          title: Text(
                            'Total Shops',
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: Text(
                            '24',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Icon(Icons.group, color: Colors.white),
                          ),
                          title: Text(
                            'Total Staff',
                            style: GoogleFonts.poppins(),
                          ),
                          trailing: Text(
                            '12',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}