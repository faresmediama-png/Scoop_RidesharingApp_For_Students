import 'package:flutter/material.dart';

class HomeMapPage extends StatelessWidget {
  const HomeMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. الخريطة في الخلفية (يمكن ربطها مستقبلاً بـ Google Maps)
          Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'الخريطة التفاعلية Vaigo',
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
          ),

          // زر القائمة العلوية (Drawer/Menu)
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),

          // 2. اللوحة السفلية البيضاء (Bottom Sheet)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // شريط السحب الصغير
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // أنواع وسائل النقل (Course, Moto, Confort)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildOption(Icons.directions_car, 'Course', true),
                      _buildOption(Icons.two_wheeler, 'Moto', false),
                      _buildOption(Icons.no_drinks, 'Confort', false),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // خانة البحث "Où et pour combien ?"
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.black54),
                        SizedBox(width: 10),
                        Text(
                          'Où et pour combien ?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // الوجهات السابقة المقترحة
                  _buildLocationRow('Hopital Ibn Sina', '7,8 km'),
                  const Divider(),
                  _buildLocationRow('Av. de Suez', '29,2 km'),
                  const Divider(),
                  _buildLocationRow('Rue Souika, Médina de Rabat', '3,3 km'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, String label, bool isSelected) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[50] : Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black87,
            size: 28,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow(String title, String distance) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            distance,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
