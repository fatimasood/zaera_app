import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class SharedExpenses extends StatefulWidget {
  const SharedExpenses({super.key});

  @override
  State<SharedExpenses> createState() => _SharedExpensesState();
}

class _SharedExpensesState extends State<SharedExpenses> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double boxWidth = screenWidth * 0.55;
    double boxHeight = screenHeight * 0.16;
    double spacing(double factor) => screenHeight * factor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shared Expenses',
              style: GoogleFonts.urbanist(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.brown,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to all shared expenses
              },
              child: Text(
                'See All',
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.tealGreen,
                ),
              ),
            ),
          ],
        ),

        // Scrollable List
        SizedBox(
          height: boxHeight + spacing(0.02),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.001,
                  ),
                  width: boxWidth,
                  height: boxHeight,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? AppColors.musteredGreen
                            : AppColors.background,
                    borderRadius: BorderRadius.circular(20),

                    border:
                        isSelected
                            ? Border.all(
                              color: AppColors.musteredGreen,
                              width: 1.5,
                            )
                            : Border.all(color: AppColors.brown, width: 1),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spain Trip',
                        style: GoogleFonts.urbanist(
                          color:
                              isSelected
                                  ? AppColors.background
                                  : AppColors.brown,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total Expense: 300 pkr',
                        style: GoogleFonts.inter(
                          color:
                              isSelected
                                  ? AppColors.background
                                  : AppColors.brown.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Your share: 100 pkr',
                        style: GoogleFonts.inter(
                          color:
                              isSelected
                                  ? AppColors.background
                                  : AppColors.brown.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Your Status: Pending',
                        style: GoogleFonts.inter(
                          color:
                              isSelected
                                  ? AppColors.background
                                  : AppColors.brown.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
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
