import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> settingsOptions = [
      {
        'icon': Icons.play_circle_fill,
        'title': 'How to Use Zaera',
        'onTap': () {
          // TODO: Open tutorial video
        },
      },
      {
        'icon': Icons.star_rate_rounded,
        'title': 'Rate This App',
        'onTap': () {
          // TODO: Trigger rate dialog
        },
      },
      {
        'icon': Icons.support_agent_rounded,
        'title': 'Contact Zaera Support',
        'onTap': () {
          // TODO: Open contact form or mail
        },
      },
      {
        'icon': Icons.brightness_6_rounded,
        'title': 'App Theme',
        'subtitle': 'Light / Dark',
        'onTap': () {},
      },
      {
        'icon': Icons.notifications_active_outlined,
        'title': 'Notification Preferences',
        'onTap': () {},
      },
      {
        'icon': Icons.language,
        'title': 'Language',
        'subtitle': 'English (Default)',
        'onTap': () {},
      },
      {'icon': Icons.lock_outline, 'title': 'Privacy Policy', 'onTap': () {}},
      {
        'icon': Icons.policy_outlined,
        'title': 'Terms of Service',
        'onTap': () {},
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Settings',
                    style: GoogleFonts.urbanist(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.brown,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Settings List
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: settingsOptions.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = settingsOptions[index];
                    return ListTile(
                      onTap: item['onTap'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.tealGreen.withOpacity(0.15),
                        child: Icon(item['icon'], color: AppColors.brown),
                      ),
                      title: Text(
                        item['title'],
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.brown,
                        ),
                      ),
                      subtitle:
                          item['subtitle'] != null
                              ? Text(
                                item['subtitle'],
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              )
                              : null,
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),
                Divider(color: Colors.brown.shade200, thickness: 1.2),

                const SizedBox(height: 24),

                // Footer
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Made with 💚 in Pakistan",
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          color: AppColors.brown,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "© 2025 Zaera, Inc. All rights reserved.",
                        style: GoogleFonts.urbanist(
                          fontSize: 12,
                          color: Colors.brown.shade400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "PS: Developed by Fatema Masood ✨",
                        style: GoogleFonts.urbanist(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: AppColors.brown.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Version 1.0.0",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
