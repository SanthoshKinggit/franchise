// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../bottomscreen/bottom_screen.dart';
// import 'earning_details.dart';

// // Models
// class EarningDetail {
//   final String id;
//   final DateTime date;
//   final String shopName;
//   final double totalSales;
//   final double commission;
//   final String status;

//   EarningDetail({
//     required this.id,
//     required this.date,
//     required this.shopName,
//     required this.totalSales,
//     required this.commission,
//     required this.status,
//   });
// }


// // Earnings List Screen
// class EarningsScreen extends StatefulWidget {
//   @override
//   _EarningsScreenState createState() => _EarningsScreenState();
// }

// class _EarningsScreenState extends State<EarningsScreen> {
//   final List<EarningDetail> earnings = [
//     EarningDetail(
//       id: 'EARN001',
//       date: DateTime(2024, 1, 15),
//       shopName: 'Downtown Boutique',
//       totalSales: 12500.00,
//       commission: 625.00,
//       status: 'Completed',
//     ),
//     EarningDetail(
//       id: 'EARN002',
//       date: DateTime(2024, 1, 22),
//       shopName: 'Riverside Market',
//       totalSales: 8200.00,
//       commission: 410.00,
//       status: 'Pending',
//     ),
//     EarningDetail(
//       id: 'EARN003',
//       date: DateTime(2024, 1, 30),
//       shopName: 'Sunset Gallery',
//       totalSales: 15300.00,
//       commission: 765.00,
//       status: 'Completed',
//     ),
//     EarningDetail(
//       id: 'EARN004',
//       date: DateTime(2024, 2, 5),
//       shopName: 'Urban Marketplace',
//       totalSales: 9800.00,
//       commission: 490.00,
//       status: 'Processing',
//     ),
//   ];

//   final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 2);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
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
//                       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BottomBarscreen()
//         ),
//       );
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           'Total Earnings',
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_list,color: Colors.white,),
//             onPressed: () {
//               // Add filtering functionality
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.black,
//               Color.fromARGB(255, 80, 2, 64),
//               Colors.black,
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             _buildEarningsSummaryCard(),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.all(16),
//                 itemCount: earnings.length,
//                 itemBuilder: (context, index) {
//                   return _buildEarningItemCard(earnings[index], context);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildEarningsSummaryCard() {
//     double totalSales = earnings.fold(0, (sum, item) => sum + item.totalSales);
//     double totalCommission = earnings.fold(0, (sum, item) => sum + item.commission);

//     return Container(
//       margin: EdgeInsets.all(16),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.black,
//             Color.fromARGB(255, 230, 0, 184),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.purple,
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildSummaryColumn('Total Sales', currencyFormatter.format(totalSales)),
//           _buildSummaryColumn('Total Commission', currencyFormatter.format(totalCommission)),
//         ],
//       ),
//     );
//   }

//   Widget _buildSummaryColumn(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildEarningItemCard(EarningDetail earning, BuildContext context) {
//     Color statusColor;
//     IconData statusIcon;

//     switch (earning.status) {
//       case 'Completed':
//         statusColor = Colors.green;
//         statusIcon = Icons.check_circle;
//         break;
//       case 'Pending':
//         statusColor = Colors.orange;
//         statusIcon = Icons.pending;
//         break;
//       case 'Processing':
//         statusColor = Colors.blue;
//         statusIcon = Icons.sync;
//         break;
//       default:
//         statusColor = Colors.grey;
//         statusIcon = Icons.help;
//     }

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ShopEarningsDetails(earning: earning, shop: earning,),
//           ),
//         );
//       },
//       child: Card(
//         color: Colors.white,
//         margin: EdgeInsets.symmetric(vertical: 8),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset('assets/images/Screenshot 2024-12-21 112112.png',height: 30,),
//                       SizedBox(width: 8),
//                       Text(
//                         earning.shopName,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: const Color.fromARGB(255, 0, 0, 0),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: statusColor.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: statusColor,
//                         width: 1,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           statusIcon,
//                           color: const Color.fromARGB(255, 0, 185, 0),
//                           size: 16,
//                         ),
                       
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildDetailColumn(
//                     'Date',
//                     DateFormat('dd MMM yyyy').format(earning.date),
//                   ),
//                   _buildDetailColumn(
//                     'Total Sales',
//                     currencyFormatter.format(earning.totalSales),
//                   ),
//                   _buildDetailColumn(
//                     'Commission',
//                     currencyFormatter.format(earning.commission),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailColumn(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Color.fromARGB(255, 0, 0, 0),
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(
//           value,
//           style: TextStyle(
//             color: const Color.fromARGB(221, 0, 0, 0),
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ],
//     );
//   }
// }