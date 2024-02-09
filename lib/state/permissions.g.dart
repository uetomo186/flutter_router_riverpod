// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionsHash() => r'1c57b7276ec9954f9d77dd22b46053f2fee7b298';

/// ユーザーがサインアウトしている場合、このプロバイダーは [UserRole.none] を返します。
/// それ以外の場合は、ネットワークリクエストを模擬し、[UserRole] を与えます。
///
/// Copied from [permissions].
@ProviderFor(permissions)
final permissionsProvider = AutoDisposeFutureProvider<UserRole>.internal(
  permissions,
  name: r'permissionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$permissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PermissionsRef = AutoDisposeFutureProviderRef<UserRole>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
