import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/widget/logout_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go_router_Riverpod'),
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('ホーム画面です！'),
          LogoutButton(),
        ]),
      ),
    );
  }
}
