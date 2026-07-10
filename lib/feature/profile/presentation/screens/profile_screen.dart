import 'package:flutter/material.dart';
import 'package:syrian_cart/core/routing/app_routes.dart';
import 'package:syrian_cart/core/theme/color/app_colors.dart';
import 'package:syrian_cart/core/theme/style/app_text_styles.dart';
import 'package:syrian_cart/feature/profile/data/models/user_model.dart';
import 'package:syrian_cart/feature/profile/presentation/widgets/profile_header.dart';
import 'package:syrian_cart/feature/profile/presentation/widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.user = UserModel.guest});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Profile', style: AppTextStyles.displaySmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ProfileHeader(user: user),
            const SizedBox(height: 24),
            ProfileSection(title: 'Orders', items: _orderItems),
            const SizedBox(height: 20),
            ProfileSection(title: 'Settings', items: _settingsItems),
            const SizedBox(height: 20),
            ProfileMenuTile(
              data: ProfileMenuItemData(
                icon: Icons.logout,
                label: 'Log Out',
                isDestructive: true,
                onTap: () => _confirmLogout(context),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text('App version 1.0.0', style: AppTextStyles.bodySmall),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Log Out', style: AppTextStyles.titleMedium),
        content: Text(
          'Are you sure you want to log out?',
          style: AppTextStyles.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text('Cancel', style: AppTextStyles.bodySmall),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              'Log Out',
              style: AppTextStyles.bodySmall.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      Navigator.popAndPushNamed(context, AppRoutes.login);
    }
  }
}

final _orderItems = <ProfileMenuItemData>[
  ProfileMenuItemData(icon: Icons.receipt_long_outlined, label: 'My Orders'),
  ProfileMenuItemData(
    icon: Icons.location_on_outlined,
    label: 'Shipping Addresses',
  ),
  ProfileMenuItemData(icon: Icons.payment_outlined, label: 'Payment Methods'),
];

final _settingsItems = <ProfileMenuItemData>[
  ProfileMenuItemData(icon: Icons.notifications_none, label: 'Notifications'),
  ProfileMenuItemData(icon: Icons.language_outlined, label: 'Language'),
  ProfileMenuItemData(icon: Icons.help_outline, label: 'Help Center'),
];

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.title, required this.items});

  final String title;
  final List<ProfileMenuItemData> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodyLarge),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.grey100),
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              final isLast = index == items.length - 1;
              return Column(
                children: [
                  ProfileMenuTile(data: items[index]),
                  if (!isLast)
                    const Divider(height: 1, indent: 16, endIndent: 16),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
