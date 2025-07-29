import 'package:go_router/go_router.dart';
import 'package:zaera_app/app/notifications.dart';
import 'package:zaera_app/features/auth/login_screen.dart';
import 'package:zaera_app/features/auth/signup_screen.dart';
import 'package:zaera_app/features/group/create_group_screen.dart';
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
      path: '/creategroup',
      name: 'creategroup',
      builder: (context, state) => const CreateGroupScreen(),
    ),
  ],
);
