import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white12,
              child: Icon(Icons.person, size: 60, color: Colors.white54),
            ),
            const SizedBox(height: 16),
            const Text(
              'name',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '[Email]',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white38,
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70.withValues(alpha: 0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSettingsItem(
              icon: Icons.language,
              title: 'English',
              trailingIcon: Icons.expand_more,
              onTap: () {
                // Выбор языка
              },
            ),
            _buildSettingsItem(
              icon: Icons.edit,
              title: 'Profile Settings',
              trailingText: 'Edit Profile',
              onTap: () {
                // Редактировать профиль
              },
            ),
            _buildSettingsItem(
              icon: Icons.notifications,
              title: 'Notification Settings',
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                // Настройки уведомлений
              },
            ),
            _buildSettingsItem(
              icon: Icons.logout,
              title: 'Log out of account',
              trailingText: 'Log Out?',
              onTap: () {
                // Выход из аккаунта
              },
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
          leading: Icon(icon, color: Colors.white54),
          title: Text(title, style: const TextStyle(color: Colors.white70)),
          trailing: trailingIcon != null
              ? Icon(trailingIcon, color: Colors.white54, size: 20)
              : (trailingText != null
                  ? Text(trailingText,
                      style: const TextStyle(color: Colors.white54))
                  : null),
          onTap: onTap,
        ),
        const Divider(color: Colors.white12, height: 1),
      ],
    );
  }
}
