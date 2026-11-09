import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class StudentSelectPage extends StatefulWidget {
  const StudentSelectPage({Key? key}) : super(key: key);

  @override
  State<StudentSelectPage> createState() => _StudentSelectPageState();
}

class _StudentSelectPageState extends State<StudentSelectPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  // البيانات الخاصة بالرحلة
  String _departureCity = 'الدار البيضاء (Casablanca)';
  String _destinationCity = 'الرباط (Rabat)';
  String _selectedDateText = 'اختر التاريخ';
  String _selectedTimeText = 'اختر الوقت';
  String _carType = 'Dacia Logan';
  double _price = 50;

  // قائمة بأهم المدن المغربية
  final List<String> _moroccanCities = [
    'الدار البيضاء (Casablanca)',
    'الرباط (Rabat)',
    'طنجة (Tanger)',
    'مراكش (Marrakech)',
    'فاس (Fès)',
    'أكادير (Agadir)',
    'مكناس (Meknès)',
    'وجدة (Oujda)',
    'تطوان (Tétouan)',
    'القنيطرة (Kénitra)',
    'الجديدة (El Jadida)',
    'آسفي (Safi)',
    'بني ملال (Béni Mellal)',
    'خريبكة (Khouribga)',
    'الناظور (Nador)',
    'العيون (Laâyoune)',
  ];

  // قائمة بأشكال/أنواع السيارات المتداولة
  final List<String> _carTypesList = [
    'Dacia Logan',
    'Dacia Sandero',
    'Peugeot 208',
    'Renault Clio',
    'Volkswagen Golf',
    'Hyundai Accent',
    'سيارة مريحة (Comfort)',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // دالة لاختيار التوقيت
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTimeText = picked.format(context);
      });
    }
  }

  // دالة لاختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null) {
      setState(() {
        _selectedDateText = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("السفر بين المدن - Covoiturage"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. مدينة الانطلاق
            const Text(
              "مدينة الانطلاق:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on, color: Colors.green),
              ),
              value: _departureCity,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _departureCity = newValue;
                  });
                }
              },
              items: _moroccanCities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),

            const SizedBox(height: 15),

            // 2. مدينة الوصول
            const Text(
              "مدينة الوصول:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.flag, color: Colors.red),
              ),
              value: _destinationCity,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _destinationCity = newValue;
                  });
                }
              },
              items: _moroccanCities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // 3. تاريخ السفر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تاريخ السفر: $_selectedDateText",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("اختر التاريخ"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 4. توقيت الانطلاق
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "توقيت الانطلاق: $_selectedTimeText",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                ElevatedButton.icon(
                  onPressed: () => _selectTime(context),
                  icon: const Icon(Icons.access_time),
                  label: const Text("اختر الوقت"),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // 5. نوع السيارة
            const Text(
              "نوع السيارة:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.directions_car, color: Colors.blue),
              ),
              value: _carType,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _carType = newValue;
                  });
                }
              },
              items: _carTypesList.map((String car) {
                return DropdownMenuItem<String>(
                  value: car,
                  child: Text(car),
                );
              }).toList(),
            ),

            const SizedBox(height: 15),

            // 6. مدة الوصول التقديرية
            TextFormField(
              decoration: const InputDecoration(
                labelText: "مدة الوصول التقديرية (مثال: 3 ساعات)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timer),
              ),
            ),

            const SizedBox(height: 20),

            // 7. السعر المقترح للراكب (بالدرهم المغربي DH)
            Text(
              "السعر المقترح: ${_price.toInt()} DH",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Slider(
              value: _price,
              min: 20,
              max: 500,
              divisions: 48,
              label: "${_price.toInt()} DH",
              onChanged: (double value) {
                setState(() {
                  _price = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // زر التأكيد/البحث
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم تسجيل معلومات الرحلة بنجاح")),
                  );
                },
                child: const Text(
                  "بحث / نشر الرحلة",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('الرئيسية'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.search),
            title: const Text('الرحلات'),
            activeColor: Colors.purpleAccent,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text('حسابي'),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
