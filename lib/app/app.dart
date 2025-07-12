import 'package:flutter/material.dart';
import 'package:zaera_app/app/routes.dart';

import 'package:zaera_app/core/themes/app_theme.dart';

class ZaeraApp extends StatelessWidget {
  const ZaeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Zaera',
      theme: AppTheme.theme,
      routerConfig: appRoutes,
    );
  }
}
