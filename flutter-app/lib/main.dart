import 'package:flutter/material.dart';
import 'welcome_page.dart'; // استدعاء صفحة البداية Vaigo

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
      home: WelcomePage(), // هنا فين كيبدأ التطبيق
    );
  }
}
