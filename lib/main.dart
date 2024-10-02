import 'package:cake_app/ui/screens/add/add_cake_screen.dart';
import 'package:cake_app/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CakeApp());
}

class CakeApp extends StatefulWidget {
  const CakeApp({super.key});

  @override
  State<CakeApp> createState() => _CakeAppState();
}

class _CakeAppState extends State<CakeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/add": (context) => const AddCakeScreen(),
      },
    );
  }
}
