import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:zaera_app/core/themes/colors.dart';

void showCreateGroupDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Create Group",
    barrierColor: Colors.black.withOpacity(0.4),
    pageBuilder: (context, animation, secondaryAnimation) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: const SizedBox(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: Opacity(
          opacity: animation.value,
          child: const Center(child: CreateGroupDialog()),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}

class CreateGroupDialog extends StatefulWidget {
  const CreateGroupDialog({super.key});

  @override
  State<CreateGroupDialog> createState() => _CreateGroupDialogState();
}

class _CreateGroupDialogState extends State<CreateGroupDialog> {
  final TextEditingController _groupNameController = TextEditingController();
  String? _generatedLink;
  bool _linkGenerated = false;

  String _generateFakeShortLink(String groupName) {
    // Just a demo — in real life, call backend or Firebase Dynamic Link
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    String randomCode =
        List.generate(6, (_) => chars[random.nextInt(chars.length)]).join();
    return 'https://zaera.app/g/$randomCode';
  }

  void _handlePrimaryButton() {
    if (_linkGenerated) {
      Clipboard.setData(ClipboardData(text: _generatedLink!));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Link copied to clipboard!")),
      );

      Future.delayed(const Duration(seconds: 30), () {
        Navigator.of(context).pop();
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        context.goNamed(
          'split_bill',
          queryParameters: {'link': _generatedLink!},
        );
      });
    } else {
      final groupName = _groupNameController.text.trim();
      if (groupName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a group name.")),
        );
        return;
      }

      final link = _generateFakeShortLink(groupName);

      setState(() {
        _generatedLink = link;
        _linkGenerated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.brown, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Create your squad 👯‍♀️",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.brown,
                fontFamily: 'Urbanist',
              ),
            ),
            const SizedBox(height: 22),

            if (!_linkGenerated)
              TextField(
                cursorColor: AppColors.brown,
                controller: _groupNameController,
                style: const TextStyle(
                  color: AppColors.brown,
                  fontFamily: 'Inter',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  labelText: "Group Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
            else
              SelectableText(
                _generatedLink ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.tealGreen,
                  fontFamily: 'Inter',
                ),
              ),

            const SizedBox(height: 35),

            SizedBox(
              height: 48,
              width: 160,
              child: ElevatedButton(
                onPressed: _handlePrimaryButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.musteredGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _linkGenerated ? "Copy Link" : "Let's Go!",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            const SizedBox(height: 10),
            /*if (_linkGenerated) ...[
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => context.goNamed('home'),
                child: const Text(
                  "Continue to App →",
                  style: TextStyle(
                    color: AppColors.tealGreen,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],*/
          ],
        ),
      ),
    );
  }
}
