import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DrawerBar/drawer.dart';
import '../Referalscreen/refer_screen.dart';
import '../main.dart';
import '../Referalscreen/referal_earning.dart';
import '../Salesscreen/sales_earn_screen.dart';
import '../shop/myshop.dart';
import '../shop/shop_count.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late ScrollController _scrollController;
  double _scrollPosition = 0.0;
  int _currentImageIndex = 0;

  final List<Map<String, dynamic>> _salesEarnings = [
    {'shop': 'Main Store', 'amount': 5600.50, 'date': '2024-01-15'},
    {'shop': 'City Branch', 'amount': 4200.75, 'date': '2024-01-16'},
    {'shop': 'Online Store', 'amount': 7800.25, 'date': '2024-01-17'},
  ];

  final List<Map<String, dynamic>> _referalEarnings = [
    {'name': 'John Doe', 'amount': 350.00},
    {'name': 'Jane Smith', 'amount': 275.50},
    {'name': 'Mike Johnson', 'amount': 425.75},
  ];

  final List<Map<String, dynamic>> _shopList = [
    {'name': 'Main Store', 'location': 'Downtown'},
    {'name': 'City Branch', 'location': 'Shopping District'},
    {'name': 'Online Store', 'location': 'E-commerce Platform'},
  ];

  final List<Map<String, dynamic>> _staffList = [
    {'name': 'Emily Rodriguez', 'position': 'Store Manager'},
    {'name': 'Alex Chen', 'position': 'Sales Associate'},
    {'name': 'Sarah Williams', 'position': 'Customer Service'},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
        _currentImageIndex = (_scrollPosition / 250).floor();
      });
    });
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

  bool _isDarkMode = false;
  String _selectedLanguage = 'English';

  void _onThemeChanged(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  void _onLogout() {
    // Handle logout functionality
  }
  void _showShopList() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        child: ListView.builder(
          itemCount: _shopList.length,
          itemBuilder: (context, index) {
            final shop = _shopList[index];
            return ListTile(
              title: Text(shop['name']),
              subtitle: Text(shop['location']),
              leading: Icon(Icons.store, color: Colors.blue),
            );
          },
        ),
      ),
    );
  }

  void _showStaffList() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        child: ListView.builder(
          itemCount: _staffList.length,
          itemBuilder: (context, index) {
            final staff = _staffList[index];
            return ListTile(
              title: Text(staff['name']),
              subtitle: Text(staff['position']),
              leading: CircleAvatar(
                child: Text(staff['name'][0]),
              ),
            );
          },
        ),
      ),
    );
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

  String selectedLanguage = 'English (US)';
  bool isDarkMode = false;
  List<String> filteredRestaurantNames = [];
  TextEditingController searchController = TextEditingController();
  List<String> filteredItems = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.home_filled,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: CircleAvatar(
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
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
      ),
      drawer: CustomDrawer(
        selectedLanguage: _selectedLanguage,
        isDarkMode: _isDarkMode,
        onThemeChanged: _onThemeChanged,
        onLogout: _onLogout,
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
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
          child: FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(22)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Sales Earnings Card
                              Expanded(
                                child: OpenContainer(
                                  closedBuilder: (context, action) =>
                                      GestureDetector(
                                    onTap: () => SalesEarningsDetailsScreen(),
                                    child: Card(
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.currency_bitcoin,
                                                color: Color.fromARGB(
                                                    255, 117, 0, 106)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Sales Earnings',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              '₹17,600.50',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  openBuilder: (context, _) =>
                                      SalesEarningsDetailsScreen(),
                                ),
                              ),

                              SizedBox(width: 16),

                              // Referral Earnings Card
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ReferEarningsScreen(),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.people_outline,
                                            color: Color.fromARGB(
                                                255, 117, 0, 106),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Referral Earnings',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            '₹1,051.25',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Icon(Icons.people_outline,
                                              color: Color.fromARGB(
                                                  255, 117, 0, 106)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          children: [
                            Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopListScreen()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.store,
                                      size: 50,
                                      color: Color.fromARGB(255, 117, 0, 106),
                                    ),
                                    Text('Shop Count',
                                        style: TextStyle(fontSize: 16)),
                                    Text('15',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: InkWell(
                                onTap: _showStaffList,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      size: 50,
                                      color: Color.fromARGB(255, 117, 0, 106),
                                    ),
                                    Text('Staff Count',
                                        style: TextStyle(fontSize: 16)),
                                    Text('10',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BannerImageCarousel(
                    imagePaths: [
                      'assets/images/257175-P4N6KB-87.jpg',
                      'assets/images/2401330.jpg',
                      'assets/images/Screenshot 2024-12-18 122831.png',
                      'assets/images/3507.jpg',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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

  Widget _buildBannerCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 400,
          width: double.infinity,
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
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagePaths.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 25 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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

  @override
  Widget build(BuildContext context) {
    return _buildBannerCarousel();
  }
}
