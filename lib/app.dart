import 'package:anchor/screens/main_wrapper.dart';
import 'package:anchor/screens/welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _auth = FirebaseAuth.instance;

  User? user;

  @override
  void initState() {
    _auth.authStateChanges().listen((newUserState) {
      user = newUserState;
    });
    super.initState();
  }

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
          if (_auth.currentUser != null) {
            return const MainWrapper();
          } else {
            return const WelcomePage();
          }
        },
      ),
    );
  }
}