import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      body: SafeArea(
   
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children[]),
        ),
      )),
    );
  }
}
