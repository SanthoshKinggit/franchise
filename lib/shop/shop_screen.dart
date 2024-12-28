//    // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //   children: [
//                         //     Container(
//                         //       padding: EdgeInsets.all(20),
//                         //       decoration: BoxDecoration(
//                         //         gradient: LinearGradient(
//                         //           begin: Alignment.topLeft,
//                         //           end: Alignment.bottomRight,
//                         //           colors: [
//                         //             Color.fromARGB(255, 104, 0, 93)
//                         //                 .withOpacity(0.8),
//                         //             Color.fromARGB(255, 228, 0, 205)
//                         //                 .withOpacity(0.8),
//                         //             Color.fromARGB(255, 90, 0, 81)
//                         //                 .withOpacity(0.8),
//                         //           ],
//                         //         ),
//                         //         borderRadius: BorderRadius.circular(16),
//                         //         boxShadow: [],
//                         //       ),
//                         //       child: Column(
//                         //         children: [
//                         //           Row(
//                         //             mainAxisAlignment:
//                         //                 MainAxisAlignment.spaceAround,
//                         //             children: [
//                         //               Text(
//                         //                 'Total Earnings',
//                         //                 style: GoogleFonts.poppins(
//                         //                   fontWeight: FontWeight.w500,
//                         //                   color: Colors.white,
//                         //                   fontSize: 14,
//                         //                 ),
//                         //               ),
//                         //             ],
//                         //           ),
//                         //           Row(
//                         //             children: [
//                         //               Text(
//                         //                 '₹18,651.75',
//                         //                 style: GoogleFonts.poppins(
//                         //                   color: Colors.white,
//                         //                   fontSize: 24,
//                         //                   fontWeight: FontWeight.bold,
//                         //                 ),
//                         //               ),
//                         //             ],
//                         //           ),
//                         //         ],
//                         //       ),
//                         //     ),
//                         //     Container(
//                         //       padding: EdgeInsets.all(20),
//                         //       decoration: BoxDecoration(
//                         //         gradient: LinearGradient(
//                         //           colors: [
//                         //             Color.fromARGB(255, 104, 0, 93)
//                         //                 .withOpacity(0.8),
//                         //             Color.fromARGB(255, 228, 0, 205)
//                         //                 .withOpacity(0.8),
//                         //             Color.fromARGB(255, 90, 0, 81)
//                         //                 .withOpacity(0.8),
//                         //           ],
//                         //           begin: Alignment.topLeft,
//                         //           end: Alignment.bottomRight,
//                         //         ),
//                         //         borderRadius: BorderRadius.circular(15),
//                         //         boxShadow: [],
//                         //       ),
//                         //       child: Row(
//                         //         children: [
//                         //           Column(
//                         //             children: [
//                         //               Row(
//                         //                 children: [
//                         //                   Text(
//                         //                     'Today\'s Earnings',
//                         //                     style: GoogleFonts.poppins(
//                         //                       color: Colors.white,
//                         //                       fontWeight: FontWeight.w500,
//                         //                       fontSize: 14,
//                         //                     ),
//                         //                   ),
//                         //                 ],
//                         //               ),
//                         //               Row(
//                         //                 children: [
//                         //                   Text(
//                         //                     '₹2,095',
//                         //                     style: GoogleFonts.poppins(
//                         //                       color: Colors.white,
//                         //                       fontSize: 24,
//                         //                       fontWeight: FontWeight.bold,
//                         //                     ),
//                         //                   ),
//                         //                 ],
//                         //               ),
//                         //             ],
//                         //           ),
//                         //         ],
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),
//                         import 'package:flutter/material.dart';

// // import '../Password/reset_password.dart';
// // import '../bottomscreen/bottom_screen.dart';
// // import '../colors/colors.dart';

// // class Signinscreen extends StatefulWidget {
// //   const Signinscreen({super.key});

// //   @override
// //   State<Signinscreen> createState() => _SigninscreenState();
// // }

// // class _SigninscreenState extends State<Signinscreen> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   bool _rememberMe = false;
// //   bool _isPasswordVisible = false;

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // Using MediaQuery with SafeArea for better screen adaptation
// //     final size = MediaQuery.of(context).size;
// //     final padding = MediaQuery.of(context).padding;
// //     final safeHeight = size.height - padding.top - padding.bottom;
    
// //     return Scaffold(
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           physics: const ClampingScrollPhysics(),
// //           child: Container(
// //             height: safeHeight,
// //             decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
// //             child: Padding(
// //               padding: EdgeInsets.symmetric(
// //                 horizontal: size.width * 0.05,
// //                 vertical: safeHeight * 0.02,
// //               ),
// //               child: Column(
// //                 children: [
// //                   // Logo section - 20% of safe height
// //                   SizedBox(
// //                     height: safeHeight * 0.2,
// //                     child: Image.asset(
// //                       'assets/images/image-removebg-preview.png',
// //                       fit: BoxFit.contain,
// //                     ),
// //                   ),

// //                   // Title section - 15% of safe height
// //                   SizedBox(
// //                     height: safeHeight * 0.15,
// //                     child: Align(
// //                       alignment: Alignment.centerLeft,
// //                       child: Text(
// //                         'Log in\nYour Account',
// //                         style: TextStyle(
// //                           color: Colors.amber,
// //                           fontSize: size.width * 0.07,
// //                           fontWeight: FontWeight.bold,
// //                           fontFamily: 'Nunito',
// //                           height: 1.2,
// //                         ),
// //                       ),
// //                     ),
// //                   ),

// //                   // Form section - 45% of safe height
// //                   SizedBox(
// //                     height: safeHeight * 0.45,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         _buildTextField(
// //                           controller: _emailController,
// //                           hintText: 'Email',
// //                           prefixIcon: Icons.email_outlined,
// //                           screenWidth: size.width,
// //                         ),
// //                         _buildTextField(
// //                           controller: _passwordController,
// //                           hintText: 'Password',
// //                           prefixIcon: Icons.lock_outline,
// //                           obscureText: !_isPasswordVisible,
// //                           screenWidth: size.width,
// //                           suffixIcon: IconButton(
// //                             icon: Icon(
// //                               _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// //                               color: Colors.white,
// //                             ),
// //                             onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
// //                           ),
// //                         ),
// //                         // Remember me row
// //                         Row(
// //                           children: [
// //                             SizedBox(
// //                               height: size.width * 0.08,
// //                               width: size.width * 0.08,
// //                               child: Checkbox(
// //                                 checkColor: Colors.white,
// //                                 value: _rememberMe,
// //                                 onChanged: (value) => setState(() => _rememberMe = value ?? false),
// //                                 shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(4),
// //                                 ),
// //                               ),
// //                             ),
// //                             Text(
// //                               'Remember me',
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: size.width * 0.035,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         // Login button
// //                         SizedBox(
// //                           width: size.width * 0.8,
// //                           height: size.height * 0.06,
// //                           child: ElevatedButton(
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(builder: (context) => BottomBarscreen()),
// //                               );
// //                               _showSuccessSnackBar(context);
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(size.width * 0.08),
// //                               ),
// //                               padding: EdgeInsets.zero,
// //                             ),
// //                             child: const Text('Log in',
// //                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   // Social login section - 20% of safe height
// //                   SizedBox(
// //                     height: safeHeight * 0.2,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         TextButton(
// //                           onPressed: () => Navigator.push(
// //                             context,
// //                             MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
// //                           ),
// //                           child: Text(
// //                             'Forgot Password?',
// //                             style: TextStyle(
// //                               color: Colors.amber,
// //                               fontSize: size.width * 0.035,
// //                             ),
// //                           ),
// //                         ),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                           children: [
// //                             _buildSocialIcon('assets/images/Google_Icons-09-512.webp', size),
// //                             _buildSocialIcon('assets/images/apple-logo-transparent.png', size),
// //                             _buildSocialIcon('assets/images/Facebook_Logo_2023.png', size),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String hintText,
// //     required IconData prefixIcon,
// //     required double screenWidth,
// //     bool obscureText = false,
// //     Widget? suffixIcon,
// //   }) {
// //     return Container(
// //       height: screenWidth * 0.14,
// //       decoration: BoxDecoration(
// //         color: Colors.white.withOpacity(0.2),
// //         borderRadius: BorderRadius.circular(screenWidth * 0.04),
// //       ),
// //       child: TextField(
// //         controller: controller,
// //         obscureText: obscureText,
// //         style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
// //         decoration: InputDecoration(
// //           hintText: hintText,
// //           hintStyle: TextStyle(
// //             color: Colors.white70,
// //             fontSize: screenWidth * 0.04,
// //           ),
// //           prefixIcon: Icon(prefixIcon, color: Colors.white, size: screenWidth * 0.06),
// //           suffixIcon: suffixIcon,
// //           border: InputBorder.none,
// //           contentPadding: EdgeInsets.symmetric(
// //             horizontal: screenWidth * 0.04,
// //             vertical: screenWidth * 0.04,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSocialIcon(String asset, Size size) {
// //     return SizedBox(
// //       width: size.width * 0.12,
// //       height: size.width * 0.12,
// //       child: Image.asset(asset, fit: BoxFit.contain),
// //     );
// //   }

// //   void _showSuccessSnackBar(BuildContext context) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: const Center(child: Text('Login Successful')),
// //         backgroundColor: Colors.black87,
// //         behavior: SnackBarBehavior.floating,
// //         margin: EdgeInsets.symmetric(
// //           horizontal: MediaQuery.of(context).size.width * 0.2,
// //           vertical: 10,
// //         ),
// //         duration: const Duration(seconds: 2),
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class DashboardScreen extends StatefulWidget {
// //   const DashboardScreen({Key? key}) : super(key: key);

// //   @override
// //   _DashboardScreenState createState() => _DashboardScreenState();
// // }

// // class _DashboardScreenState extends State<DashboardScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Get screen dimensions
// //     final size = MediaQuery.of(context).size;
// //     final padding = MediaQuery.of(context).padding;
// //     final safeHeight = size.height - padding.top - padding.bottom;
// //     final width = size.width;

// //     return Scaffold(
// //       appBar: _buildResponsiveAppBar(),
// //       body: Container(
// //         decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
// //         child: SingleChildScrollView(
// //           child: Padding(
// //             padding: EdgeInsets.symmetric(
// //               horizontal: width * 0.04,
// //               vertical: safeHeight * 0.02,
// //             ),
// //             child: Column(
// //               children: [
// //                 // Banner Cards Section - 30% of safe height
// //                 SizedBox(
// //                   height: safeHeight * 0.3,
// //                   child: SingleChildScrollView(
// //                     scrollDirection: Axis.horizontal,
// //                     child: Row(
// //                       children: [
// //                         _buildBannerCard(
// //                           context: context,
// //                           title: 'Total Earnings',
// //                           amount: '₹ 18,651.75',
// //                           subtitle: 'Earnings Amount',
// //                           width: width * 0.85,
// //                           height: safeHeight * 0.25,
// //                           gradient: const LinearGradient(
// //                             colors: [
// //                               Color.fromARGB(255, 43, 0, 23),
// //                               Color.fromARGB(255, 228, 0, 205),
// //                               Color.fromARGB(255, 43, 0, 23),
// //                             ],
// //                           ),
// //                           onTap: () => Navigator.push(
// //                             context,
// //                             MaterialPageRoute(builder: (context) => EarningsScreen()),
// //                           ),
// //                         ),
// //                         SizedBox(width: width * 0.04),
// //                         _buildBannerCard(
// //                           context: context,
// //                           title: 'Today\'s Earnings',
// //                           amount: '₹ 2,095',
// //                           subtitle: 'Earning History',
// //                           width: width * 0.85,
// //                           height: safeHeight * 0.25,
// //                           gradient: LinearGradient(
// //                             colors: [
// //                               Colors.pink.shade900,
// //                               const Color.fromARGB(255, 80, 2, 64),
// //                               Colors.pink.shade900,
// //                             ],
// //                           ),
// //                           onTap: () => Navigator.push(
// //                             context,
// //                             MaterialPageRoute(builder: (context) => ReferralEarningsScreen()),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),

// //                 SizedBox(height: safeHeight * 0.03),

// //                 // Earnings Cards Section - 25% of safe height
// //                 SizedBox(
// //                   height: safeHeight * 0.25,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       _buildEarningsCard(
// //                         width: width * 0.45,
// //                         height: safeHeight * 0.22,
// //                         title: 'Sales Earnings',
// //                         amount: '₹17,600.50',
// //                         iconPath: 'assets/images/sales (1).png',
// //                         onTap: () => Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => SalesEarningsDetailsScreen()),
// //                         ),
// //                       ),
// //                       _buildEarningsCard(
// //                         width: width * 0.45,
// //                         height: safeHeight * 0.22,
// //                         title: 'Referral Earnings',
// //                         amount: '₹1,051.25',
// //                         iconPath: 'assets/images/bonus (3).png',
// //                         onTap: () => Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => ReferralEarningsScreen()),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 SizedBox(height: safeHeight * 0.03),

// //                 // Count Cards Section - 25% of safe height
// //                 SizedBox(
// //                   height: safeHeight * 0.25,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       _buildCountCard(
// //                         width: width * 0.45,
// //                         height: safeHeight * 0.22,
// //                         title: 'Shop Count',
// //                         count: '15',
// //                         iconPath: 'assets/images/product-range (1).png',
// //                         onTap: () => Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => AllShopListScreen()),
// //                         ),
// //                       ),
// //                       _buildCountCard(
// //                         width: width * 0.45,
// //                         height: safeHeight * 0.22,
// //                         title: 'Staff Count',
// //                         count: '10',
// //                         icon: Icons.people_outline,
// //                         onTap: () => Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => StaffDetailsScreen1()),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 SizedBox(height: safeHeight * 0.03),

// //                 // Banner Carousel Section - Remaining height
// //                 SizedBox(
// //                   height: safeHeight * 0.3,
// //                   child: BannerImageCarousel(
// //                     height: safeHeight * 0.25,
// //                     imagePaths: [
// //                       'assets/images/257175-P4N6KB-87.jpg',
// //                       'assets/images/2401330.jpg',
// //                       'assets/images/Screenshot 2024-12-18 122831.png',
// //                       'assets/images/3507.jpg',
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   PreferredSizeWidget _buildResponsiveAppBar() {
// //     return AppBar(
// //       toolbarHeight: kToolbarHeight * 0.9, // Slightly reduced height
// //       leading: CircleAvatar(
// //         backgroundColor: Colors.transparent,
// //         child: Image.asset(
// //           'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
// //           height: kToolbarHeight * 0.5,
// //         ),
// //       ),
// //       title: SizedBox(
// //         height: kToolbarHeight * 0.8,
// //         child: Image.asset(
// //           'assets/images/WhatsApp_Image_2024-12-02_at_2.06.40_AM-removebg-preview.png',
// //           fit: BoxFit.contain,
// //         ),
// //       ),
// //       actions: [
// //         IconButton(
// //           icon: Icon(Icons.search, size: kToolbarHeight * 0.4),
// //           onPressed: () {},
// //         ),
// //         IconButton(
// //           icon: Icon(Icons.notifications_none_outlined, size: kToolbarHeight * 0.4),
// //           onPressed: () {},
// //         ),
// //         Builder(
// //           builder: (context) => IconButton(
// //             icon: CircleAvatar(
// //               child: Icon(Icons.person, size: kToolbarHeight * 0.4),
// //             ),
// //             onPressed: () => Scaffold.of(context).openDrawer(),
// //           ),
// //         ),
// //       ],
// //       flexibleSpace: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //             colors: [
// //               Colors.black,
// //               Color.fromARGB(255, 117, 0, 106),
// //               Colors.black,
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildBannerCard({
// //     required BuildContext context,
// //     required String title,
// //     required String amount,
// //     required String subtitle,
// //     required double width,
// //     required double height,
// //     required Gradient gradient,
// //     required VoidCallback onTap,
// //   }) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: width,
// //         height: height,
// //         decoration: BoxDecoration(
// //           gradient: gradient,
// //           borderRadius: BorderRadius.circular(20),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.2),
// //               blurRadius: 10,
// //               offset: const Offset(0, 5),
// //             ),
// //           ],
// //         ),
// //         child: CustomPaint(
// //           painter: WaveBackgroundPainter(),
// //           child: Padding(
// //             padding: EdgeInsets.all(width * 0.04),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 Text(
// //                   title,
// //                   style: TextStyle(
// //                     color: Colors.white70,
// //                     fontSize: width * 0.04,
// //                   ),
// //                 ),
// //                 Text(
// //                   amount,
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: width * 0.06,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 Text(
// //                   subtitle,
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: width * 0.035,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCard2({
// //     required IconData icon,
// //     required String title,
// //     required String amount,
// //     required Color color,
// //   }) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => ReferralEarningsScreen(),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * 0.44,
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(16),
// //           boxShadow: [
// //             BoxShadow(
// //               color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
// //               blurRadius: 10,
// //             ),
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               Row(
// //                 children: [
// //                   Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(12),
// //                         color: const Color.fromARGB(255, 251, 217, 255),
// //                       ),
// //                       child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Image.asset(
// //                             'assets/images/bonus (3).png',
// //                             height: 30,
// //                           ))),
// //                 ],
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   Text(
// //                     title,
// //                     style: GoogleFonts.poppins(
// //                       color: const Color.fromARGB(255, 0, 0, 0),
// //                       fontWeight: FontWeight.w600,
// //                       fontSize: 14,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   Text(
// //                     amount,
// //                     style: GoogleFonts.poppins(
// //                       fontWeight: FontWeight.w500,
// //                       color: color,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCountCard({
// //     required IconData icon,
// //     required String title,
// //     required String count,
// //   }) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => AllShopListScreen(),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * 0.44,
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(16),
// //           boxShadow: [
// //             BoxShadow(
// //               color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
// //               blurRadius: 10,
// //             ),
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               Row(
// //                 children: [
// //                   Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(12),
// //                         color: const Color.fromARGB(255, 251, 220, 255),
// //                       ),
// //                       child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Image.asset(
// //                             'assets/images/product-range (1).png',
// //                             height: 30,
// //                           ))),
// //                 ],
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   Text(
// //                     title,
// //                     style: GoogleFonts.poppins(
// //                       color: const Color.fromARGB(255, 0, 0, 0),
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               Row(
// //                 children: [
// //                   Text(
// //                     count,
// //                     style: GoogleFonts.poppins(
// //                       fontSize: 24,
// //                       color: Colors.black,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCountCard2({
// //     required IconData icon,
// //     required String title,
// //     required String count,
// //   }) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => StaffDetailsScreen1(),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * 0.44,
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(16),
// //           boxShadow: [
// //             BoxShadow(
// //               color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.05),
// //               blurRadius: 10,
// //             ),
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               Row(
// //                 children: [
// //                   Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(12),
// //                         color: const Color.fromARGB(255, 248, 197, 255),
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Icon(icon,
// //                             size: 30, color: Color.fromARGB(255, 117, 0, 106)),
// //                       )),
// //                 ],
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 children: [
// //                   Text(
// //                     title,
// //                     style: GoogleFonts.poppins(
// //                       color: const Color.fromARGB(255, 0, 0, 0),
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               Row(
// //                 children: [
// //                   Text(
// //                     count,
// //                     style: GoogleFonts.poppins(
// //                       fontSize: 24,
// //                       color: Colors.black,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class WaveBackgroundPainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     Paint paint = Paint()..style = PaintingStyle.fill;

// //     // Purple Wave
// //     paint.color = Colors.white.withOpacity(0.4);
// //     Path purpleWave = Path()
// //       ..moveTo(0, size.height * 0.6)
// //       ..quadraticBezierTo(
// //         size.width * 0.3,
// //         size.height * 0.5,
// //         size.width * 0.6,
// //         size.height * 0.7,
// //       )
// //       ..quadraticBezierTo(
// //         size.width * 0.9,
// //         size.height * 0.9,
// //         size.width,
// //         size.height * 0.7,
// //       )
// //       // Bottom right rounded corner
// //       ..lineTo(size.width, size.height - 20)
// //       ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
// //       // Bottom left rounded corner
// //       ..lineTo(20, size.height)
// //       ..quadraticBezierTo(0, size.height, 0, size.height - 20)
// //       ..close();
// //     canvas.drawPath(purpleWave, paint);

// //     // Orange Wave
// //     paint.color = Colors.white.withOpacity(0.2);
// //     Path orangeWave = Path()
// //       ..moveTo(0, size.height * 0.7)
// //       ..quadraticBezierTo(
// //         size.width * 0.4,
// //         size.height * 0.6,
// //         size.width * 0.7,
// //         size.height * 0.8,
// //       )
// //       ..quadraticBezierTo(
// //         size.width * 0.95,
// //         size.height,
// //         size.width,
// //         size.height * 0.85,
// //       )
// //       // Bottom right rounded corner
// //       ..lineTo(size.width, size.height - 20)
// //       ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
// //       // Bottom left rounded corner
// //       ..lineTo(20, size.height)
// //       ..quadraticBezierTo(0, size.height, 0, size.height - 20)
// //       ..close();
// //     canvas.drawPath(orangeWave, paint);
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// // }

// // class WaveBackgroundPainter1 extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     Paint paint = Paint()..style = PaintingStyle.fill;

// //     // Purple Wave
// //     paint.color = Colors.white.withOpacity(0.2);
// //     Path purpleWave = Path()
// //       ..moveTo(0, size.height * 0.6)
// //       ..quadraticBezierTo(
// //         size.width * 0.3,
// //         size.height * 0.5,
// //         size.width * 0.6,
// //         size.height * 0.7,
// //       )
// //       ..quadraticBezierTo(
// //         size.width * 0.9,
// //         size.height * 0.9,
// //         size.width,
// //         size.height * 0.7,
// //       )
// //       // Bottom right rounded corner
// //       ..lineTo(size.width, size.height - 20)
// //       ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
// //       // Bottom left rounded corner
// //       ..lineTo(20, size.height)
// //       ..quadraticBezierTo(0, size.height, 0, size.height - 20)
// //       ..close();
// //     canvas.drawPath(purpleWave, paint);

// //     // Orange Wave
// //     paint.color = Colors.white.withOpacity(0.2);
// //     Path orangeWave = Path()
// //       ..moveTo(0, size.height * 0.7)
// //       ..quadraticBezierTo(
// //         size.width * 0.4,
// //         size.height * 0.6,
// //         size.width * 0.7,
// //         size.height * 0.8,
// //       )
// //       ..quadraticBezierTo(
// //         size.width * 0.95,
// //         size.height,
// //         size.width,
// //         size.height * 0.85,
// //       )
// //       // Bottom right rounded corner
// //       ..lineTo(size.width, size.height - 20)
// //       ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
// //       // Bottom left rounded corner
// //       ..lineTo(20, size.height)
// //       ..quadraticBezierTo(0, size.height, 0, size.height - 20)
// //       ..close();
// //     canvas.drawPath(orangeWave, paint);
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// // }

// // class BannerImageCarousel extends StatefulWidget {
// //   final List<String> imagePaths;

// //   const BannerImageCarousel({Key? key, required this.imagePaths})
// //       : super(key: key);

// //   @override
// //   _BannerImageCarouselState createState() => _BannerImageCarouselState();
// // }

// // class _BannerImageCarouselState extends State<BannerImageCarousel> {
// //   late PageController _pageController;
// //   int _currentPage = 0;
// //   Timer? _timer;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _pageController = PageController(
// //       initialPage: 0,
// //       viewportFraction: 1.0,
// //     );
// //     _startAutoScroll();
// //   }

// //   @override
// //   void dispose() {
// //     _timer?.cancel();
// //     _pageController.dispose();
// //     super.dispose();
// //   }

// //   void _startAutoScroll() {
// //     _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
// //       if (_currentPage < widget.imagePaths.length - 1) {
// //         _currentPage++;
// //       } else {
// //         _currentPage = 0;
// //       }

// //       if (_pageController.hasClients) {
// //         _pageController.animateToPage(
// //           _currentPage,
// //           duration: const Duration(milliseconds: 500),
// //           curve: Curves.decelerate,
// //         );
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         SizedBox(
// //           height: 200,
// //           width: double.infinity,
// //           child: PageView.builder(
// //             controller: _pageController,
// //             onPageChanged: (int page) {
// //               setState(() {
// //                 _currentPage = page;
// //               });
// //             },
// //             itemCount: widget.imagePaths.length,
// //             itemBuilder: (context, index) {
// //               return Container(
// //                 decoration: BoxDecoration(),
// //                 child: ClipRRect(
// //                   child: Stack(
// //                     fit: StackFit.expand,
// //                     children: [
// //                       Image.asset(
// //                         widget.imagePaths[index],
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //         const SizedBox(height: 15),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: List.generate(
// //             widget.imagePaths.length,
// //             (index) => AnimatedContainer(
// //               duration: const Duration(milliseconds: 300),
// //               margin: const EdgeInsets.symmetric(horizontal: 4),
// //               width: _currentPage == index ? 25 : 8,
// //               height: 8,
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10),
// //                 color: _currentPage == index
// //                     ? Colors.purple
// //                     : Colors.grey.shade400,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
