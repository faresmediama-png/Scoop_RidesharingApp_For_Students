import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'home_map_page.dart';

class FaceVerificationPage extends StatelessWidget {
  const FaceVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'التحقق من الهوية والأمان',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'لضمان سلامتك وسلامة السائق، يرجى التأكد من أن وجهك يطابق الحساب الشخصي.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grayText,
                ),
              ),
              const Spacer(),

              // إطار دائري محاكي لعملية مسح الوجه
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondaryTeal,
                    width: 4,
                  ),
                  color: AppColors.lightGrayBackground,
                ),
                child: const Center(
                  child: Icon(
                    Icons.face,
                    size: 100,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ضع وجهك داخل الإطار وأومئ برأسك',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),

              const Spacer(),

              // زر بدء التحقق
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // بعد نجاح التحقق، ينتقل المستخدم مباشرة للخريطة الرئيسية
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeMapPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'بدء التحقق',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
