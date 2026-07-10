import 'package:flutter/material.dart';
import 'package:syrian_cart/core/theme/color/app_colors.dart';
import 'package:syrian_cart/core/theme/style/app_text_styles.dart';
import 'package:syrian_cart/feature/home/data/models/category_models.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.grey300,
                  width: 1,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.image,
              width: 28,
              height: 28,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            const SizedBox(width: 8),
            Text(
              category.name,
              style: AppTextStyles.labelLarge.copyWith(
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
