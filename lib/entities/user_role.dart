import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role.freezed.dart';

@freezed
class UserRole with _$UserRole {
  const factory UserRole.admin() = Admin;
  const factory UserRole.user() = User;
  const factory UserRole.guest() = Guest;
  const factory UserRole.none() = None;
}
