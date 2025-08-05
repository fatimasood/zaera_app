import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/profile/widgets/user_profile_image.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      UserProfileImage(),
                      SizedBox(height: screenHeight * 0.025),
                    ],
                  ),
                ),

                // Reminder Message Setup
                ListTile(
                  leading: const Icon(
                    Icons.message,
                    size: 20,
                    color: AppColors.brown,
                  ),
                  title: Text(
                    'Set Reminder Message',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brown,
                    ),
                  ),
                  subtitle: Text(
                    'Custom text to remind users to return your money',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.brown.withOpacity(0.75),
                    ),
                  ),
                  onTap: () {
                    // Handle message input
                  },
                ),

                // Send Reminder to All
                ListTile(
                  leading: const Icon(
                    Icons.notifications_active_outlined,
                    size: 20,
                    color: AppColors.brown,
                  ),
                  title: Text(
                    'Send Reminder to All',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brown,
                    ),
                  ),
                  subtitle: Text(
                    'One-tap remind everyone who owes you',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.brown.withOpacity(0.75),
                    ),
                  ),
                  onTap: () {
                    // Handle send reminders
                  },
                ),
                // Edit Profile
                ListTile(
                  leading: const Icon(
                    Icons.password,
                    size: 20,
                    color: AppColors.brown,
                  ),
                  title: Text(
                    'Change Password',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brown,
                    ),
                  ),
                  //trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle edit profile navigation
                  },
                ),
                // Logout
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 20,
                    color: AppColors.brown,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brown,
                    ),
                  ),
                  onTap: () {
                    // Handle logout
                  },
                ),
                // Delete Account
                ListTile(
                  leading: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 20,
                  ),
                  title: Text(
                    'Delete Account',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textColor: Colors.red,
                  onTap: () {
                    // Handle delete account
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
