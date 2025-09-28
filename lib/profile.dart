import 'package:flutter/material.dart';
import 'theme.dart'; // Импорт цветов

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground, // цвет фона
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white12,
              child: Icon(Icons.person, size: 60, color: AppColors.secondaryText),
            ),
            const SizedBox(height: 16),
            Text(
              'name',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '[Email]',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryText.withValues(alpha: 0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSettingsItem(
              icon: Icons.language,
              title: 'English',
              trailingIcon: Icons.expand_more,
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.edit,
              title: 'Profile Settings',
              trailingText: 'Edit Profile',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.notifications,
              title: 'Notification Settings',
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.logout,
              title: 'Log out of account',
              trailingText: 'Log Out?',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? trailingText,
    IconData? trailingIcon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: AppColors.secondaryText),
          title: Text(title, style: TextStyle(color: AppColors.primaryText)),
          trailing: trailingIcon != null
              ? Icon(trailingIcon, color: AppColors.secondaryText, size: 20)
              : (trailingText != null
                  ? Text(trailingText, style: TextStyle(color: AppColors.secondaryText))
                  : null),
          onTap: onTap,
        ),
        const Divider(color: Colors.white12, height: 1),
      ],
    );
  }
}
