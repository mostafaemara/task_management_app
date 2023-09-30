import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/model/user.dart';

final userProvider = StateProvider<User?>((ref) => null);
