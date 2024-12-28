import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../colors/colors.dart';

class CoinParticle {
  Offset position;
  final double size;
  final double speed;
  final double rotationSpeed;
  final double delay;
  final double horizontalSpread;

  CoinParticle({
    required this.position,
    required this.size,
    required this.speed,
    required this.rotationSpeed,
    required this.delay,
    required this.horizontalSpread,
  });
}

class TopToBottomCoinsAnimation extends StatefulWidget {
  final String logoPath =
      'assets/images/slpash.png';
  final Function(BuildContext) onAnimationComplete;

  const TopToBottomCoinsAnimation({
    Key? key,
    required this.onAnimationComplete,
    required Color primaryColor,
    required String logoPath,
  }) : super(key: key);

  @override
  _TopToBottomCoinsAnimationState createState() =>
      _TopToBottomCoinsAnimationState();
}

class _TopToBottomCoinsAnimationState extends State<TopToBottomCoinsAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final List<CoinParticle> coins = [];
  final Color goldColor = const Color(0xFFFFD700);

  @override
  void initState() {
    super.initState();
    _generateCoins();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2), // Slower animation
      vsync: this,
    );

    _animationController.forward().then((_) {
      widget.onAnimationComplete(context);
    });
  }

  void _generateCoins() {
    final random = math.Random();

    // Generate more coins for a fuller effect
    for (int i = 0; i < 40; i++) {
      coins.add(
        CoinParticle(
          position: const Offset(0, -50), // Start above screen
          size: random.nextDouble() * 20 + 15, // Varied sizes
          speed:
              random.nextDouble() * 0.6 + 0.4, // Slower speed for gentle fall
          rotationSpeed: random.nextDouble() * 1.5 + 0.5,
          delay: random.nextDouble() * 0.8, // More varied delays
          horizontalSpread:
              random.nextDouble() * 300 - 150, // Spread across screen width
        ),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final centerX = screenSize.width / 2;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                    gradient: AppColors.blackGradient,

        ),
         // Set purple background color
        child: Stack(
          alignment: Alignment.center, // Center-align the stack contents
          children: [
            // Centered Background Image (Optional: Remove if not needed)
            Positioned(
              top: 280,
              left: 120,
              child: Image.asset(
                'assets/images/WhatsApp_Image_2024-12-03_at_4.36.43_AM-removebg-preview.png',
                height: 120, // Replace with your background image path
                fit: BoxFit.contain, // Keep image contained within the screen
              ),
            ),
            Positioned(
                top: 400,
                left: 130,
                child: Image.asset(
                  'assets/images/WhatsApp_Image_2024-12-02_at_2.06.40_AM-removebg-preview.png',
                  height: 60,
                )),
            // Coins Animation
            ...coins.map((coin) {
              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  double progress =
                      math.max(0, _animationController.value - coin.delay);
                  if (progress > 1.0) progress = 1.0;

                  // Vertical movement with easing
                  final verticalDistance = progress * screenSize.height * 1.2;

                  // Gentle horizontal sway
                  final horizontalWave = math.sin(progress * 3 * math.pi) * 15;

                  return Positioned(
                    left: centerX +
                        coin.horizontalSpread +
                        horizontalWave -
                        coin.size / 2,
                    top: verticalDistance - coin.size / 2,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..rotateY(progress * coin.rotationSpeed * 2 * math.pi),
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: (1.0 - (progress * 0.3)).clamp(0.0, 1.0),
                        child: Image.asset(
                          widget.logoPath,
                          width: coin.size,
                          height: coin.size,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
