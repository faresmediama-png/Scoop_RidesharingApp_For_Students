import 'package:flutter/material.dart';
import 'welcome_page.dart'; // استيراد صفحة البداية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaigo Covoiturage',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const WelcomePage(), // صفحة البداية للتطبيق
    );
  }
}
