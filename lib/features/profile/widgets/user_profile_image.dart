import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zaera_app/core/themes/colors.dart';

class UserProfileImage extends StatelessWidget {
  final String userName;

  const UserProfileImage({super.key, required this.userName});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth * 0.2;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: AppColors.tealGreen,
              backgroundImage: const AssetImage('lib/assets/images/avatar.png'),
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            userName,
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w600,
              color: AppColors.brown,
            ),
          ),
          Text(
            "@$userName.zaera",
            style: GoogleFonts.inter(color: AppColors.brown.withOpacity(0.65)),
          ),
        ],
      ),
    );
  }
}
