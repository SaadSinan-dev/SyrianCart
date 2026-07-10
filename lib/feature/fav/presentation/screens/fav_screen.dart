import 'package:flutter/material.dart';
import 'package:syrian_cart/core/theme/color/app_colors.dart';
import 'package:syrian_cart/core/theme/style/app_text_styles.dart';
import 'package:syrian_cart/feature/home/data/models/product_models.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/product/product_card.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key, this.favoriteProducts = const []});

  final List<ProductModel> favoriteProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Favorites', style: AppTextStyles.displaySmall),
        centerTitle: true,
      ),
      body: favoriteProducts.isEmpty
          ? const _EmptyState(
              icon: Icons.favorite_border,
              message: 'No favorites yet',
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: favoriteProducts[index]);
              },
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.white, size: 30),
          ),
          const SizedBox(height: 16),
          Text(message, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
