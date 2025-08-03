import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zaera_app/core/themes/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    final iconSize = screenWidth * 0.075;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //click able avatar
        Text(
          "Shared Expenses",
          style: Theme.of(context).textTheme.displayMedium,
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
