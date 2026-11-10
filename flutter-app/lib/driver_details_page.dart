import 'package:flutter/material.dart';
import 'app_colors.dart';

class DriverDetailsPage extends StatelessWidget {
  const DriverDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الخريطة
          Container(color: AppColors.lightGrayBackground),

          // شريط الحالة العلوي
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1)
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.verified_user, color: AppColors.secondaryTeal, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Le conducteur voit votre emplacement...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          // النافذة السفلية لتفاصيل السائق والسيارة
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Le conducteur arrive dans ~1 min',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.security, color: AppColors.primaryPurple),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // معلومات السيارة ورقم اللوحة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Noir Peugeot 208',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrayBackground,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '71638-1-b',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.directions_car, size: 48, color: AppColors.primaryPurple),
                    ],
                  ),
                  const Divider(height: 24),

                  // معلومات السائق وأزرار الاتصال
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.lightGrayBackground,
                        child: Icon(Icons.person, color: AppColors.primaryPurple, size: 30),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Thami',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text('5', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      // زر الاتصال
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.secondaryTeal,
                        child: IconButton(
                          icon: const Icon(Icons.phone, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // حقل الملاحظات للسائق
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrayBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Vous avez des remarques pour le conducteur ?',
                          style: TextStyle(color: AppColors.grayText, fontSize: 13),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grayText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
