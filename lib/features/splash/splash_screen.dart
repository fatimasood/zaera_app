import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:zaera_app/app/routes.dart';
import 'package:zaera_app/core/themes/colors.dart';

// Fake providers for now
final isFirstTimeUserProvider = Provider<bool>((ref) => false);
final isLoggedInProvider = Provider<bool>((ref) => true);

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    print("Splash started...");
    await Future.delayed(const Duration(seconds: 3)); // 3s delay

    final isFirstTime = ref.read(isFirstTimeUserProvider);
    final isLoggedIn = ref.read(isLoggedInProvider);

    print("isFirstTime: $isFirstTime | isLoggedIn: $isLoggedIn");

    if (isFirstTime) {
      context.goNamed('signup');
    } else if (isLoggedIn) {
      context.goNamed('home');
    } else {
      context.goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            'lib/assets/animations/zaera_splash.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
