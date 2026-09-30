import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const NovaApp());
}

class NovaApp extends StatelessWidget {
  const NovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF20252B);
    return MaterialApp(
      title: 'Nova',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F4),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF367D73),
          surface: const Color(0xFFF7F7F4),
          primary: const Color(0xFF367D73),
          onSurface: ink,
        ),
        fontFamily: 'Avenir Next',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: ink, fontWeight: FontWeight.w700, letterSpacing: -1.2),
          titleLarge: TextStyle(color: ink, fontWeight: FontWeight.w700, letterSpacing: -0.4),
          titleMedium: TextStyle(color: ink, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: ink),
          bodyMedium: TextStyle(color: Color(0xFF777D82)),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
