import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';

final loginControllerProvider = AsyncNotifierProvider<LoginController, void>(
  () => LoginController(),
);

class LoginController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  void login() async {
    try {
      state = const AsyncLoading();
      final authRepo = ref.read(authRepositoryProvider);
      final user = await authRepo.login("email", "password");
      ref.read(userProvider.notifier).state = user;
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
