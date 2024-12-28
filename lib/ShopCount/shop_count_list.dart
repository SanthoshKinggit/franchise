import 'package:flutter/material.dart';
import 'package:myapp/colors/colors.dart';

class AllShopListScreen extends StatefulWidget {
  const AllShopListScreen({super.key});

  @override
  State<AllShopListScreen> createState() => _AllShopListScreenState();
}

class _AllShopListScreenState extends State<AllShopListScreen> {
  final List<Map<String, dynamic>> shops = [
    {
      'name': 'Fashion Fusion',
      'image': 'assets/images/Screenshot 2024-12-21 111546.png',
      'category': 'Clothing',
      'icon': Icons.store
    },
    {
      'name': 'TechWorld',
      'image': 'assets/images/Screenshot 2024-12-21 111758.png',
      'category': 'Electronics',
      'icon': Icons.computer
    },
    {
      'name': 'Fresh Mart',
      'category': 'Grocery',
      'image': 'assets/images/Screenshot 2024-12-21 111959.png',
      'icon': Icons.local_grocery_store
    },
    {
      'name': 'Home Elegance',
      'image': 'assets/images/Screenshot 2024-12-21 111829.png',
      'category': 'Furniture',
      'icon': Icons.chair
    },
    {
      'name': 'Toy Kingdom',
      'image': 'assets/images/Screenshot 2024-12-21 111758.png',
      'category': 'Toys',
      'icon': Icons.toys
    },
    {
      'name': 'Sports Elite',
      'image': 'assets/images/Screenshot 2024-12-21 111546.png',
      'category': 'Sports',
      'icon': Icons.sports
    },
    {
      'name': 'Glamour Gallery',
      'image': 'assets/images/Screenshot 2024-12-21 112112.png',
      'category': 'Beauty',
      'icon': Icons.face
    },
    {
      'name': 'Book Haven',
      'image': 'assets/images/Screenshot 2024-12-21 111829.png',
      'category': 'Books',
      'icon': Icons.book
    },
    {
      'name': 'Footwear Paradise',
      'category': 'Shoes',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'icon': Icons.dialpad_sharp
    },
    {
      'name': 'Jewel Box',
      'image': 'assets/images/Screenshot 2024-12-21 111959.png',
      'category': 'Jewelry',
      'icon': Icons.ring_volume
    },
    {
      'name': 'Green Garden',
      'image': 'assets/images/Screenshot 2024-12-21 111829.png',
      'category': 'Plants',
      'icon': Icons.park
    },
    {
      'name': 'Pet Paradise',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Pet Supplies',
      'icon': Icons.pets
    },
    {
      'name': 'Music World',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Musical Instruments',
      'icon': Icons.music_note
    },
    {
      'name': 'Art Studio',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Art Supplies',
      'icon': Icons.brush
    },
    {
      'name': 'Kitchen Kings',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Kitchen Appliances',
      'icon': Icons.kitchen
    },
    {
      'name': 'Game Zone',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Gaming',
      'icon': Icons.games
    },
    {
      'name': 'Fitness First',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Fitness Equipment',
      'icon': Icons.fitness_center
    },
    {
      'name': 'Camera Shop',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Photography',
      'icon': Icons.camera_alt
    },
    {
      'name': 'Watch World',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Watches',
      'icon': Icons.watch
    },
    {'name': 'Sweet Tooth', 'category': 'Bakery', 'icon': Icons.cake},
    {
      'name': 'Auto Parts Plus',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Automotive',
      'icon': Icons.directions_car
    },
    {
      'name': 'Stationery Store',
      'category': 'Office Supplies',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'icon': Icons.edit
    },
    {
      'name': 'Phone Plaza',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Mobile Phones',
      'icon': Icons.phone_android
    },
    {
      'name': 'Home Decor',
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'category': 'Interior Design',
      'icon': Icons.home
    },
    {
      'image': 'assets/images/Screenshot 2024-12-21 112024.png',
      'name': 'Vintage Vault',
      'category': 'Antiques',
      'icon': Icons.watch_later
    },
  ];

  String _searchQuery = '';

  List<Map<String, dynamic>> get filteredShops {
    if (_searchQuery.isEmpty) return shops;
    return shops.where((shop) {
      final name = shop['name'].toString().toLowerCase();
      final category = shop['category'].toString().toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || category.contains(query);
    }).toList();
  }
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
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.white),
            onPressed: () => _showFilterOptions(context),
          ),

        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
            flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
            
          ),
        ),
        title: const Text('All Shops', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),
              Expanded(child: _buildShopList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Search shops...',
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) => setState(() => _searchQuery = value),
    );
  }

  Widget _buildShopList() {
    return ListView.builder(
      itemCount: filteredShops.length,
      itemBuilder: (context, index) {
        final shop = filteredShops[index];
        return ShopCard(shop: shop);
      },
    );
  }
}

class ShopCard extends StatelessWidget {
  final Map<String, dynamic> shop;

  const ShopCard({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetails(shop: shop),
            ),
          ),
          child: Row(
            children: [
              _buildShopImage(),
              Expanded(child: _buildShopInfo()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShopImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(shop['image'] ?? 'assets/images/default_shop.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildShopInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shop['category'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 116, 0, 106),
          ),
        ],
      ),
    );
  }
}

class ShopDetails extends StatelessWidget {
  final Map<String, dynamic> shop;

  const ShopDetails({super.key, required this.shop});

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
            gradient: AppColors.blackGradient,
            
          ),
        ),
        title: Text(shop['name'], style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderImage(context),
              const SizedBox(height: 30),
              _buildInfoSection(),
              const SizedBox(height: 30),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image:
                  AssetImage(shop['image'] ?? 'assets/images/default_shop.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: _buildShopNameOverlay(),
        ),
      ],
    );
  }

  Widget _buildShopNameOverlay() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.black.withOpacity(0.4),
      ),
      child: Column(
        children: [
          Text(
            shop['name'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            shop['category'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        _buildInfoCard(
          title: 'Opening Hours',
          icon: Icons.access_time,
          children: _buildOpeningHours(),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Location & Contact',
          icon: Icons.location_on,
          children: _buildContactInfo(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  List<Widget> _buildOpeningHours() {
    return [
      _buildTimeRow('Monday - Friday', '9:00 AM - 9:00 PM'),
      _buildTimeRow('Saturday', '10:00 AM - 8:00 PM'),
      _buildTimeRow('Sunday', '11:00 AM - 6:00 PM'),
    ];
  }

  List<Widget> _buildContactInfo() {
    return [
      _buildDetailRow(Icons.pin_drop, '123 Shopping Street, City Center'),
      _buildDetailRow(Icons.phone, '+1 234 567 890'),
      _buildDetailRow(
        Icons.email,
        'contact@${shop['name'].toString().toLowerCase().replaceAll(' ', '')}.com',
      ),
    ];
  }

  List<Widget> _buildServices() {
    return [
      _buildServiceRow('Home Delivery', true),
      _buildServiceRow('Online Shopping', true),
      _buildServiceRow('Gift Wrapping', true),
      _buildServiceRow('Customer Support', true),
    ];
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
              backgroundColor: const Color.fromARGB(255, 255, 251, 0),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Add visit shop logic
            },
            child: const Text('Visit Shop'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 255, 238, 0),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Add contact logic
            },
            child: const Text('Contact'),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTimeRow(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: const TextStyle(color: Colors.black54)),
          Text(hours, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceRow(String service, bool available) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            available ? Icons.check_circle : Icons.cancel,
            color: available ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(service, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
