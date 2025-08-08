import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/auth/auth_controller.dart';
import 'package:zaera_app/features/profile/widgets/user_profile_image.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //get auth service
    final authService = AuthController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.02,
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
                    color: AppColors.brown,
                    size: 20,
                  ),
                  title: Text(
                    'Set Reminder Message',
                    style: GoogleFonts.inter(
                      fontSize: 16,
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
                    Icons.notifications_active,
                    color: AppColors.brown,
                    size: 20,
                  ),
                  title: Text(
                    'Send Reminder to All',
                    style: GoogleFonts.inter(
                      fontSize: 16,
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
                    color: AppColors.brown,
                    size: 20,
                  ),
                  title: Text(
                    'Change Password',
                    style: GoogleFonts.inter(
                      fontSize: 16,
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
                    color: AppColors.brown,
                    size: 20,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brown,
                    ),
                  ),
                  //logout the user
                  onTap: () async {
                    await authService.signOut();
                    if (!mounted) return;
                    context.goNamed('login');
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
                      fontSize: 16,
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
