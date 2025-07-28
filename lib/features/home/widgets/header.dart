import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zaera_app/core/themes/colors.dart';

class TopBarHeader extends StatelessWidget {
  const TopBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
            radius: 28,
            backgroundColor: AppColors.tealGreen,
            backgroundImage: AssetImage(
              'lib/assets/images/avatar.png',
            ), // Replace with your image
          ),
        ),
        // right side widget icon notification click to open notifications screen
        GestureDetector(
          onTap: () {
            // Handle notification icon tap
            GoRouter.of(context).go('/notifications');
          },
          child: Icon(
            Icons.notifications_outlined,
            size: 28,
            color: AppColors.tealGreen,
          ),
        ),
      ],
    );
  }
}
