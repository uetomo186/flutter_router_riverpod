import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/state/cute_rabbits.dart';
import 'package:flutter_router_riverpod/state/nuclear_codes.dart';
import 'package:flutter_router_riverpod/widget/logout_button.dart';
import 'package:flutter_router_riverpod/widget/my_sliver_list.dart';
import 'package:flutter_router_riverpod/widget/user_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codes = ref.watch(nuclearCodesProvider);
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
                  child: Text('Admin Page',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Woah, just look at the stuff you could do in here.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: _AdminTitle()),
                      MySliverList(elements: codes, isNuke: true),
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

class _AdminTitle extends StatelessWidget {
  const _AdminTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        'こちらの使用するのです！',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
