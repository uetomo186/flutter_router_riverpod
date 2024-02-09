import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_router_riverpod/entities/user_role.dart';
import 'package:flutter_router_riverpod/state/auth_controller.dart';
part 'permissions.g.dart';

/// ユーザーがサインアウトしている場合、このプロバイダーは [UserRole.none] を返します。
/// それ以外の場合は、ネットワークリクエストを模擬し、[UserRole] を与えます。
@riverpod
Future<UserRole> permissions(PermissionsRef ref) async {
  final userId = await ref.watch(
    authControllerProvider.selectAsync(
      (value) => value.map(
        signedIn: (signedIn) => signedIn.id,
        signedOut: (signedOut) => null,
      ),
    ),
  );

  if (userId == null) return const UserRole.none();
  return _requestMock();
}

/// サイコロの出目に基づいてランダムな [UserRole] を与えます。
UserRole _requestMock() {
  final random = Random().nextDouble();

  if (random < 0.25) {
    return const UserRole.admin();
  } else if (random < 0.5) {
    return const UserRole.user();
  } else {
    return const UserRole.guest();
  }
}
