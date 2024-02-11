import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Анкер',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Color(0xFF554AF0),
          error: Color(0xffFF0000),
          onSurface: Color(0xFF04021D),
          onSurfaceVariant: Color(0xFF686777),
          outline: Color(0xFFE2E3E4),
          outlineVariant: Color(0xFFF8F8FA),
        ),
        fontFamily: 'Onest',
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            inherit: true,
          ),
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            inherit: true,
          ),
        )
      ),
      home: Builder(
        builder: (context) {
          return const Placeholder();
        },
      ),
    );
  }
}