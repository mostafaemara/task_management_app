import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/src/routes/index.dart';

import 'login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // ignore: prefer_final_fields
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  const Text(
                    'Logo',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: _isObscure,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  FilledButton(
                    onPressed: () {
                      ref.read(loginControllerProvider.notifier).login();
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot Password?')),
                  const Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        context.go(AppPaths.signUp);
                      },
                      child: const Text('Sign Up')),
                ],
              ),
            ),
    ));
  }
}
