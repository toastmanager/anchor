import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_corner/smooth_corner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Anchor',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xFF554AF0)).copyWith(
            primary: const Color(0xFF554AF0),
          ),
          textTheme: Theme.of(context)
              .textTheme
              .apply(fontSizeDelta: 2, fontFamily: 'Onest'),
          filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
                  shape: WidgetStatePropertyAll(SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(12),
                  )))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
                  shape: WidgetStatePropertyAll(SmoothRectangleBorder(
                      smoothness: 1, borderRadius: BorderRadius.circular(12))),
                  foregroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onSurface))),
        ),
        home: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                OutlinedButton(
                    onPressed: () {}, child: const Text('Зарегистрироваться')),
                FilledButton(onPressed: () {}, child: const Text('Войти')),
              ],
            ),
          )),
        ));
  }
}
