import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'auth_page.dart';
import 'language_selection_page.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // أنيميشن هبوط الشعار من الأعلى إلى الوسط
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    // أنيميشن "رقصة" الشعار الخفيفة في الوسط
    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.15), weight: 30),
      TweenSequenceItem(tween: Tween<double>(begin: 1.15, end: 0.95), weight: 30),
      TweenSequenceItem(tween: Tween<double>(begin: 0.95, end: 1.05), weight: 20),
      TweenSequenceItem(tween: Tween<double>(begin: 1.05, end: 1.0), weight: 20),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToAuth() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // الشعار في الوسط مع الحركة (Animation)
            Center(
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _bounceAnimation,
                  child: GestureDetector(
                    onTap: _navigateToAuth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'vaigo',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryPurple,
                            letterSpacing: -1.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'اضغط للمتابعة',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grayText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // أيكونة اختيار اللغة في الأسفل
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    // فتح صفحة اختيار اللغة
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LanguageSelectionPage(),
                      ),
                    );
                    // بعد اختيار اللغة ينتقل مباشرة للتسجيل
                    _navigateToAuth();
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrayBackground,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.primaryPurple.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.language,
                          color: AppColors.primaryPurple,
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'اختر اللغة / Langue',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
