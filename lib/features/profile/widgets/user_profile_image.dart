import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zaera_app/core/themes/colors.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({super.key});

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  @override
  void initState() {
    super.initState();
  }

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
              // backgroundImage: avatarImage,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            "personName",
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w600,
              color: AppColors.brown,
            ),
          ),
          Text(
            "@userName",
            style: GoogleFonts.inter(color: AppColors.brown.withOpacity(0.65)),
          ),
        ],
      ),
    );
  }
}
