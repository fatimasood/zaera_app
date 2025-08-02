import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

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

  @override
  void dispose() {
    _priceController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Method for splitting your bill",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: AppColors.brown,
          ),
        ),

        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "Total Price: ",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.brown,
              ),
            ),

            Expanded(
              child: EditableText(
                controller: _priceController,
                focusNode: _focusNode,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
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
