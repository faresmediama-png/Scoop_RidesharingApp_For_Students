import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'search_route_modal.dart';
import 'ride_safety_page.dart'; // استيراد صفحة الأمان

class HomeMapPage extends StatefulWidget {
  const HomeMapPage({Key? key}) : super(key: key);

  @override
  State<HomeMapPage> createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
  int selectedCategoryIndex = 0;

  final List> categories = [
    {'title': 'Course', 'icon': Icons.directions_car_filled},
    {'title': 'Moto', 'icon': Icons.two_wheeler},
    {'title': 'Confort', 'icon': Icons.local_taxi},
    {'title': 'Course', 'icon': Icons.local_taxi},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الخريطة (Google Maps View)
          Container(
            color: AppColors.lightGrayBackground,
            child: const Center(
              child: Text(
                'Google Maps View',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
          ),

          // زر القائمة الجانبية في الأعلى (على اليسار)
          Positioned(
            top: 50,
            left: 16,
            child: CircleAvatar(
              backgroundColor: AppColors.whiteBackground,
              radius: 24,
              child: IconButton(
                icon: const Icon(Icons.menu, color: AppColors.primaryPurple),
                onPressed: () {
                  // إجراء القائمة الجانبية
                },
              ),
            ),
          ),

          // زر الأمان / الطوارئ (SOS) في الأعلى (على اليمين)
          Positioned(
            top: 50,
            right: 16,
            child: CircleAvatar(
              backgroundColor: AppColors.whiteBackground,
              radius: 24,
              child: IconButton(
                icon: const Icon(Icons.security, color: Colors.redAccent),
                onPressed: () {
                  // فتح نافذة الأمان والطوارئ عند الضغط عليها
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const RideSafetyPage(),
                  );
                },
              ),
            ),
          ),

          // البانل السفلي لاختيار الوجهة والخدمات
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // شريط الفئات (Course, Moto, Confort...)
                  SizedBox(
                    height: 75,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedCategoryIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.secondaryTeal.withOpacity(0.15)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                              border: isSelected
                                  ? Border.all(color: AppColors.secondaryTeal, width: 2)
                                  : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  categories[index]['icon'],
                                  color: isSelected
                                      ? AppColors.primaryPurple
                                      : Colors.grey[600],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  categories[index]['title'],
                                  style: TextStyle(
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? AppColors.primaryPurple : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // خانة البحث عن الوجهة (لبدء الرحلة)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const SearchRouteModal(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrayBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, size: 24, color: AppColors.primaryPurple),
                            SizedBox(width: 12),
                            Text(
                              'Où et pour combien ?',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // الأماكن الأخيرة (Recent Items)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildRecentItem('Hopital Ibn Sina', '7,8 km'),
                        _buildRecentItem('Av. de Suez', '29,2 km'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentItem(String title, String distance) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: AppColors.secondaryTeal),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(distance, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
