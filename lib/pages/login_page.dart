import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/state/auth_controller.dart';
import 'package:flutter_router_riverpod/widget/action_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> login() => ref.read(authControllerProvider.notifier).login(
          'myEmail',
          'myPassword',
        );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ログインページ'),
            ActionButton(
                onPressed: login,
                label: const Text('ログイン'),
                icon: const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
