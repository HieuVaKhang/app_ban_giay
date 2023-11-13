import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'libraries/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(UncontrolledProviderScope(
    container: ProviderContainer(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: initRouter,
      routes: danhsachRoute,
    );
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
