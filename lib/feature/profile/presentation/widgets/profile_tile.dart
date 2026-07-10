import 'package:flutter/material.dart';
import 'package:syrian_cart/core/theme/color/app_colors.dart';
import 'package:syrian_cart/core/theme/style/app_text_styles.dart';
import 'package:syrian_cart/feature/profile/data/models/user_model.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({super.key, required this.data});

  final ProfileMenuItemData data;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: data.label,
      child: InkWell(
        onTap: () => (data.onTap ?? (_) {})(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(
                data.icon,
                size: 20,
                color: data.isDestructive ? Colors.red : AppColors.black,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  data.label,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: data.isDestructive ? Colors.red : null,
                  ),
                ),
              ),
              if (!data.isDestructive)
                const Icon(Icons.chevron_right,
                    size: 24, color: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }
}
