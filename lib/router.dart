import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pprab/views/dashboard/dashboard.dart';
import 'package:pprab/views/auth/contractor_registration.dart';
import 'package:pprab/views/home.dart';

final router = GoRouter(
  initialLocation: HomeScreen.routeName,
  routes: [
    GoRoute(
      path: ContractorRegistration.routeName,
      builder: (context, state) {
        return const ContractorRegistration();
      },
    ),
    GoRoute(
      path: Dashboard.routeName,
      builder: (context, state) {
        return const Dashboard();
      },
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  ),
);
