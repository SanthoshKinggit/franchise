import 'package:flutter/material.dart';
import 'package:myapp/colors/colors.dart';

class AllShopListScreen extends StatefulWidget {
  const AllShopListScreen({super.key});

  @override
  State<AllShopListScreen> createState() => _AllShopListScreenState();
}

class _AllShopListScreenState extends State<AllShopListScreen> {
  final List<Map<String, dynamic>> shops = [
    {'name': 'Shop 1', 'category': 'Clothing', 'icon': Icons.store},
    {'name': 'Shop 2', 'category': 'Electronics', 'icon': Icons.computer},
    {
      'name': 'Shop 3',
      'category': 'Grocery',
      'icon': Icons.local_grocery_store
    },
    {'name': 'Shop 4', 'category': 'Furniture', 'icon': Icons.chair},
    {'name': 'Shop 5', 'category': 'Toys', 'icon': Icons.toys},
    {'name': 'Shop 6', 'category': 'Sports', 'icon': Icons.sports},
    {'name': 'Shop 7', 'category': 'Beauty', 'icon': Icons.face},
    {'name': 'Shop 8', 'category': 'Books', 'icon': Icons.book},
    {'name': 'Shop 9', 'category': 'Shoes', 'icon': Icons.dialpad_sharp},
    {'name': 'Shop 10', 'category': 'Jewelry', 'icon': Icons.ring_volume},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'All Shops',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: shops.length,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    leading: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: Icon(shop['icon'], color: Colors.white),
                    ),
                    title: Text(
                      shop['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(
                      shop['category'],
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
