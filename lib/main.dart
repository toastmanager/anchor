import 'package:anchor/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        theme: AppTheme.lightTheme(context),
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
