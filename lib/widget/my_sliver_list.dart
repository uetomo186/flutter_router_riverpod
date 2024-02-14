import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/router/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MySliverList extends StatelessWidget {
  const MySliverList({super.key, required this.elements, this.isNuke = false});
  final AsyncValue<List<(IconData, String)>> elements;
  final bool isNuke;

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
        children: elements.when(
      data: (data) {
        return [
          for (final (icon, title) in data)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              child: ListTile(
                onTap: () async {
                  final id = icon.hashCode + title.hashCode;
                  final willItExplode = await DetailsRoute(id, isNuke: isNuke)
                      .push<bool>(context);
                  if (willItExplode == null || !willItExplode) return;
                  if (!context.mounted) return;

                  final object = isNuke ? 'nuke' : 'cute rabbit';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You have destroyed the $object!'),
                    ),
                  );
                },
                tileColor: Color(_randomColorValue).withOpacity(0.05),
                leading: Icon(
                  icon,
                  color: Color(_randomColorValue).withOpacity(0.8),
                  size: 32,
                ),
                title: Text(title),
              ),
            ),
        ];
      },
      error: (error, stackTrace) => [
        const Text('何か問題が発生しました'),
        const SizedBox(height: 20),
        const Text('ホームではなく、ログイン画面に戻ってください'),
      ],
      loading: () => [
        const Center(child: CircularProgressIndicator()),
        const Text('データを取得中です...')
      ],
    ));
  }

  int get _randomColorValue => (math.Random().nextDouble() * 0xFFFFFF).toInt();
}
