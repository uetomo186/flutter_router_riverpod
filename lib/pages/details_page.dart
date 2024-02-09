import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage(this.detailsCode, {required this.isNuclearCode, super.key});
  final int detailsCode;
  final bool isNuclearCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = isNuclearCode ? '炎上しちゃうよ〜！' : '助けないと危ないよ〜！';

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 60),
          Text('$detailsCode'),
          const SizedBox(height: 60),
          ElevatedButton.icon(
            onPressed: () => context.pop(true),
            icon: const Icon(Icons.explicit),
            label: const Text('作っちゃうもんね〜！'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => context.pop(true),
            icon: const Icon(Icons.explicit),
            label: const Text('家に持ち帰り、手入れをする'),
          ),
        ]),
      ),
    ));
  }
}
