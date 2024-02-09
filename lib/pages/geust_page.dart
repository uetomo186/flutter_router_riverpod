import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/widget/logout_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuestPage extends ConsumerWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ゲストページ', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("大したことはできないよ。"),
            SizedBox(height: 8),
            Text("あなたはゲストですよ！"),
            SizedBox(height: 40),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
