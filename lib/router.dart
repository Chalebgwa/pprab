import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:pprab/views/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      pageBuilder: (context, state) => const MaterialPage(
        child: HomeScreen(),
      ),
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
