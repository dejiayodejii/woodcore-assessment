import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String subtitle;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onNotificationsTap;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.subtitle,
    this.onSettingsTap,
    this.onNotificationsTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(Icons.person, color: Colors.grey[400]),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi $userName!",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            GestureDetector(
              onTap: onSettingsTap ?? () => print("Settings tapped"),
              child: const Icon(Icons.settings, color: Colors.white),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: onNotificationsTap ?? () => print("Notifications tapped"),
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
