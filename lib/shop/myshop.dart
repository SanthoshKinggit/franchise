import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/colors/colors.dart'; // Make sure this file exists
import '../bottomscreen/bottom_screen.dart';
import 'addshop.dart';
import 'shop_details.dart';

// Shop Model
class Shop {
  final int id;
  final String name;
  final String status;
  final String location;
  final int items;
  final String revenue;
  final String image;
  final String phoneNumber;

  Shop({
    required this.id,
    required this.name,
    required this.status,
    required this.location,
    required this.items,
    required this.revenue,
    required this.image,
    required this.phoneNumber,
  });
}

class ShopsListScreen extends StatefulWidget {
  const ShopsListScreen({super.key});

  @override
  State<ShopsListScreen> createState() => _ShopsListScreenState();
}

class _ShopsListScreenState extends State<ShopsListScreen> {
  final List<Shop> shops = [
    Shop(
      id: 1,
      name: "Downtown Boutique",
      status: "Active",
      location: "123 Main Street",
      items: 45,
      revenue: "₹12,500",
      image: "assets/images/Screenshot 2024-12-21 112024.png",
      phoneNumber: "+91 123 456 7890",
    ),
    Shop(
      id: 2,
      name: "Riverside Market",
      status: "Inactive",
      location: "456 River Road",
      items: 30,
      revenue: "₹8,200",
      image: "assets/images/Screenshot 2024-12-21 111959.png",
      phoneNumber: "+91 987 654 3210",
    ),
    Shop(
      id: 3,
      name: "Sunset Gallery",
      status: "Active",
      location: "789 Art Avenue",
      items: 22,
      revenue: "₹15,300",
      image: "assets/images/Screenshot 2024-12-21 111829.png",
      phoneNumber: "+91 555 123 4567", // Example contact number
    ),
    Shop(
      id: 4,
      name: "Urban Trends Fashion",
      status: "Active",
      location: "221 Fashion Street",
      items: 120,
      revenue: "₹45,800",
      image: "assets/images/Screenshot 2024-12-21 111758.png",
      phoneNumber: "+91 444 222 3333", // Example contact number
    ),
    Shop(
      id: 5,
      name: "Tech Haven",
      status: "Active",
      location: "567 Digital Plaza",
      items: 85,
      revenue: "₹92,000",
      image: "assets/images/Screenshot 2024-12-21 111546.png",
      phoneNumber: "+91 999 888 7777", // Example contact number
    ),
    Shop(
      id: 6,
      name: "Green Gardens Nursery",
      status: "Inactive",
      location: "890 Nature Lane",
      items: 150,
      revenue: "₹23,400",
      image: "assets/images/Screenshot 2024-12-21 111430.png",
      phoneNumber: "+91 333 444 5555", // Example contact number
    ),
    // More shop data here
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

  final _shopNameController = TextEditingController();
  final _shopLocationController = TextEditingController();
  final _itemsController = TextEditingController();
  final _revenueController = TextEditingController();
  final _phoneController = TextEditingController();

  // Function to open the Add Shop dialog
  void _openAddShopDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
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
              'Add Shop Details',
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
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: AppColors.blackGradient,
            ),
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _shopNameController,
                    decoration: InputDecoration(labelText: 'Shop Name'),
                  ),
                  TextField(
                    controller: _shopLocationController,
                    decoration: InputDecoration(labelText: 'Shop Location'),
                  ),
                  TextField(
                    controller: _itemsController,
                    decoration: InputDecoration(labelText: 'Number of Items'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _revenueController,
                    decoration: InputDecoration(labelText: 'Revenue'),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    String shopName = _shopNameController.text;
                    String shopLocation = _shopLocationController.text;
                    String items = _itemsController.text;
                    String revenue = _revenueController.text;
                    String phoneNumber = _phoneController.text;

                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopDetailsPage(
                          shopName: shopName,
                          shopLocation: shopLocation,
                          items: items,
                          revenue: revenue,
                          phoneNumber: phoneNumber,
                        ),
                      ),
                    );
                  },
                  child: Text('Add Shop'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomBarscreen()));
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text('Shops', style: GoogleFonts.poppins(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () => _showFilterOptions(context),
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddShopDialog,
        child: Icon(Icons.add, color: const Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Colors.amber,
        shape: CircleBorder(),
      ),
    );
  }

  Widget _buildShopCard(Shop shop) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShopDetailsScreen(shop: shop)),
        );
      },
      child: Card(
        color: Colors.white,
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
              // Image section - Increased height
              Row(
                children: [
                  Image.asset(
                    shop.image,
                    width: 80, // Increased width
                    height: 80, // Increased height
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      Text(
                        shop.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: shop.status == 'Active'
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, left: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                shop.status == 'Active'
                                    ? Icons.check_circle
                                    : Icons.airplanemode_inactive_outlined,
                                color: shop.status == 'Active'
                                    ? Colors.green
                                    : Colors.red,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Location', shop.location),
                  _buildDetailRow('Total Items', shop.items.toString()),
                  _buildDetailRow('Revenue', shop.revenue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// Helper method for detail row
  Widget _buildDetailRow(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '$title: $detail',
        style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6)),
      ),
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}

class ShopDetailsPage extends StatelessWidget {
  final String shopName;
  final String shopLocation;
  final String items;
  final String revenue;
  final String phoneNumber;

  ShopDetailsPage({
    required this.shopName,
    required this.shopLocation,
    required this.items,
    required this.revenue,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
          ),
        ),
        centerTitle: true,
        title: Text(
          '$shopName Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.blackGradient,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text('Shop Name: $shopName',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        SizedBox(height: 18),
                        Text('Location: $shopLocation',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 18),
                        Text('Number of Items: $items',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 18),
                        Text('Revenue: $revenue',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 18),
                        Text('Phone Number: $phoneNumber',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(height: 30),
                        // Add other details here as needed
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 251, 24)),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShopsListScreen()),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('New shop details added!'),
                                duration: Duration(
                                    seconds: 3), // Adjust duration as needed
                              ),
                            );
                          },
                          child: Text('Submit',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                        )
                      ],
                    ),
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

// // Main App Widget (for demonstration)
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Shops',
//       theme: ThemeData(
//         primarySwatch: MaterialColor(0xFF6A4FA3, {
//           50: Color(0xFFEDE7F6),
//           100: Color(0xFFD1C4E9),
//           200: Color(0xFFB39DDB),
//           300: Color(0xFF9575CD),
//           400: Color(0xFF7E57C2),
//           500: Color(0xFF6A4FA3),
//           600: Color(0xFF5E35B1),
//           700: Color(0xFF512DA8),
//           800: Color(0xFF4527A0),
//           900: Color(0xFF311B92),
//         }),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ShopsListScreen(),
//     );
//   }
// }
