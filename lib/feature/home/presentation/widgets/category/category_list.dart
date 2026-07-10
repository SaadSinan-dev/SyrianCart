import 'package:flutter/material.dart';
import 'package:syrian_cart/feature/home/data/models/category_models.dart';
import 'package:syrian_cart/feature/home/presentation/widgets/category/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<CategoryModel> categories;
  final int selectedIndex;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CategoryItem(
                category: categories[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  onSelected(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
