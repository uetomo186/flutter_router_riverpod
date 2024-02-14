import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/state/cute_rabbits.dart';
import 'package:flutter_router_riverpod/widget/logout_button.dart';
import 'package:flutter_router_riverpod/widget/my_sliver_list.dart';
import 'package:flutter_router_riverpod/widget/user_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rabbits = ref.watch(cuteRabbitsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('ユーザーページ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "ウサギを拾うのに十分な権限を持っているようです！",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: UserTitle()),
                      MySliverList(elements: rabbits),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
