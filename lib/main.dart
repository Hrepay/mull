import 'package:flutter/material.dart';
import 'screens/drink_tracker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MULL',
      theme: ThemeData(
        fontFamily: '이서윤체',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const DrinkTrackerScreen(),
    );
  }
}
