import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/src/exceptions/auth_exception.dart';
import 'package:task_management_app/src/features/auth/model/user.dart';

class AuthRepository {
  Future<User> login(String username, String password) async {
    try {
      final user = await fb.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);

      return User(
        uid: user.user!.uid,
        email: user.user?.email ?? "",
        displayName: user.user?.displayName ?? "",
        photoUrl: user.user?.photoURL ?? "",
      );
    } on fb.FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email" || "wrong-password":
          throw AuthException("Invalid email or password.");

        case "user-disabled":
          throw AuthException(
              "The user corresponding to the given email has been disabled.");

        case "user-not-found":
          throw AuthException(
              "There is no user corresponding to the given email.");

        default:
          throw AuthException("An undefined Error happened.");
      }
    }
  }

  Future<User> signUp(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
      uid: '1234',
      email: "fake_email@123.com",
      displayName: "Fake Name",
      photoUrl: "https://picsum.photos/200/300",
    );
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

final authRepositoryProvider = Provider((ref) => AuthRepository());
