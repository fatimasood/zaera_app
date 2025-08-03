import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zaera_app/core/themes/colors.dart';

class TopBarHeader extends StatelessWidget {
  const TopBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    // Scale avatar and icon sizes
    final avatarRadius = screenWidth * 0.075;
    final iconSize = screenWidth * 0.075;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //click able avatar
        GestureDetector(
          onTap: () {
            // Handle avatar tap, e.g., navigate to profile
            GoRouter.of(context).go('/profile');
          },
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundColor: AppColors.tealGreen,
            backgroundImage: AssetImage(
              'lib/assets/images/avatar.png',
            ), // Replace with your image
          ),
        ),
        //Notification icon
        GestureDetector(
          onTap: () {
            // Handle notification icon tap
            GoRouter.of(context).go('/notifications');
          },
          child: Icon(
            Icons.notifications_outlined,
            size: iconSize,
            color: AppColors.tealGreen,
          ),
        ),
      ],
    );
  }
}
