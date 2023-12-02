import 'package:flutter/material.dart';

import 'features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Bloc UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      home: const HomeScreen(),
    );
  }
}
