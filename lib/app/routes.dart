import 'package:go_router/go_router.dart';
import 'package:zaera_app/features/splash/splash_screen.dart';

final GoRouter appRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
