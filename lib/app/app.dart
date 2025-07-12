import 'package:flutter/material.dart';
import 'package:zaera_app/core/themes/app_theme.dart';

class ZaeraApp extends StatelessWidget {
  const ZaeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zaera',
        theme: AppTheme.theme,
        home: Scaffold(
          appBar: AppBar(title: const Text('Zaera Home')),
          body: Center(child: const Text('Welcome to Zaera!')),
        ),
      ),
    );
  }
}
