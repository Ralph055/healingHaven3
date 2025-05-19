import 'package:flutter/material.dart';
import 'package:healing_haven/doctorUI/privacypolicy.dart';

class SettingsAdmin extends StatelessWidget {
  const SettingsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _buildSettingsTile(
              icon: Icons.edit,
              title: "Edit Portfolio",
              onTap: () {
                Navigator.pushNamed(context, '/editportfolio');
              },
            ),
            Divider(thickness: 1, color: Colors.grey),

            _buildSettingsTile(
              icon: Icons.lock,
              title: "Change Password",
              onTap: () {
                // Handle change password tap
                Navigator.pushNamed(context, '/changepassword');
              },
            ),
            Divider(thickness: 1, color: Colors.grey),

            _buildSettingsTile(
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
              onTap: () {
                launchPrivacyPolicy();
              },
            ),
            Divider(thickness: 1, color: Colors.grey),
          ],
        ),
        _buildSettingsTile(
          icon: Icons.logout,
          title: "Log Out",
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/loginpage',
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
