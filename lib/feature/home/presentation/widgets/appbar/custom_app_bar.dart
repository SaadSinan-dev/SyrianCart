import 'package:flutter/material.dart';
import 'package:syrian_cart/core/theme/color/app_colors.dart';
import 'package:syrian_cart/core/theme/style/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text(
                'Hello,Wellcome 👋',
                style: AppTextStyles.headlineSmall
                    .copyWith(color: AppColors.black60),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Albert Stevano',
                style: AppTextStyles.headlineLarge,
              )
            ],
          ),
        ),
      ],
    );
  }
}
