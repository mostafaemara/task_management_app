import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/src/repositories/auth_repository.dart';

import 'routes/index.dart';

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthConsumer(
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Khallasna',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            border: OutlineInputBorder(),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

class AuthConsumer extends ConsumerWidget {
  final Widget child;

  const AuthConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userProvider);

    if (user != null) {
      Future.microtask(() => router.go(AppPaths.home));
    } else {
      Future.microtask(() => router.go(AppPaths.login));
    }

    return child;
  }
}
