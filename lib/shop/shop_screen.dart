import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesEarningsDetailsScreen extends StatefulWidget {
  const SalesEarningsDetailsScreen({Key? key}) : super(key: key);

  @override
  _SalesEarningsDetailsScreenState createState() =>
      _SalesEarningsDetailsScreenState();
}

class _SalesEarningsDetailsScreenState
    extends State<SalesEarningsDetailsScreen> {
  final List<Map<String, dynamic>> _salesData = [
    {
      'shop': 'Main Store Downtown',
      'totalEarnings': 56000.50,
      'date': '2024-01-15T12:00:00',
      'products': [
        {'name': 'Electronics', 'revenue': 25000.00},
        {'name': 'Clothing', 'revenue': 18000.00},
        {'name': 'Accessories', 'revenue': 13000.50},
      ]
    },
    {
      'shop': 'City Branch Plaza',
      'totalEarnings': 42000.75,
      'date': '2024-01-16T14:30:00',
      'products': [
        {'name': 'Home Goods', 'revenue': 20000.00},
        {'name': 'Kitchen Appliances', 'revenue': 12000.75},
        {'name': 'Home Decor', 'revenue': 10000.00},
      ]
    },
    // More data entries...
  ];

  // Total Earnings Calculation
  double get _totalSalesEarnings {
    return _salesData.fold(0, (sum, item) => sum + item['totalEarnings']);
  }

  // Build Product Revenue Chart
  Widget _buildProductRevenueChart(List<Map<String, dynamic>> products) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Product Breakdown',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // Bar chart or simple list
            Column(
              children: products.map<Widget>((product) {
                return ListTile(
                  title: Text(product['name']),
                  trailing: Text(
                    '₹${product['revenue'].toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Color selection based on revenue
  Color _getColorForRevenue(double revenue) {
    if (revenue > 40000) return Colors.green.shade700;
    if (revenue > 20000) return Color.fromARGB(255, 0, 0, 0);
    if (revenue > 10000) return Color.fromARGB(255, 0, 0, 0);
    return Colors.red.shade700;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'Sales Earnings - Shop',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter functionality
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Total Sales Summary Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Total Sales Earnings',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '₹${_totalSalesEarnings.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            // Sales Earnings List
            Expanded(
              child: ListView.builder(
                itemCount: _salesData.length,
                itemBuilder: (context, index) {
                  final sales = _salesData[index];
                  DateTime saleDate = DateTime.parse(sales['date']);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          sales['shop'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Total: ₹${sales['totalEarnings'].toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.green.shade700),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              DateFormat('MMM dd, yyyy').format(saleDate),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              DateFormat('h:mm a').format(saleDate),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: _buildProductRevenueChart(sales['products']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Export functionality
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Export functionality coming soon!')),
          );
        },
        child: Icon(Icons.share),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
