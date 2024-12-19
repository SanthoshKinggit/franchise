import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shop_details.dart';

// Shop Model
class Shop {
  final int id;
  final String name;
  final String status;
  final String location;
  final int items;
  final String revenue;

  Shop({
    required this.id,
    required this.name,
    required this.status,
    required this.location,
    required this.items,
    required this.revenue,
  });
}

class ShopsListScreen extends StatefulWidget {
  @override
  State<ShopsListScreen> createState() => _ShopsListScreenState();
}

class _ShopsListScreenState extends State<ShopsListScreen> {
  // Sample shop data
// Sample shop data
final List<Shop> shops = [
    Shop(
      id: 1,
      name: "Downtown Boutique",
      status: "Active",
      location: "123 Main Street",
      items: 45,
      revenue: "₹12,500",
    ),
    Shop(
      id: 2,
      name: "Riverside Market",
      status: "Inactive",
      location: "456 River Road",
      items: 30,
      revenue: "₹8,200",
    ),
    Shop(
      id: 3,
      name: "Sunset Gallery",
      status: "Active",
      location: "789 Art Avenue",
      items: 22,
      revenue: "₹15,300",
    ),
    Shop(
      id: 4,
      name: "Urban Trends Fashion",
      status: "Active",
      location: "221 Fashion Street",
      items: 120,
      revenue: "₹45,800",
    ),
    Shop(
      id: 5,
      name: "Tech Haven",
      status: "Active",
      location: "567 Digital Plaza",
      items: 85,
      revenue: "₹92,000",
    ),
    Shop(
      id: 6,
      name: "Green Gardens Nursery",
      status: "Inactive",
      location: "890 Nature Lane",
      items: 150,
      revenue: "₹23,400",
    ),
    Shop(
      id: 7,
      name: "Bookworm's Paradise",
      status: "Active",
      location: "432 Reader's Corner",
      items: 500,
      revenue: "₹28,900",
    ),
    Shop(
      id: 8,
      name: "Spice Kingdom",
      status: "Active",
      location: "765 Flavor Street",
      items: 200,
      revenue: "₹35,600",
    ),
    Shop(
      id: 9,
      name: "Fitness First Equipment",
      status: "Active",
      location: "543 Health Avenue",
      items: 75,
      revenue: "₹67,200",
    ),
    Shop(
      id: 10,
      name: "Vintage Collectibles",
      status: "Inactive",
      location: "876 Antique Road",
      items: 320,
      revenue: "₹18,500",
    ),
    Shop(
      id: 11,
      name: "Kids' Wonderland",
      status: "Active",
      location: "234 Joy Street",
      items: 250,
      revenue: "₹52,300",
    ),
    Shop(
      id: 12,
      name: "Home Essentials",
      status: "Active",
      location: "654 Comfort Lane",
      items: 180,
      revenue: "₹41,900",
    ),
    Shop(
      id: 13,
      name: "Artisan Crafts",
      status: "Inactive",
      location: "987 Creative Boulevard",
      items: 95,
      revenue: "₹31,700",
    ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
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
          'My Shop',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return _buildShopCard(shops[index]);
            },
          ),
        ),
      ),
    );
  }

 Widget _buildShopCard(Shop shop) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShopDetailsScreen(shop: shop),
        ),
      );
    },
    child: Card(
      color: Colors.white.withOpacity(0.2),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Existing shop card content...
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.store,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(width: 8),
                    Text(
                      shop.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: shop.status == 'Active'
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: shop.status == 'Active' ? Colors.green : Colors.red,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        shop.status == 'Active'
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: shop.status == 'Active' ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        shop.status,
                        style: TextStyle(
                          color: shop.status == 'Active'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailColumn('Location', shop.location),
                _buildDetailColumn('Total Items', shop.items.toString()),
                _buildDetailColumn('Revenue', shop.revenue),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildDetailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 230, 230, 230),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: const Color.fromARGB(221, 227, 227, 227),
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

// Main App Widget (for demonstration)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shops',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF6A4FA3, {
          50: Color(0xFFEDE7F6),
          100: Color(0xFFD1C4E9),
          200: Color(0xFFB39DDB),
          300: Color(0xFF9575CD),
          400: Color(0xFF7E57C2),
          500: Color(0xFF6A4FA3),
          600: Color(0xFF5E35B1),
          700: Color(0xFF512DA8),
          800: Color(0xFF4527A0),
          900: Color(0xFF311B92),
        }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShopsListScreen(),
    );
  }
}
