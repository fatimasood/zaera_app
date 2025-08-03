import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class Updates extends StatelessWidget {
  const Updates({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double spacing(double factor) => screenHeight * factor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Updates',
          style: GoogleFonts.urbanist(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.brown,
          ),
        ),
        SizedBox(height: spacing(0.012)),
        Container(
          height: screenHeight * 0.3,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.brown, width: 1),
            color: AppColors.background,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.75),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: spacing(0.01)),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                leading: CircleAvatar(
                  backgroundColor: AppColors.musteredGreen,
                  radius: 20,
                  child: Image.asset(
                    'lib/assets/images/addgroup.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                title: Text(
                  'Update ${index + 1}',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.brown,
                  ),
                ),
                subtitle: Text(
                  'Details about update ${index + 1}',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    color: AppColors.brown.withOpacity(0.7),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
