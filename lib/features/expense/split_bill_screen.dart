import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/expense/widgets/attach_receipt.dart';
import 'package:zaera_app/features/expense/widgets/split_options.dart';
import 'package:zaera_app/features/expense/widgets/top_bar.dart';

class SplitBillScreen extends StatelessWidget {
  const SplitBillScreen({super.key, String? link});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonHeight = screenHeight * 0.06;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              context.goNamed('home');
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.brown,
              size: 24,
            ),
          ),
          title: Text(
            "Spain Trip",
            textAlign:
                TextAlign.left, // Example title, replace with dynamic data
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  print("Right icon tapped!");
                  // SHOW SAME LINK AGAIN FOR SHARING WITH FRIENDS
                },
                icon: Icon(
                  Icons.group_add_outlined,
                  color: AppColors.tealGreen,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TopBar(),
                    SizedBox(height: 15),
                    SplitOptions(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              AttachReceipt(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('home');
                    // split bill show amount and membres whos joined the group shows notification
                  },
                  child: Text(
                    "Split yout bill",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
