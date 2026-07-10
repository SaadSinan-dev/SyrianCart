import 'package:flutter/material.dart';
import 'package:syrian_cart/core/routing/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(fontFamily: 'Finlandica'),
    );
  }
}
