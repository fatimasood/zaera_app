import 'package:flutter/material.dart';
import 'package:zaera_app/common/themes/app_theme.dart';
import 'package:zaera_app/features/home/home.dart';

String? userMail;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ZaeraApp());
}

class ZaeraApp extends StatelessWidget {
  const ZaeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zaera',
      theme: AppTheme.theme,
      home: HomeScreen(),
    );
  }
}
