import 'package:flutter/material.dart';
import 'app_colors.dart';

class TrackRidePage extends StatelessWidget {
  const TrackRidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: Stack(
        children: [
          // خلفية تحاكي الخريطة (يمكن استبدالها بـ Google Maps لاحقاً)
          Positioned.fill(
            child: Container(
              color: AppColors.lightGrayBackground,
              child: Stack(
                children: [
                  // خط وهمي يمثل مسار الرحلة
                  Center(
                    child: Icon(
                      Icons.map_outlined,
                      size: 150,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  // مؤشر موقع السيارة على الخريطة
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_car_filled,
                          size: 45,
                          color: AppColors.primaryPurple,
                        ),
                        SizedBox(height: 35),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // زر العودة للأعلى
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.blackText),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // شريط علوي يوضح حالة الرحلة
          Positioned(
            top: 50,
            right: 20,
            left: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.radar, color: AppColors.secondaryTeal),
                  SizedBox(width: 10),
                  Text(
                    'السائق في طريقه إليك (الوصول خلال 4 دقائق)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // لوحة معلومات السائق والتحكم أسفل الشاشة
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // شريط سحب صغير
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // معلومات السيارة وسجل اللوحة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'داسيا لوگان - أبيض',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackText,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'أ - 6 - 12345',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryPurple,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrayBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),

                  // معلومات السائق
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.lightGrayBackground,
                        child: Icon(Icons.person, size: 35, color: AppColors.grayText),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'رشيد العلوي',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackText,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'سائق معتمد لدى vaigo',
                            style: TextStyle(fontSize: 12, color: AppColors.grayText),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // أزرار التواصل (اتصال ومراسلة)
                      IconButton(
                        onPressed: () {
                          // دالة الاتصال بالسائق
                        },
                        icon: const Icon(Icons.phone, color: AppColors.secondaryTeal),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.secondaryTeal.withOpacity(0.1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          // دالة الدردشة
                        },
                        icon: const Icon(Icons.chat, color: AppColors.primaryPurple),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // أزرار الأمان الإضافية (مشاركة الرحلة والطوارئ)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // مشاركة تفاصيل الرحلة مع العائلة
                          },
                          icon: const Icon(Icons.share, size: 18, color: AppColors.primaryPurple),
                          label: const Text(
                            'مشاركة الرحلة',
                            style: TextStyle(color: AppColors.primaryPurple),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.primaryPurple),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // زر الطوارئ
                          },
                          icon: const Icon(Icons.security, size: 18, color: Colors.white),
                          label: const Text(
                            'طوارئ SOS',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
