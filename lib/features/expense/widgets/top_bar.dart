import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

String created_date = DateTime.now().toLocal().toString().split(' ')[0];

final TextEditingController price = TextEditingController(text: "0");
final FocusNode focusNode = FocusNode();

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final TextEditingController _priceController = TextEditingController(
    text: '0 PKR',
  );
  final FocusNode _focusNode = FocusNode();

  final String _createdDate = DateTime.now().toLocal().toString().split(' ')[0];

  @override
  void dispose() {
    _priceController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Method for splitting your bill",
          style: theme.displaySmall,
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Admin:",
              style: theme.displayLarge?.copyWith(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Marium",
                  style: theme.displaySmall?.copyWith(fontSize: 17),
                ),
                Text(
                  _createdDate,
                  style: theme.displaySmall?.copyWith(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              "Total Price: ",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.brown,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: EditableText(
                controller: _priceController,
                focusNode: _focusNode,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: AppColors.brown,
                ),
                cursorColor: Theme.of(context).primaryColor,
                backgroundCursorColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
