import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    if (kDebugMode) {
      print("⚠️ Failed to load .env file: $e");
    }
  }

  //supabase setup

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseKey = dotenv.env['SUPABASE_ANON_KEY'];

  if (supabaseUrl == null || supabaseKey == null) {
    throw Exception('SUPABASE_URL or SUPABASE_ANON_KEY not found in .env');
  }

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ProviderScope(child: const ZaeraApp()));
}
