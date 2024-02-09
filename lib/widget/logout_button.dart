import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/state/auth_controller.dart';
import 'package:flutter_router_riverpod/widget/action_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionButton(
      onPressed: ref.read(authControllerProvider.notifier).logout,
      icon: const Icon(Icons.logout),
      label: const Text('ログアウト'),
    );
  }
}
