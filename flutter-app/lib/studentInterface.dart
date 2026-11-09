import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class StudentSelectPage extends StatefulWidget {
  StudentSelectPage({Key key}) : super(key: key);

  @override
  _StudentSelectPageState createState() => _StudentSelectPageState();
}

class _StudentSelectPageState extends State<StudentSelectPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  // البيانات الخاصة بالرحلة (بدون علامات null safety المتوافقة مع الإصدار القديم)
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
    final TimeOfDay picked = await showTimePicker(
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
    final DateTime picked = await showDatePicker(
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
        title: Text("السفر بين المدن - Covoiturage"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. مدينة الانطلاق
            Text(
              "مدينة الانطلاق:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on, color: Colors.green),
              ),
              value: _departureCity,
              onChanged: (String newValue) {
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

            SizedBox(height: 15),

            // 2. مدينة الوصول
            Text(
              "مدينة الوصول:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.flag, color: Colors.red),
              ),
              value: _destinationCity,
              onChanged: (String newValue) {
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

            SizedBox(height: 20),

            // 3. تاريخ السفر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تاريخ السفر: $_selectedDateText",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_today),
                  label: Text("اختر التاريخ"),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 4. توقيت الانطلاق
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "توقيت الانطلاق: $_selectedTimeText",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                ElevatedButton.icon(
                  onPressed: () => _selectTime(context),
                  icon: Icon(Icons.access_time),
                  label: Text("اختر الوقت"),
                ),
              ],
            ),

            SizedBox(height: 15),

            // 5. نوع السيارة
            Text(
              "نوع السيارة:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.directions_car, color: Colors.blue),
              ),
              value: _carType,
              onChanged: (String newValue) {
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

            SizedBox(height: 15),

            // 6. مدة الوصول التقديرية
            TextFormField(
              decoration: InputDecoration(
                labelText: "مدة الوصول التقديرية (مثال: 3 ساعات)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timer),
              ),
            ),

            SizedBox(height: 20),

            // 7. السعر المقترح للراكب (بالدرهم المغربي DH)
            Text(
              "السعر المقترح: ${_price.toInt()} DH",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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

            SizedBox(height: 20),

            // زر التأكيد/البحث
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // تم استخدام primary بدل backgroundColor لتوافق الإصدار القديم
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("تم تسجيل معلومات الرحلة بنجاح")),
                  );
                },
                child: Text(
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
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('الرئيسية'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('الرحلات'),
            activeColor: Colors.purpleAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('حسابي'),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
