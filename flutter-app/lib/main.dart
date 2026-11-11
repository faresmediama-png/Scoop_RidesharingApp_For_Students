import 'package:flutter/material.dart';
import 'language_selection_page.dart'; // استيراد صفحة اختيار اللغة الصحيحة

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
      home: const LanguageSelectionPage(), // البدء من واجهة اختيار اللغة
    );
  }
}
