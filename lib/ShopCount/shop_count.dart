import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'shop_count_details.dart';
import 'shop_count_list.dart'; // Make sure to import the new screen

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({super.key});

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  // List of Shops
  final List<Map<String, dynamic>> shops = [
    {'name': 'Fashion Fusion', 'category': 'Clothing', 'icon': Icons.store},
    {'name': 'TechWorld', 'category': 'Electronics', 'icon': Icons.computer},
    {
      'name': 'Fresh Mart',
      'category': 'Grocery',
      'icon': Icons.local_grocery_store
    },
    {'name': 'Home Elegance', 'category': 'Furniture', 'icon': Icons.chair},
    {'name': 'Toy Kingdom', 'category': 'Toys', 'icon': Icons.toys},
    {'name': 'Sports Elite', 'category': 'Sports', 'icon': Icons.sports},
    {'name': 'Glamour Gallery', 'category': 'Beauty', 'icon': Icons.face},
    {'name': 'Book Haven', 'category': 'Books', 'icon': Icons.book},
    {
      'name': 'Footwear Paradise',
      'category': 'Shoes',
      'icon': Icons.dialpad_sharp
    },
    {'name': 'Jewel Box', 'category': 'Jewelry', 'icon': Icons.ring_volume},
    {'name': 'Green Garden', 'category': 'Plants', 'icon': Icons.park},
    {'name': 'Pet Paradise', 'category': 'Pet Supplies', 'icon': Icons.pets},
    {
      'name': 'Music World',
      'category': 'Musical Instruments',
      'icon': Icons.music_note
    },
    {'name': 'Art Studio', 'category': 'Art Supplies', 'icon': Icons.brush},
    {
      'name': 'Kitchen Kings',
      'category': 'Kitchen Appliances',
      'icon': Icons.kitchen
    },
    {'name': 'Game Zone', 'category': 'Gaming', 'icon': Icons.games},
    {
      'name': 'Fitness First',
      'category': 'Fitness Equipment',
      'icon': Icons.fitness_center
    },
    {
      'name': 'Camera Shop',
      'category': 'Photography',
      'icon': Icons.camera_alt
    },
    {'name': 'Watch World', 'category': 'Watches', 'icon': Icons.watch},
    {'name': 'Sweet Tooth', 'category': 'Bakery', 'icon': Icons.cake},
    {
      'name': 'Auto Parts Plus',
      'category': 'Automotive',
      'icon': Icons.directions_car
    },
    {
      'name': 'Stationery Store',
      'category': 'Office Supplies',
      'icon': Icons.edit
    },
    {
      'name': 'Phone Plaza',
      'category': 'Mobile Phones',
      'icon': Icons.phone_android
    },
    {'name': 'Home Decor', 'category': 'Interior Design', 'icon': Icons.home},
    {
      'name': 'Vintage Vault',
      'category': 'Antiques',
      'icon': Icons.watch_later
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () => _showFilterOptions(context),
          ),

        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
               flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
            
          ),
        ),
        title: Text(
          'Nearby Shops',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
                    gradient: AppColors.blackGradient,

        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section with title and button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby Shops',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        backgroundColor: const Color.fromARGB(255, 255, 238, 0),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Navigate to AllShopListScreen when pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllShopListScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              // Shops list with some dummy data (initially not showing full list)
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Just show 3 for now
                  itemBuilder: (context, index) {
                    var shop = shops[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShopDetails(shop: shop),
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(shop['icon'], color: Colors.white),
                          ),
                          title: Text(
                            shop['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            shop['category'],
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopDetails extends StatelessWidget {
  final Map<String, dynamic> shop;

  const ShopDetails({Key? key, required this.shop}) : super(key: key);

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
          shop['name'],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
               decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shop Icon and Category
              Center(
                child: Column(
                  children: [
                     Stack(
                  children: [
                    Container(
                     
                      decoration: BoxDecoration(
                        
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
                          child: Column(
                            children: [
                              Text(
                      shop['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                               Text(
                      shop['category'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18,
                      ),
                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        shop['icon'],
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      shop['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      shop['category'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
        
              // Shop Details
              _buildDetailCard(
                title: 'Opening Hours',
                content: '9:00 AM - 9:00 PM',
                icon: Icons.access_time,
              ),
              SizedBox(height: 16),
              _buildDetailCard(
                title: 'Location',
                content: '123 Shopping Street, City Center',
                icon: Icons.location_on,
              ),
              SizedBox(height: 16),
              _buildDetailCard(
                title: 'Contact',
                content: '+1 234 567 890',
                icon: Icons.phone,
              ),
        
              Spacer(),
              // Action Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: Color.fromARGB(255, 251, 255, 0),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Add action for visiting shop
                  },
                  child: Text(
                    'Visit Shop',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
