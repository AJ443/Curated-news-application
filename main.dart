import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const NewsFlashApp());
}

class NewsFlashApp extends StatelessWidget {
  const NewsFlashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFlash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
