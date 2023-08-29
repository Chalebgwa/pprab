import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pprab/views/desktop/contractor_registration/contractor_registration.dart';
import 'package:pprab/views/home.dart';
import 'package:provider/provider.dart';

import 'forms/contractor_form.dart';

final router = GoRouter(
  initialLocation: HomeScreen.routeName,
  routes: [
    GoRoute(
      path: ContractorRegistration.routeName,
      pageBuilder: (context, state) => MaterialPage(
        child: ChangeNotifierProvider(
          create: (_) => ContractorForm(),
          child: const ContractorRegistration(),
        ),
      ),
    ),
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
