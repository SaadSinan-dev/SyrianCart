import 'package:flutter/material.dart';
import 'package:syrian_cart/core/theme/color/app_colors.dart';
import 'package:syrian_cart/core/theme/style/app_text_styles.dart';
import 'package:syrian_cart/feature/details/presentation/widgets/add_to_cart.dart';
import 'package:syrian_cart/feature/details/presentation/widgets/details_body.dart';
import 'package:syrian_cart/feature/details/presentation/widgets/sliver_app_bar.dart';
import 'package:syrian_cart/feature/home/data/models/product_models.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isFavorite = false;
  int _quantity = 1;

  ProductModel get _product => widget.product;

  void _incrementQuantity() => setState(() => _quantity++);

  void _decrementQuantity() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  void _handleAddToCart() {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1200),
        backgroundColor: AppColors.black,
        content: Text(
          '$_quantity × ${_product.name} added to cart',
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          DetailsSliverAppBar(
            product: _product,
            isFavorite: _isFavorite,
            onFavoriteTap: () => setState(() => _isFavorite = !_isFavorite),
          ),
          SliverToBoxAdapter(
            child: DetailsBody(product: _product),
          ),
        ],
      ),
      bottomNavigationBar: AddToCartBar(
        price: _product.price,
        quantity: _quantity,
        onIncrement: _incrementQuantity,
        onDecrement: _decrementQuantity,
        onAddToCart: _handleAddToCart,
      ),
    );
  }
}
