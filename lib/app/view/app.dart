import 'package:flutter/material.dart';
import 'package:pprab/forms/contractor_form.dart';
import 'package:provider/provider.dart';
import 'package:pprab/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContractorForm(),
        )
      ],
      child: MaterialApp.router(
        title: 'PPRAB',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
