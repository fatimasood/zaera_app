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
            onPressed: () => context.goNamed('home'),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.brown,
              size: 24,
            ),
          ),
          title: const Text("Spain Trip", textAlign: TextAlign.left),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  print("Right icon tapped!");
                  // Share link logic
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),
              const SizedBox(height: 15),
              SplitOptions(),
              const SizedBox(height: 20),
              AttachReceipt(),
              const SizedBox(height: 20),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: SizedBox(
            height: buttonHeight,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.goNamed('home');
                // Logic to trigger the split action
              },
              child: Text(
                "Split your bill",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
