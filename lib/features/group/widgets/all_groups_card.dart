import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class AllGroupsCard extends StatefulWidget {
  const AllGroupsCard({super.key});

  @override
  State<AllGroupsCard> createState() => _AllGroupsCardState();
}

class _AllGroupsCardState extends State<AllGroupsCard> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final boxHeight = screenHeight * 0.15;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.73,
      child: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              // TODO: Navigate to group detail screen
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: boxHeight,
              margin: const EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.musteredGreen : AppColors.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? AppColors.musteredGreen : AppColors.brown,
                  width: 1.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.75),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spain Trip 🇪🇸',
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          isSelected ? AppColors.background : AppColors.brown,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Total Expense: ₹3,000',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color:
                          isSelected
                              ? AppColors.background
                              : AppColors.brown.withOpacity(0.85),
                    ),
                  ),
                  Text(
                    'Your Share: ₹1,000',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color:
                          isSelected
                              ? AppColors.background
                              : AppColors.brown.withOpacity(0.85),
                    ),
                  ),
                  Text(
                    'Status: Pending ⏳',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color:
                          isSelected
                              ? AppColors.background
                              : AppColors.brown.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
