import 'package:flutter/material.dart';
import 'splash_screen_one.dart'; // استيراد الشاشة الأولى

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vaigo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LanguageSelectionPage(), // جعل التطبيق يبدأ من الشاشة التمهيدية
    );
  }
}
