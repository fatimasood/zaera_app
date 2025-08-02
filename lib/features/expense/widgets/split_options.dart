import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/expense/custom_split/custom_split.dart';
import 'package:zaera_app/features/expense/equal_split/equal_Split.dart';
import 'package:zaera_app/features/expense/percentage_split/percentage_split.dart';

class SplitOptions extends StatefulWidget {
  const SplitOptions({super.key});

  @override
  State<SplitOptions> createState() => _SplitOptionsState();
}

class _SplitOptionsState extends State<SplitOptions> {
  int _selectedIndex = 0;

  final List<String> options = ["Equally", "Percentage", "Custom"];

  Widget _buildSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return const EqualSplitInfo();
      case 1:
        return const PercentageSplitInfo();
      case 2:
        return const CustomSplitInfo();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<SplitViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(options.length, (index) {
            bool isSelected = _selectedIndex == index;
            return SizedBox(
              width: 120,
              child: OutlinedButton(
                onPressed: () {
                  setState(() => _selectedIndex = index);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      isSelected
                          ? AppColors.musteredGreen
                          : AppColors.background,
                  side:
                      isSelected
                          ? BorderSide.none
                          : const BorderSide(color: AppColors.brown, width: 1),
                  foregroundColor:
                      isSelected ? AppColors.background : AppColors.brown,
                ),
                child: Text(
                  options[index],
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: isSelected ? AppColors.background : AppColors.brown,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),

        /// Dynamic Content
        _buildSelectedWidget(),
      ],
    );
  }
}
