import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaera_app/core/constant.dart';
import 'package:zaera_app/core/themes/colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnSession();
  }

  Future<void> _navigateBasedOnSession() async {
    if (kDebugMode) {
      print("Splash started...");
    }
    await Future.delayed(const Duration(seconds: 5));

    final session = Supabase.instance.client.auth.currentSession;

    if (kDebugMode) print("Recovered session: $session");

    if (session != null) {
      context.goNamed('home');
    } else {
      context.goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Lottie.asset(
                'lib/assets/animations/zaera_splash.json',
                repeat: false,
                width: width * 0.5,

                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(TextConstants.slogan, style: TextConstants.sloganStyle),
                  const SizedBox(height: 12),
                  Text("ZAERA", style: AppTextStyles.zaeraStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
