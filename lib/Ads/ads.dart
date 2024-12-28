import 'dart:async';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bottomscreen/bottom_screen.dart';
import '../colors/colors.dart';

class AdsScreen extends StatefulWidget {
  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  final List<String> _topBanners = [
    'assets/images/257175-P4N6KB-87.jpg',
    'assets/images/2401330.jpg',
    'assets/images/Screenshot 2024-12-18 122831.png',
    'assets/images/3507.jpg',
    'assets/images/257175-P4N6KB-87.jpg',
  ];
  final List<String> _middleBanners1 = [
    'assets/images/257175-P4N6KB-87.jpg',
    'assets/images/257175-P4N6KB-87.jpg',
    'assets/images/2401330.jpg',
    'assets/images/Screenshot 2024-12-18 122831.png',
  ];

  final List<String> _middleBanners2 = [
    'assets/images/3507.jpg',
    'assets/images/257175-P4N6KB-87.jpg',
    'assets/images/257175-P4N6KB-87.jpg',
    'assets/images/Screenshot 2024-12-18 122831.png',
  ];

  final List<String> _bottomBanners = [
    'assets/images/3507.jpg',
    'assets/images/257175-P4N6KB-87.jpg',
    'assets/images/3507.jpg',
    'assets/images/Screenshot 2024-12-18 122831.png',
  ];

  PageController _topPageController = PageController();
  PageController _bottomPageController = PageController();
  PageController _middlePageController1 = PageController();
  PageController _middlePageController2 = PageController();

  int _topCurrentIndex = 0;
  int _bottomCurrentIndex = 0;
  int _middleCurrentIndex1 = 0;
  int _middleCurrentIndex2 = 0;

  Timer? _topTimer;
  Timer? _bottomTimer;
  Timer? _middleTimer1;
  Timer? _middleTimer2;

  @override
  void initState() {
    super.initState();
    _startTopAutoSlide();
    _startBottomAutoSlide();
    _startMiddleAutoSlide1();
    _startMiddleAutoSlide2();
  }

  @override
  void dispose() {
    _topTimer?.cancel();
    _bottomTimer?.cancel();
    _middleTimer1?.cancel();
    _middleTimer2?.cancel();
    super.dispose();
  }

  void _startTopAutoSlide() {
    _topTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_topCurrentIndex < _topBanners.length - 1) {
        _topCurrentIndex++;
      } else {
        _topCurrentIndex = 0;
      }
      _topPageController.animateToPage(
        _topCurrentIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  void _startBottomAutoSlide() {
    _bottomTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_bottomCurrentIndex < _bottomBanners.length - 1) {
        _bottomCurrentIndex++;
      } else {
        _bottomCurrentIndex = 0;
      }
      _bottomPageController.animateToPage(
        _bottomCurrentIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  void _startMiddleAutoSlide1() {
    _middleTimer1 = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_middleCurrentIndex1 < _middleBanners1.length - 1) {
        _middleCurrentIndex1++;
      } else {
        _middleCurrentIndex1 = 0;
      }
      _middlePageController1.animateToPage(
        _middleCurrentIndex1,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  void _startMiddleAutoSlide2() {
    _middleTimer2 = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_middleCurrentIndex2 < _middleBanners2.length - 1) {
        _middleCurrentIndex2++;
      } else {
        _middleCurrentIndex2 = 0;
      }
      _middlePageController2.animateToPage(
        _middleCurrentIndex2,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  Widget _buildGradientIcon(IconData iconData, [String? text]) {
    return ShaderMask(
      shaderCallback: (bounds) => AppColors.goldenPurpleShader(bounds),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 24,
            color: Colors.white, // The gradient will override this
          ),
          if (text != null)
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white, // Inactive text color
              ),
            ),
        ],
      ),
    );
  }

  Widget buildGradientIcon(IconData iconData, String text) {
    return ShaderMask(
      shaderCallback: (bounds) => AppColors.goldPurpleShader(bounds),
      child: Column(
        children: [
          Icon(iconData,
              size: 24, color: Colors.white // The gradient will override this
              ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white, // Inactive text color
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Background color of the status bar
        statusBarIconBrightness:
            Brightness.dark, // Set to Brightness.light for white icons
        statusBarBrightness: Brightness.dark, // For iOS status bar text color
      ),
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50), // Adjust height as needed
              child: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.blackGradient,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                ),
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                title: Row(
                  children: [
                    SizedBox(width: 8), // Space between back icon and logo
                    Container(
                      height: 100, // Adjust as needed
                      width: 100, // Adjust as needed
                      child: Image.asset(
                          "assets/images/WhatsApp_Image_2024-12-02_at_2.06.40_AM-removebg-preview.png",
                          fit: BoxFit.contain),
                    ),
                  ],
                ),
                actions: [
                  ShaderMask(
                      shaderCallback: (bounds) =>
                          AppColors.goldPurpleShader(bounds),
                      child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => NotificationPage()),
                            // );
                          },
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Scaffold.of(context)
                            .openDrawer(); // Open the drawer on click
                      },
                      child: Container(
                        width:
                            35, // Adjust as needed to ensure border visibility
                        height: 35, // Same as width to keep it circular
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.purpleGradient,
                          border: Border.all(
                            color: Colors
                                .transparent, // Ensures the border color blends with the gradient
                            width: 1, // Adjust width as needed
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
                            ),

                            radius:
                                15, // Adjust to fit inside the container and leave space for the border
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    _buildBannerPageView(
                        _topBanners, _topPageController, _topCurrentIndex),
                    SizedBox(height: 5),
                    _buildBannerPageView(_middleBanners1,
                        _middlePageController1, _middleCurrentIndex1),
                    SizedBox(height: 5),
                    _buildBannerPageView(_middleBanners2,
                        _middlePageController2, _middleCurrentIndex2),
                    SizedBox(height: 5),
                    _buildBannerPageView(_bottomBanners, _bottomPageController,
                        _bottomCurrentIndex),
                  ],
                ),
              ),
            ),
          
          ),
        ),
      ),
    );
  }

  Widget _buildBannerPageView(
      List<String> banners, PageController controller, int currentIndex) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 2.0), // Add horizontal space between slides
                child: Card(
                  elevation: 8, // Adds a shadow effect to the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      banners[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    gradient:
                        currentIndex == index ? AppColors.blackGradient : null,
                    color: currentIndex == index
                        ? null
                        : AppColors.smalltextColor, // Default single color
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
