import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class AttachReceipt extends StatefulWidget {
  const AttachReceipt({super.key});

  @override
  State<AttachReceipt> createState() => _AttachReceiptState();
}

class _AttachReceiptState extends State<AttachReceipt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Attach Receipt",
          style: GoogleFonts.urbanist(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppColors.brown,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 130,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.brown, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/upload_icon.png',
                height: 60,
                color: AppColors.musteredGreen,
              ),
              SizedBox(height: 10),
              Text(
                "Add jpg, png, jpeg files",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.musteredGreen,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
