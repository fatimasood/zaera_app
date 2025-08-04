import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    final avatarRadius = screenWidth * 0.2;
    // final iconSize = screenWidth * 0.075;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              //can change there profile picture
            },
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: AppColors.tealGreen,
              backgroundImage: AssetImage(
                'lib/assets/images/avatar.png',
              ), // Replace with your image
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            "Fatema",
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.brown,
            ),
          ),
          Text("@fatimamughal103"),
        ],
      ),
    );
  }
}
