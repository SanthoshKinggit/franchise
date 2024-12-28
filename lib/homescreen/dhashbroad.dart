import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Ads/ads.dart';
import '../DrawerBar/drawer.dart';
import '../Earningsscreen/earnings_screen.dart';
import '../Referalscreen/refer_screen.dart';
import '../Salesscreen/s.dart';
import '../ShopCount/shop_count_list.dart';
import '../StaffCount/staffview.dart';
import '../colors/colors.dart';
// ... other imports remain same

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController _scrollController;
  double _scrollPosition = 0.0;
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.forward();
  }

  void _startAutoScroll() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        _scrollPosition += 400.0;
        if (_scrollPosition >= 1000.0) {
          _scrollPosition = 0.0;
        }
        _scrollController.animateTo(
          _scrollPosition,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }
  //   bool _isDarkMode = false;
  // String _selectedLanguage = 'English';

  void _onThemeChanged(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  void _onLogout() {
    // Handle logout functionality
  }
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    String? value,
    required Function() onTap,
    Color? titleColor,
    Widget? trailing,
    bool showArrow = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey[600],
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.black87,
          fontSize: 16,
          fontFamily: 'Nunito',
        ),
      ),
      trailing: trailing ??
          (showArrow
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (value != null)
                      Text(
                        value,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Nunito',
                          fontSize: 14,
                        ),
                      ),
                    if (value != null) const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 16,
                    ),
                  ],
                )
              : null),
      onTap: () {
        // Close drawer before navigation
        Navigator.pop(context);
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackGradient,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
            height: isSmallScreen ? 14 : 18,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            height: isSmallScreen ? 80 : 100,
            width: isSmallScreen ? 80 : 100,
            child: Image.asset(
              'assets/images/WhatsApp_Image_2024-12-02_at_2.06.40_AM-removebg-preview.png',
              height: isSmallScreen ? 40 : 60,
            ),
          ),
        ),
        actions: [
          Icon(Icons.search,
              color: Colors.white, size: isSmallScreen ? 16 : 20),
          SizedBox(width: isSmallScreen ? 12 : 20),
          Icon(Icons.notifications_none_outlined,
              color: Colors.white, size: isSmallScreen ? 16 : 20),
          SizedBox(width: isSmallScreen ? 12 : 20),
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: CircleAvatar(
                radius: isSmallScreen ? 12 : 16,
                child: Icon(Icons.person,
                    color: Colors.white, size: isSmallScreen ? 16 : 20),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],

        // ... flexibleSpace remains same
      ),
      drawer: CustomDrawer(
        selectedLanguage: _selectedLanguage,
        isDarkMode: _isDarkMode,
        onThemeChanged: _onThemeChanged,
        onLogout: _onLogout,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 4.0 : 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.03),

                // Banner Cards
                SizedBox(
                  height: screenSize.height * 0.14,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCardbanner(
                          context,
                          'assets/logo/3309577.jpg',
                          'Total Earnings',
                          '₹ 18,651.75',
                          'Earnings Amount',
                          Icons.double_arrow_sharp,
                          WaveBackgroundPainter(),
                          size: Size(
                              screenSize.width * 0.8, screenSize.height * 0.2),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 0, 0, 0),
                              Color.fromARGB(255, 82, 82, 82),
                              const Color.fromARGB(255, 0, 0, 0),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        SizedBox(width: 12),
                        _buildCardbanner(
                          context,
                          'assets/logo/3309577.jpg',
                          'Today\'s Earnings',
                          '₹ 2,095.24',
                          'Earning History',
                          Icons.trending_up,
                          WaveBackgroundPainter1(),
                          size: Size(
                              screenSize.width * 0.8, screenSize.height * 0.2),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 119, 119, 119),
                              Color.fromARGB(255, 0, 0, 0),
                              const Color.fromARGB(255, 100, 100, 100),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),

                // Earnings Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard(
                      icon: Icons.currency_franc,
                      title: 'Sales Earnings',
                      amount: '₹17,600.50',
                      color: const Color.fromARGB(255, 26, 211, 32),
                      width: screenSize.width * 0.45,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                    _buildCard2(
                      context: context,
                      icon: Icons.person_add_alt_outlined,
                      title: 'Referral Earnings',
                      amount: '₹1,051.25',
                      color: const Color.fromARGB(255, 29, 153, 255),
                      width: screenSize.width * 0.45,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),

                // Count Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCountCard(
                      context: context,
                      icon: Icons.store_outlined,
                      title: 'Shop Count',
                      count: ' 15',
                      width: screenSize.width * 0.45,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                    _buildCountCard2(
                      context: context,
                      icon: Icons.people_outline,
                      title: 'Staff Count',
                      count: ' 10',
                      width: screenSize.width * 0.45,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),
                 Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Ads ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                 Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdsScreen(),
          ),
        );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
                // Banner Carousel with responsive height
                Container(
                  height: screenSize.height * 0.25,
                  child: BannerImageCarousel(imagePaths: [
                    'assets/images/257175-P4N6KB-87.jpg',
                    'assets/images/2401330.jpg',
                    'assets/images/Screenshot 2024-12-18 122831.png',
                    'assets/images/3507.jpg',
                    'assets/images/257175-P4N6KB-87.jpg',
                    'assets/images/Screenshot 2024-12-18 122831.png',
                    'assets/images/Screenshot 2024-12-18 122831.png',
                  ]),
                ),

                SizedBox(height: screenSize.height * 0.15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String amount,
    required Color color,
    required double width,
    required double fontSize,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SalesEarningsDetailsScreen(),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 251, 221, 255),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/sales (1).png',
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      amount,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: color,
                        fontSize: fontSize + 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Similarly update _buildCard2, _buildCountCard, _buildCountCard2 with width and fontSize parameters
  // Update _buildCardbanner to accept a Size parameter for responsive dimensions
  Widget _buildCardbanner(
    BuildContext context,
    String imagePath,
    String amountLabel,
    String amount,
    String infoLabel,
    IconData icon,
    CustomPainter painter, {
    required Gradient gradient,
    required Size size,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EarningsScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: painter)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.goldPurpleShader(bounds),
                    child: Text(amountLabel,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppColors.goldPurpleShader(bounds),
                        child: Text(amount,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppColors.goldPurpleShader(bounds),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(icon, color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppColors.goldPurpleShader(bounds),
                        child: Text(infoLabel,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ),
                      // Icon(icon, color: Colors.white, size: 30),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card widget for referral earnings
Widget _buildCard2({
  required BuildContext context, // Add BuildContext here
  required IconData icon,
  required String title,
  required String amount,
  required Color color,
  required double width,
  required double fontSize,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReferralEarningsScreen(),
        ),
      );
    },
    child: Container(
      width: width, // Use the passed width parameter instead of MediaQuery
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 251, 217, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/bonus (3).png',
                  height: 30,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              amount,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: color,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Card widget for shop count
Widget _buildCountCard({
  required BuildContext context, // Add BuildContext here

  required IconData icon,
  required String title,
  required String count,
  required double width,
  required int fontSize,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllShopListScreen(),
        ),
      );
    },
    child: Container(
      width: width, // Use the passed width parameter
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 251, 220, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/product-range (1).png',
                  height: 30,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Card widget for staff count
Widget _buildCountCard2({
  required BuildContext context, // Add BuildContext here

  required IconData icon,
  required String title,
  required String count,
  required double width,
  required int fontSize,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StaffDetailsScreen1(),
        ),
      );
    },
    child: Container(
      width: width, // Use the passed width parameter
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 248, 197, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 30,
                  color: Color.fromARGB(255, 117, 0, 106),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class WaveBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // Purple Wave
    paint.color = Colors.white.withOpacity(0.4);
    Path purpleWave = Path()
      ..moveTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.7,
      )
      ..quadraticBezierTo(
        size.width * 0.9,
        size.height * 0.9,
        size.width,
        size.height * 0.7,
      )
      // Bottom right rounded corner
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
      // Bottom left rounded corner
      ..lineTo(20, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 20)
      ..close();
    canvas.drawPath(purpleWave, paint);

    // Orange Wave
    paint.color = Colors.white.withOpacity(0.2);
    Path orangeWave = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.4,
        size.height * 0.6,
        size.width * 0.7,
        size.height * 0.8,
      )
      ..quadraticBezierTo(
        size.width * 0.95,
        size.height,
        size.width,
        size.height * 0.85,
      )
      // Bottom right rounded corner
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
      // Bottom left rounded corner
      ..lineTo(20, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 20)
      ..close();
    canvas.drawPath(orangeWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WaveBackgroundPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // Purple Wave
    paint.color = Colors.white.withOpacity(0.2);
    Path purpleWave = Path()
      ..moveTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.7,
      )
      ..quadraticBezierTo(
        size.width * 0.9,
        size.height * 0.9,
        size.width,
        size.height * 0.7,
      )
      // Bottom right rounded corner
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
      // Bottom left rounded corner
      ..lineTo(20, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 20)
      ..close();
    canvas.drawPath(purpleWave, paint);

    // Orange Wave
    paint.color = Colors.white.withOpacity(0.2);
    Path orangeWave = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.4,
        size.height * 0.6,
        size.width * 0.7,
        size.height * 0.8,
      )
      ..quadraticBezierTo(
        size.width * 0.95,
        size.height,
        size.width,
        size.height * 0.85,
      )
      // Bottom right rounded corner
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
      // Bottom left rounded corner
      ..lineTo(20, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 20)
      ..close();
    canvas.drawPath(orangeWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BannerImageCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const BannerImageCarousel({Key? key, required this.imagePaths})
      : super(key: key);

  @override
  _BannerImageCarouselState createState() => _BannerImageCarouselState();
}

class _BannerImageCarouselState extends State<BannerImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < widget.imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: widget.imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(),
                child: ClipRRect(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagePaths.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: _currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _currentPage == index
                    ? Colors.purple
                    : Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
