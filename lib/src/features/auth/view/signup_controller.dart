import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/provider/user_provider.dart';
import '../data/auth_repository.dart';

final signUpControllerProvider = AsyncNotifierProvider<SignUpController, void>(
  () => SignUpController(),
);

class SignUpController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  void signUp(
      {required String email,
      required String name,
      required String password}) async {
    try {
      state = const AsyncLoading();
      final authRepo = ref.read(authRepositoryProvider);
      final user = await authRepo.signUp("email", "password");
      ref.read(userProvider.notifier).state = user;
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
