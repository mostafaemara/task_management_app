import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/src/models/user.dart';

class AuthRepository {
  Future<User> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
      uid: '1234',
      email: "fake_email@123.com",
      displayName: "Fake Name",
      photoUrl: "https://picsum.photos/200/300",
    );
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
final userProvider = StateProvider<User?>((ref) => null);
