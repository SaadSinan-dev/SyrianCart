import 'package:flutter/material.dart';
import 'package:syrian_cart/feature/auth/presentation/screens/login/login_screen.dart';
import 'package:syrian_cart/feature/auth/presentation/screens/signup/signup_screen.dart';
import 'package:syrian_cart/feature/checkout/presentation/screens/checkout_screen.dart';
import 'package:syrian_cart/feature/details/presentation/screens/details_screen.dart';
import 'package:syrian_cart/feature/home/data/models/product_models.dart';
import 'package:syrian_cart/feature/home/presentation/screens/home_screen.dart';
import 'package:syrian_cart/feature/layout/presentation/screens/layout_screen.dart';
import 'package:syrian_cart/feature/splash/presentation/screens/first_splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String layout = '/layout';
  static const String details = '/details';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String checkout = '/checkout';
}

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _buildRoute(
          settings: settings,
          page: const SplashScreen(),
        );
      case AppRoutes.login:
        return _buildRoute(
          settings: settings,
          page: const LoginScreen(),
        );
      case AppRoutes.signup:
        return _buildRoute(
          settings: settings,
          page: const SignupScreen(),
        );
      case AppRoutes.layout:
        return _buildRoute(
          settings: settings,
          page: const LayoutScreen(),
        );
      case AppRoutes.home:
        return _buildRoute(
          settings: settings,
          page: const HomeScreen(),
        );

      case AppRoutes.details:
        final args = settings.arguments;
        if (args is! ProductModel) {
          return _errorRoute(
            routeName: settings.name,
            message: 'AppRoutes.details expects a ProductModel argument, '
                'got ${args.runtimeType} instead.',
          );
        }
        return _buildRoute(
          settings: settings,
          page: DetailsScreen(product: args),
        );

      case AppRoutes.checkout:
        return _buildRoute(
          settings: settings,
          page: const CheckoutScreen(),
        );

      default:
        return _errorRoute(
          routeName: settings.name,
          message: 'No route defined for "${settings.name}".',
        );
    }
  }

  static Route<dynamic> _buildRoute({
    required RouteSettings settings,
    required Widget page,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.03),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  static Route<dynamic> _errorRoute({
    required String? routeName,
    required String message,
  }) {
    assert(() {
      debugPrint('Navigation error on "$routeName": $message');
      return true;
    }());

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Page not found')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
