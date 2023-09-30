import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/data/auth_repository.dart';
import '../../routes/index.dart';
import '../provider/user_provider.dart';

class AppConsumer extends ConsumerWidget {
  final Widget child;

  const AppConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userProvider);

    if (user != null) {
      router.go(AppPaths.home);
    } else {
      router.go(AppPaths.login);
    }

    return child;
  }
}
