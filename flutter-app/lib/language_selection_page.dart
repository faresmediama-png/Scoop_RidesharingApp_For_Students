import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_localizations.dart';
import 'splash_screen_one.dart'; // الانتقال للشاشة التمهيدية من بعد اختيار اللغة

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  // دالة لتغيير اللغة والانتقال لتطبيق vaigo
  void _selectLanguage(BuildContext context, String langCode) {
    // يمكنك حفظ لغة المستخدم هنا باستخدام SharedPreferences إذا أردت لاحقاً
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const SplashScreenOne(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // شعار التطبيق
              const Text(
                'vaigo',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryPurple,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose your language\nاختر لغتك المفضلة\nختار اللغة باش تخدم',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 40),

              // خيارات اللغات
              Expanded(
                child: ListView(
                  children: [
                    _buildLanguageCard(
                      context,
                      title: 'الدارجة المغربية',
                      subtitle: 'Darija (Maroc)',
                      langCode: 'ary',
                    ),
                    const SizedBox(height: 12),
                    _buildLanguageCard(
                      context,
                      title: 'العربية',
                      subtitle: 'Arabic',
                      langCode: 'ar',
                    ),
                    const SizedBox(height: 12),
                    _buildLanguageCard(
                      context,
                      title: 'Français',
                      subtitle: 'French',
                      langCode: 'fr',
                    ),
                    const SizedBox(height: 12),
                    _buildLanguageCard(
                      context,
                      title: 'English',
                      subtitle: 'English',
                      langCode: 'en',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String langCode,
  }) {
    return InkWell(
      onTap: () => _selectLanguage(context, langCode),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.lightGrayBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.transparent, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.grayText,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.primaryPurple,
            ),
          ],
        ),
      ),
    );
  }
}
