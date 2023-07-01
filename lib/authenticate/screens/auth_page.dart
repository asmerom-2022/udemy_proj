import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../home/screen/home_page.dart';
import '../providers/auth_state_change_provider.dart';
import 'login_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authstateAsync = ref.watch(authStateProvider);
    return Scaffold(
      body: authstateAsync.when(
        data: (user) => user != null ? const HomePage() : const LoginPage(),
        error: (err, stack) => AlertDialog(
          content: Text(err.toString()),
        ),
        loading: () => const CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    );
  }
}
