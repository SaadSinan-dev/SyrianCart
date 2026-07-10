import 'package:flutter/material.dart';

class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  final String name;
  final String email;
  final String? avatarUrl;

  static const guest = UserModel(name: 'Guest', email: '');
}

class ProfileMenuItemData {
  const ProfileMenuItemData({
    required this.icon,
    required this.label,
    this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isDestructive;
}
