import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zaera_app/app/routes.dart';
import 'package:zaera_app/core/themes/app_theme.dart';

class ZaeraApp extends ConsumerWidget {
  const ZaeraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Zaera',
      theme: AppTheme.theme,
      routerConfig: appRoutes,
    );
  }
}
