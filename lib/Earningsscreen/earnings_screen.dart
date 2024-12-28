import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../bottomscreen/bottom_screen.dart';
import '../colors/colors.dart';

class EarningDetail {
  final String id;
  final DateTime date;
  final String shopName;
  final double totalSales;
  final double commission;
  final String status;
  bool isExpanded;

  EarningDetail({
    required this.id,
    required this.date,
    required this.shopName,
    required this.totalSales,
    required this.commission,
    required this.status,
    this.isExpanded = false,
  });
}

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final currencyFormatter =
      NumberFormat.currency(symbol: '₹', decimalDigits: 2);

  final List<EarningDetail> earnings = [
    EarningDetail(
      id: 'EARN654646001',
      date: DateTime(2024, 1, 15, 10, 30), // Specific time: 10:30 AM
      shopName: 'Downtown Boutique',
      totalSales: 12500.00,
      commission: 625.00,
      status: 'Completed',
    ),
    EarningDetail(
      id: 'EARN6654646002',
      date: DateTime(2024, 1, 22, 14, 45), // Specific time: 2:45 PM
      shopName: 'Riverside Market',
      totalSales: 8200.00,
      commission: 410.00,
      status: 'Completed',
    ),
    EarningDetail(
      id: 'EARN64644645003',
      date: DateTime(2024, 1, 30, 9, 0), // Specific time: 9:00 AM
      shopName: 'Sunset Gallery',
      totalSales: 15300.00,
      commission: 765.00,
      status: 'Completed',
    ),
    EarningDetail(
      id: 'EARN654654004',
      date: DateTime(2024, 2, 5, 18, 15), // Specific time: 6:15 PM
      shopName: 'Urban Marketplace',
      totalSales: 9800.00,
      commission: 490.00,
      status: 'Completed',
    ),
  ];
  String filter = 'All'; // Default filter option

  // Method to show the filter options dialog
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleExpand(int index) {
    setState(() {
      earnings[index].isExpanded = !earnings[index].isExpanded;
    });
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        tabs: const [
          Tab(text: 'Shop Sales'),
          Tab(text: 'Purchase Earnings'),
          Tab(text: 'Total Earnings'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildTransactionsList(),
        _buildTransactionsList(),
        _buildTransactionsList(),
      ],
    );
  }

  Widget _buildTransactionsList() {
    if (earnings.isEmpty) {
      return _buildEmptyState('No earnings data available');
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: earnings.length,
        itemBuilder: (context, index) =>
            _buildTransactionCard(earnings[index], index),
      );
    }
  }

  Widget _buildTransactionCard(EarningDetail earning, int index) {
    Color statusColor =
        earning.status == 'Completed' ? Colors.green : Colors.grey;

    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => toggleExpand(index),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTransactionHeader(earning, statusColor),
              if (earning.isExpanded) _buildExpandedContent(earning),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionHeader(EarningDetail earning, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    earning.shopName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  _buildStatusBadge(earning.status, statusColor),
                ],
              ),
              SizedBox(height: 4),
              Text(
                ' ${currencyFormatter.format(earning.totalSales)}',
                style: TextStyle(
                    color: const Color.fromARGB(255, 60, 199, 42),
                    fontSize: 12),
              ),
              SizedBox(height: 4),
              Text(
                'Trans ID: ${earning.id}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Text(
                DateFormat('dd MMM yyyy hh:mm a').format(earning.date),
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status, Color color) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 1),
          ),
          child: Text(
            status,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 8),
        Icon(
          status == 'Completed'
              ? Icons.keyboard_arrow_down_outlined
              : Icons.keyboard_arrow_down,
          color: const Color.fromARGB(255, 94, 94, 94),
        ),
      ],
    );
  }

  Widget _buildExpandedContent(EarningDetail earning) {
    return Column(
      children: [
        Divider(height: 24),
        _buildTransactionDetail(
            'Total Sales', currencyFormatter.format(earning.totalSales)),
        _buildTransactionDetail(
            'Commission', currencyFormatter.format(earning.commission)),
        _buildTransactionDetail('Net Earnings',
            currencyFormatter.format(earning.totalSales - earning.commission)),
      ],
    );
  }

  Widget _buildTransactionDetail(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _buildEarningsSummaryCard() {
    double totalSales = earnings.fold(0, (sum, item) => sum + item.totalSales);
    double totalCommission =
        earnings.fold(0, (sum, item) => sum + item.commission);

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.bannerGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.purple,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSummaryColumn(
              'Total Earnings', currencyFormatter.format(totalSales)),
          _buildSummaryColumn(
              'Total Commission', currencyFormatter.format(totalCommission)),
        ],
      ),
    );
  }

  Widget _buildSummaryColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
            shaderCallback: (bounds) =>
                      AppColors.goldPurpleShader(bounds),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),

        ShaderMask(
            shaderCallback: (bounds) =>
                      AppColors.goldPurpleShader(bounds),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: Column(
          children: [
            _buildEarningsSummaryCard(),
            _buildTabBar(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => _showFilterOptions(context),
                  icon: Icon(Icons.tune_outlined,
                      color: const Color.fromARGB(255, 255, 255, 255), size: 28),
                ),
                Text(
                  ' Today Earnings  ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(Icons.sort,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
             flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
            
          ),
        ),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomBarscreen()),
          );
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      title: Text(
        'Total Earnings Report',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.tune_outlined, color: Colors.white),
          onPressed: () => _showFilterOptions(context),
        ),
      ],
    );
  }
}
