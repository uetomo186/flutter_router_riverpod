import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_router_riverpod/utils/cache_for.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nuclear_codes.g.dart';

@riverpod
FutureOr<List<(IconData, String)>> nuclearCodes(NuclearCodesRef ref) async {
  await Future<void>.delayed(800.milliseconds);

  final result = [
    (Icons.one_k, 'これは全く安全そうだ。クリックして核のコードを見よう！'),
    (Icons.two_k, 'これは全く安全そうだ。クリックして核のコードを見よう！'),
    (Icons.three_k, 'これは全く安全そうだ。クリックして核のコードを見よう！'),
    (Icons.four_k, 'ええと...私たちは*実際に*これらのコードを見たいですか？'),
    (Icons.five_k, 'ええと...私たちは*実際に*これらのコードを見たいですか？'),
    (Icons.six_k, 'ええと...私たちは*実際に*これらのコードを見たいですか？'),
    (Icons.seven_k, 'ええと...私たちは*実際に*これらのコードを見たいですか？'),
    (Icons.eight_k, 'これはとても熱すぎて手に負えません。'),
    (Icons.nine_k, 'これはとても熱すぎて手に負えません。'),
    (Icons.ten_k, 'これはとても熱すぎて手に負えません。'),
  ];

  ref.cacheFor(
      10.seconds); // Nukes are dangerous - I guess - so let's cache less time
  return result;
}
