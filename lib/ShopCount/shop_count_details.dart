import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ShopDetailsScreen1 extends StatefulWidget {
  final Map<String, dynamic> shop;

  const ShopDetailsScreen1({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  State<ShopDetailsScreen1> createState() => _ShopDetailsScreen1State();
}

class _ShopDetailsScreen1State extends State<ShopDetailsScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
               flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
            
          ),
        ),
        title: Text(
          widget.shop['name'],
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Add to favorites functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
                   gradient: AppColors.blackGradient,

        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shop Header Card
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.black,
                          child: Icon(
                            widget.shop['icon'],
                            size: 40,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.shop['name'],
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 117, 0, 106),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.shop['category'],
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Text(
                              ' 4.5',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' (128 reviews)',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                // Contact Information
                _buildSectionTitle('Contact Information'),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        _buildInfoRow(Icons.access_time, 'Opening Hours', '9:00 AM - 9:00 PM'),
                        Divider(color: Colors.white24),
                        _buildInfoRow(Icons.location_on, 'Location', '123 Shopping Street, City'),
                        Divider(color: Colors.white24),
                        _buildInfoRow(Icons.phone, 'Phone', '+1 234 567 890'),
                        Divider(color: Colors.white24),
                        _buildInfoRow(Icons.language, 'Website', 'www.shopwebsite.com'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Features
                _buildSectionTitle('Features'),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        _buildFeatureRow(Icons.local_parking, 'Parking Available'),
                        _buildFeatureRow(Icons.wifi, 'Free Wi-Fi'),
                        _buildFeatureRow(Icons.credit_card, 'Card Payment'),
                        _buildFeatureRow(Icons.delivery_dining, 'Delivery Available'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Color.fromARGB(255, 255, 239, 8),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Add direction functionality
                        },
                        icon: Icon(Icons.directions),
                        label: Text('Get Directions'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                          backgroundColor: Color.fromARGB(255, 255, 251, 0),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Add contact functionality
                        },
                        icon: Icon(Icons.phone),
                        label: Text('Contact'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 22),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 22),
          SizedBox(width: 15),
          Text(
            feature,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}