import 'package:flutter/material.dart';


class AddShop extends StatefulWidget {
  @override
  _AddShopState createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  final _shopNameController = TextEditingController();
  final _shopLocationController = TextEditingController();
  final _shopOwnerController = TextEditingController();
  final _itemsController = TextEditingController();
  final _revenueController = TextEditingController();
  final _phoneController = TextEditingController();

  // Function to open the Add Shop dialog
  void _openAddShopDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Shop Details'),
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
                // Collect data from the TextFields
                String shopName = _shopNameController.text;
                String shopLocation = _shopLocationController.text;
                String items = _itemsController.text;
                String revenue = _revenueController.text;
                String phoneNumber = _phoneController.text;

                // Navigate to the Shop Details page
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop Management')),
      body: Center(
        child: Text('Shops will be listed here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddShopDialog,
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor: Colors.yellow,
        shape: CircleBorder(),
      ),
    );
  }
}

class ShopDetailsPage extends StatelessWidget {
  final String shopName;
  final String shopLocation;
  final String items;
  final String revenue;
  final String phoneNumber;

  // Constructor to receive the shop details
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
      appBar: AppBar(title: Text('Shop Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shop Name: $shopName', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Location: $shopLocation', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Number of Items: $items', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Revenue: $revenue', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Phone Number: $phoneNumber', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Image.asset("assets/images/Screenshot 2024-12-21 112024.png"), // Example image path
          ],
        ),
      ),
    );
  }
}
