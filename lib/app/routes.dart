import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaera_app/app/notifications.dart';
import 'package:zaera_app/features/auth/login_screen.dart';
import 'package:zaera_app/features/auth/signup_screen.dart';
import 'package:zaera_app/features/expense/split_bill_screen.dart';
import 'package:zaera_app/features/home/home.dart';
import 'package:zaera_app/features/profile/user_profile.dart';
import 'package:zaera_app/features/splash/splash_screen.dart';

final GoRouter appRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      redirect: (context, state) {
        final session = Supabase.instance.client.auth.currentSession;
        if (session == null) return '/login';
        return null;
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const UserProfile(),
    ),
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      builder: (context, state) => const Notifications(),
    ),
    GoRoute(
      name: 'split_bill',
      path: '/split-bill',
      builder: (context, state) {
        final link = state.uri.queryParameters['link'];
        return SplitBillScreen(link: link);
      },
    ),
  ],
);
