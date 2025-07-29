import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zaera_app/core/themes/colors.dart';

void showCreateGroupDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,

    barrierLabel: 'Create Group',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return const SizedBox.shrink(); // We’ll build UI inside transitionBuilder
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
            child: Center(
              child: CreateGroupPopup(), // 👇 This is your custom popup widget
            ),
          ),
        ),
      );
    },
  );
}

class CreateGroupPopup extends StatelessWidget {
  const CreateGroupPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(109, 252, 251, 249),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.brown, width: 1.5),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.75),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Create your Squad 👯‍♀️",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Group Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Create Group'),
            ),
          ],
        ),
      ),
    );
  }
}
