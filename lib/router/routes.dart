import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_router_riverpod/pages/home_page.dart';
import 'package:flutter_router_riverpod/pages/splash_page.dart';
import 'package:flutter_router_riverpod/state/permissions.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<AdminRoute>(path: 'admin'),
    TypedGoRoute<UserRoute>(path: 'user'),
    TypedGoRoute<GuestRoute>(path: 'guest'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  FutureOr<String> redirect(BuildContext context, GoRouterState state) async {
    final userRole = await ProviderScope.containerOf(context).read(
      permissionsProvider.future,
    );

    return userRole.map(
      admin: (_) => const AdminRoute().location,
      user: (_) => const UserRoute().location,
      guest: (_) => const GuestRoute().location,
      none: (_) => null,
    );
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}
