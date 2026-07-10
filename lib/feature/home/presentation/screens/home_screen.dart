import 'package:flutter/material.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/body/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}
