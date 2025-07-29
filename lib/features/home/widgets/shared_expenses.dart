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
    return Column(
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
          height: 200,
          width: double.infinity,
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
                  margin: const EdgeInsets.all(10.0),
                  width: 220,
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
                            : Border.all(color: AppColors.brown, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.75),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Expense ${index + 1}',
                          style: GoogleFonts.urbanist(
                            color:
                                isSelected
                                    ? AppColors.background
                                    : AppColors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${(index + 1) * 10}',
                          style: GoogleFonts.urbanist(
                            color:
                                isSelected
                                    ? AppColors.background
                                    : AppColors.brown.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
