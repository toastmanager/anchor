import 'package:anchor/core/constants/constants.dart';
import 'package:anchor/core/routes/router.dart';
import 'package:anchor/core/theme/app_theme.dart';
import 'package:anchor/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: Const.apiUrl,
    anonKey: Const.anonKey,
  );

  configureDependencies();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Anchor',
        theme: AppTheme.lightTheme(context),
        routerConfig: _appRouter.config());
  }
}
