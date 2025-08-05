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
          // TODO: Open tutorial
        },
      },
      {
        'icon': Icons.star_rate,
        'title': 'Rate This App',
        'onTap': () {
          // TODO: Rate
        },
      },
      {
        'icon': Icons.support_agent,
        'title': 'Contact Zaera Support',
        'onTap': () {
          // TODO: Contact
        },
      },
      {
        'icon': Icons.notifications_active,
        'title': 'Notification Preferences',
        'onTap': () {
          // TODO
        },
      },
      {
        'icon': Icons.lock,
        'title': 'Privacy Policy',
        'onTap': () {
          // TODO
        },
      },
      {
        'icon': Icons.policy,
        'title': 'Terms of Service',
        'onTap': () {
          // TODO
        },
      },
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),

          iconTheme: IconThemeData(color: AppColors.brown),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...settingsOptions.map(
                (item) => Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        item['icon'],
                        size: 24,
                        color: AppColors.brown,
                      ),
                      title: Text(
                        item['title'],
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.brown,
                        ),
                      ),
                      onTap: item['onTap'],
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.07),

              // Footer
              /* Center(
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
                      "PS: Developed by Fatema.Masood ✨",
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
                  ],
                ),
              ),
              const SizedBox(height: 24),*/
            ],
          ),
        ),
      ),
    );
  }
}
