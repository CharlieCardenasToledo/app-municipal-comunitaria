import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app/router.dart';
import 'src/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: CivicHorizonApp(),
    ),
  );
}

class CivicHorizonApp extends StatelessWidget {
  const CivicHorizonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zamora Conecta',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(),
      routerConfig: appRouter,
    );
  }
}
