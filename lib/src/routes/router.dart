import 'package:go_router/go_router.dart';
import 'package:task_management_app/src/routes/routes.dart';
import 'package:task_management_app/src/features/home/home_screen.dart';
import 'package:task_management_app/src/features/splash/splash_screen.dart';

import '../features/auth/view/login_screen.dart';
import '../features/auth/view/signup_screen.dart';

final router = GoRouter(
    initialLocation: AppPaths.login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppPaths.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPaths.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppPaths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPaths.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
    ]);
