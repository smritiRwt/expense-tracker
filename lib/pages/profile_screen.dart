import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/components/profile_info_tile.dart';
import 'package:expense/pages/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.person_rounded, color: Constants.lavender),
            const SizedBox(width: 5),
            Text(
              "Profile",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Constants.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 👤 Profile Avatar and Info
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                      'assets/avatar.png',
                    ), // Add your image
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'John Doe',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'test@example.com',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 📋 Profile Options
            const ProfileInfoTile(
              icon: Icons.edit,
              title: 'Edit Profile',
              subtitle: 'Update your profile info',
            ),

            const ProfileInfoTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'FAQs and contact support',
            ),

            const SizedBox(height: 30),

            /// 🚪 Logout
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.lavender,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
