import 'package:flutter/material.dart';
import 'shop_list.dart'; // Make sure to import the new screen

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
    {'name': 'Fresh Mart', 'category': 'Grocery', 'icon': Icons.local_grocery_store},
    {'name': 'Home Elegance', 'category': 'Furniture', 'icon': Icons.chair},
    {'name': 'Toy Kingdom', 'category': 'Toys', 'icon': Icons.toys},
    {'name': 'Sports Elite', 'category': 'Sports', 'icon': Icons.sports},
    {'name': 'Glamour Gallery', 'category': 'Beauty', 'icon': Icons.face},
    {'name': 'Book Haven', 'category': 'Books', 'icon': Icons.book},
    {'name': 'Footwear Paradise', 'category': 'Shoes', 'icon': Icons.dialpad_sharp},
    {'name': 'Jewel Box', 'category': 'Jewelry', 'icon': Icons.ring_volume},
    {'name': 'Green Garden', 'category': 'Plants', 'icon': Icons.park},
    {'name': 'Pet Paradise', 'category': 'Pet Supplies', 'icon': Icons.pets},
    {'name': 'Music World', 'category': 'Musical Instruments', 'icon': Icons.music_note},
    {'name': 'Art Studio', 'category': 'Art Supplies', 'icon': Icons.brush},
    {'name': 'Kitchen Kings', 'category': 'Kitchen Appliances', 'icon': Icons.kitchen},
    {'name': 'Game Zone', 'category': 'Gaming', 'icon': Icons.games},
    {'name': 'Fitness First', 'category': 'Fitness Equipment', 'icon': Icons.fitness_center},
    {'name': 'Camera Shop', 'category': 'Photography', 'icon': Icons.camera_alt},
    {'name': 'Watch World', 'category': 'Watches', 'icon': Icons.watch},
    {'name': 'Sweet Tooth', 'category': 'Bakery', 'icon': Icons.cake},
    {'name': 'Auto Parts Plus', 'category': 'Automotive', 'icon': Icons.directions_car},
    {'name': 'Stationery Store', 'category': 'Office Supplies', 'icon': Icons.edit},
    {'name': 'Phone Plaza', 'category': 'Mobile Phones', 'icon': Icons.phone_android},
    {'name': 'Home Decor', 'category': 'Interior Design', 'icon': Icons.home},
    {'name': 'Vintage Vault', 'category': 'Antiques', 'icon': Icons.watch_later},
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        title: Text(
          'Nearby Shops',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color.fromARGB(255, 80, 2, 64),
              Colors.black,
            ],
          ),
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
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.2),
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
                        color: Colors.white.withOpacity(0.2),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          leading: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.2),
                            child: Icon(shop['icon'], color: Colors.white),
                          ),
                          title: Text(
                            shop['name'],
                            style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                          ),
                          subtitle: Text(shop['category'],style: TextStyle(
                            color: Colors.white
                          ),),
                          trailing:
                              Icon(Icons.arrow_forward, color: const Color.fromARGB(255, 255, 255, 255)),
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
