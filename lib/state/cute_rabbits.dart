import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_router_riverpod/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cute_rabbits.g.dart';

@riverpod
FutureOr<List<(IconData, String)>> cuteRabbits(CuteRabbitsRef ref) async {
  await Future<void>.delayed(800.milliseconds);

  final result = [
    (Icons.cruelty_free, 'もふもふで可愛いうさぎさん。'),
    (Icons.cruelty_free_outlined, 'これはさらにふわふわしてるようですね！'),
    (Icons.cruelty_free_sharp, 'なぜ選ばなければならないのですか、全部欲しいのです!'),
    (Icons.cruelty_free_rounded, 'これはすべて腫れています 😍'),
    (Icons.pets, 'うーん...もっとペットも見られるかも...'),
    (Icons.flutter_dash, 'ああ、なんてことだ。\n私は欲しい。これ。'),
  ];

  ref.cacheFor(2.minutes);
  return result;
}
