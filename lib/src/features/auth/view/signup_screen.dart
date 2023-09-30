import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/src/features/auth/view/signup_controller.dart';
import 'package:task_management_app/src/shared/utils/ui_helpers.dart';

import '../../../routes/routes.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  // ignore: prefer_final_fields
  bool _isObscure = true;
  bool _isConfirmObscure = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: _emailController,
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
                height: 16,
              ),
              TextFormField(
                obscureText: _isConfirmObscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isConfirmObscure = !_isConfirmObscure;
                        });
                      },
                      icon: Icon(_isConfirmObscure
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: state.isLoading ? null : _signUp,
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Sign Up'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () {
                    context.go(AppPaths.login);
                  },
                  child: const Text('Already have an account? Login')),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      ref.read(signUpControllerProvider.notifier).signUp(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text);
    }
  }
}
