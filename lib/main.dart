import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pertemuan4/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solo Leveling Guild',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: const Color(0xFF050A18),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF1E90FF),
          secondary: const Color(0xFF00C6FF),
          surface: const Color(0xFF0D1B2A),
        ),
      ),
      home: const RegisterPage(),
    );
  }
}
