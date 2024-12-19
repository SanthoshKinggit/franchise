import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import '../Earningsscreen/earnings_screen.dart';
import '../colors/colors.dart';
import '../homescreen/dhashbroad.dart';
import '../Salesscreen/sales_earn_screen.dart';
import '../shop/myshop.dart';

class BottomBarscreen extends StatefulWidget {
  const BottomBarscreen({super.key});

  @override
  State<BottomBarscreen> createState() => _BottomBarscreenState();
}

class _BottomBarscreenState extends State<BottomBarscreen> {
  int _tabIndex = 0; // Default to the first tab
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  // Gradient icon for active icons
  Widget _buildGradientIcon(IconData iconData, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center both icon and label
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => AppColors.goldenPurpleShader(bounds),
          child: Icon(
            iconData,
            size: 28, // Icon size
            color: Colors.white, // The gradient will override this
          ),
        ),
        if (!isActive) // Only show the label if the tab is not active
          SizedBox(height: 4),
        if (!isActive)
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
      ],
    );
  }

  // Inactive icons with labels
  Widget _buildInactiveIcon(IconData iconData, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center both icon and label
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => AppColors.goldPurpleShader(bounds),
          child: Icon(
            iconData,
            size: 28,
            color: Colors.white,
          ),
        ),
        if (!isActive) // Only show the label if the tab is not active
          SizedBox(height: 4),
        if (!isActive)
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          _buildGradientIcon(Icons.home, 'Home', _tabIndex == 0), // Home icon with label
          _buildGradientIcon(Icons.shopping_bag_outlined, 'Shop', _tabIndex == 1), // Shop icon with label
          _buildGradientIcon(Icons.point_of_sale_sharp, 'Sales', _tabIndex == 2), // Sales icon with label
          _buildGradientIcon(Icons.currency_rupee, 'Earnings', _tabIndex == 3), // Earnings icon with label
        ],
        inactiveIcons: [
          _buildInactiveIcon(Icons.home, 'Home', _tabIndex == 0), // Home icon with label
          _buildInactiveIcon(Icons.shopping_bag_outlined, 'Shop', _tabIndex == 1), // Shop icon with label
          _buildInactiveIcon(Icons.point_of_sale_sharp, 'Sales', _tabIndex == 2), // Sales icon with label
          _buildInactiveIcon(Icons.currency_rupee, 'Earnings', _tabIndex == 3), // Earnings icon with label
        ],
        color: Colors.white,
        circleColor: Colors.white,
        circleShadowColor: AppColors.mainColor,
        gradient: AppColors.blackGradient,
        circleGradient: AppColors.blackGradient,
        height: 70, // Increase the height of the bottom bar
        circleWidth: 70, // Increase the size of the circle icons
        activeIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            pageController.jumpToPage(_tabIndex);
          });
        },
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0), // Remove bottom padding
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        elevation: 10, // Increase elevation for a better floating effect
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          setState(() {
            _tabIndex = v;
          });
        },
        children: [
          DashboardScreen(), // Home screen
          ShopsListScreen(), // Shop screen
          SalesEarningsDetailsScreen(), // Sales screen
          EarningsScreen(), // Earnings screen
          ShopsListScreen(),
        ],
      ),
    );
  }
}
