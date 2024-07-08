import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutine: Streamline Routines with Flutter',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
