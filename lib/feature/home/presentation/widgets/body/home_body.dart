import 'package:flutter/material.dart';
import 'package:syrian_cart/feature/home/data/data_source/category_data.dart';
import 'package:syrian_cart/feature/home/data/data_source/product_data.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/category/category_list.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/product/product_card.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/search/search_input.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomAppBar()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 12,
          )),
          SliverToBoxAdapter(child: SearchInput()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 20,
              ),
              child: CategoryList(
                categories: categories,
                selectedIndex: selectedCategory,
                onSelected: (index) {
                  setState(() {
                    selectedCategory = index;
                  });
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(
                    product: ProductData.products[index],
                  );
                },
                childCount: ProductData.products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
