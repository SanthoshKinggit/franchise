// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/colors/colors.dart'; // Ensure you have this file

// import '../bottomscreen/bottom_screen.dart';
// import 'sales.dart';

// class SalesEarningsDetailsScreen extends StatefulWidget {
//   const SalesEarningsDetailsScreen({super.key});

//   @override
//   _SalesEarningsDetailsScreenState createState() =>
//       _SalesEarningsDetailsScreenState();
// }

// class _SalesEarningsDetailsScreenState
//     extends State<SalesEarningsDetailsScreen> {
//   // Comprehensive Sales Earnings Data with 10 entries
//   final List<Map<String, dynamic>> _salesData = [
//     {
//       'shop': 'Main Store Downtown',
//       'totalEarnings': 56000.50,
//       'date': '2024-01-15T12:00:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       'products': [
//         {'name': 'Electronics', 'revenue': 25000.00},
//         {'name': 'Clothing', 'revenue': 18000.00},
//         {'name': 'Accessories', 'revenue': 13000.50},
//       ]
//     },
//     {
//       'shop': 'City Branch Plaza',
//       'totalEarnings': 42000.75,
//       'date': '2024-01-16T14:30:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       'products': [
//         {'name': 'Home Goods', 'revenue': 20000.00},
//         {'name': 'Kitchen Appliances', 'revenue': 12000.75},
//         {'name': 'Home Decor', 'revenue': 10000.00},
//       ]
//     },
//     {
//       'shop': 'Online Store Platform',
//       'totalEarnings': 78000.25,
//       'date': '2024-01-17T08:15:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       'products': [
//         {'name': 'Tech Gadgets', 'revenue': 35000.00},
//         {'name': 'Fashion', 'revenue': 28000.25},
//         {'name': 'Beauty Products', 'revenue': 15000.00},
//       ]
//     },
//     {
//       'shop': 'Suburban Mall Branch',
//       'totalEarnings': 35000.00,
//       'date': '2024-01-18T17:45:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       'products': [
//         {'name': 'Sports Equipment', 'revenue': 15000.00},
//         {'name': 'Outdoor Gear', 'revenue': 12000.00},
//         {'name': 'Fitness Accessories', 'revenue': 8000.00},
//       ]
//     },
//     {
//       'shop': 'Airport Convenience Store',
//       'totalEarnings': 22000.50,
//       'date': '2024-01-19T13:00:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
// // Added image path
//       'products': [
//         {'name': 'Travel Accessories', 'revenue': 10000.00},
//         {'name': 'Snacks & Drinks', 'revenue': 7500.50},
//         {'name': 'Electronics', 'revenue': 4500.00},
//       ]
//     },
//     {
//       'shop': 'University Campus Store',
//       'totalEarnings': 45000.75,
//       'date': '2024-01-20T09:30:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       // Added image path
//       'products': [
//         {'name': 'Textbooks', 'revenue': 20000.00},
//         {'name': 'School Supplies', 'revenue': 15000.75},
//         {'name': 'University Merchandise', 'revenue': 10000.00},
//       ]
//     },
//     {
//       'shop': 'Beachfront Boutique',
//       'totalEarnings': 33000.25,
//       'date': '2024-01-21T16:00:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       // Added image path
//       'products': [
//         {'name': 'Swimwear', 'revenue': 15000.00},
//         {'name': 'Beach Accessories', 'revenue': 10000.25},
//         {'name': 'Sunscreen & Cosmetics', 'revenue': 8000.00},
//       ]
//     },
//     {
//       'shop': 'Mountain Resort Gift Shop',
//       'totalEarnings': 28000.00,
//       'date': '2024-01-22T10:30:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       // Added image path
//       'products': [
//         {'name': 'Outdoor Clothing', 'revenue': 12000.00},
//         {'name': 'Hiking Gear', 'revenue': 10000.00},
//         {'name': 'Souvenirs', 'revenue': 6000.00},
//       ]
//     },
//     {
//       'shop': 'Premium Center',
//       'totalEarnings': 95000.50,
//       'date': '2024-01-23T15:30:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path

//       'products': [
//         {'name': 'Luxury Brands', 'revenue': 45000.00},
//         {'name': 'Designer Accessories', 'revenue': 30000.50},
//         {'name': 'High-End Electronics', 'revenue': 20000.00},
//       ]
//     },
//     {
//       'shop': 'Rural Market',
//       'totalEarnings': 18000.25,
//       'date': '2024-01-24T11:00:00',
//       'image':
//           'assets/images/Screenshot 2024-12-21 112112.png', // Added image path
//       // Added image path
//       'products': [
//         {'name': 'Local Produce', 'revenue': 8000.00},
//         {'name': 'Handcrafted Goods', 'revenue': 6000.25},
//         {'name': 'Community Essentials', 'revenue': 4000.00},
//       ]
//     }
//   ];

//   // Total Earnings Calculation
//   double get _totalSalesEarnings {
//     return _salesData.fold(0, (sum, item) => sum + item['totalEarnings']);
//   }

//   // Build Product Revenue Chart
//   Widget _buildProductRevenueChart(List<Map<String, dynamic>> products) {
//     return AspectRatio(
//       aspectRatio: 1.7,
//       child: BarChart(
//         BarChartData(
//           barGroups: products.map((product) {
//             return BarChartGroupData(
//               x: products.indexOf(product),
//               barRods: [],
//             );
//           }).toList(),
//           titlesData: FlTitlesData(
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (value, meta) {
//                   return Text(
//                     products[value.toInt()]['name'],
//                     style: TextStyle(fontSize: 10),
//                     overflow: TextOverflow.ellipsis,
//                   );
//                 },
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(showTitles: false),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.black,
//                 Color.fromARGB(255, 117, 0, 106),
//                 Colors.black,
//               ],
//             ),
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => BottomBarscreen()),
//             );
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           'Sales Earnings Details',
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.filter_list,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               // Add filtering functionality
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
//         child: Column(
//           children: [
//             // Total Sales Summary
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(20),
//                 margin: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.black,
//                       Color.fromARGB(255, 216, 0, 194),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             'Total Sales Earnings',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             '₹${_totalSalesEarnings.toStringAsFixed(2)}',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 SizedBox(width: 20),
//                 Text(
//                   'Earnings Details',
//                   style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _salesData.length,
//                 itemBuilder: (context, index) {
//                   final sales = _salesData[index];
//                   DateTime saleDate = DateTime.parse(sales['date']);
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigate to SalesListPage when the item is tapped
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SalesListPage(),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 0),
//                       child: InkWell(
//                         onTap: () {
//                       // Navigate to SalesListPage when the item is tapped
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SalesListPage(),
//                         ),
//                       );
//                     },
//                         child: Card(
//                           color: Colors.white,
//                           elevation: 6,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                       // Navigate to SalesListPage when the item is tapped
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SalesListPage(),
//                         ),
//                       );
//                     },
//                             child: ExpansionTile(
//                               title: Row(
//                                 children: [
//                                   // Display the shop image
//                                   Image.asset(
//                                     sales[
//                                         'image'], // Dynamically set the image from the data
//                                     height: 40,
//                                     width: 40,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   SizedBox(width: 8),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       // Shop name
//                                       Text(
//                                         sales['shop'],
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           // Amount
//                                           Text(
//                                             'Total: ₹${sales['totalEarnings'].toStringAsFixed(2)}',
//                                             style: TextStyle(
//                                               color: Color.fromARGB(255, 41, 231,
//                                                   51), // Green color for amount
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // Date and Time
//                                   Row(
//                                     children: [
//                                       Text(
//                                         DateFormat('MMM dd, yyyy').format(saleDate),
//                                         style: TextStyle(
//                                             fontSize: 12, color: Colors.black),
//                                       ),
//                                       SizedBox(width: 8),
//                                       Text(
//                                         DateFormat('h:mm a').format(saleDate),
//                                         style: TextStyle(
//                                             fontSize: 12, color: Colors.black),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8),
//                                   // Transaction ID and Commission
//                                   Text('Transaction Id : '),
//                                   Text('Commission Amount : '),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
