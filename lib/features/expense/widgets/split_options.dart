import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class SplitOptions extends StatefulWidget {
  const SplitOptions({super.key});

  @override
  State<SplitOptions> createState() => _SplitOptionsState();
}

class _SplitOptionsState extends State<SplitOptions> {
  int _selectedIndex = 0;

  final List<String> options = ["Percentage", "Custom", "Equally"];

  Widget _buildSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return const Text("Show percentage input or UI here");
      case 1:
        return const Text("Show custom split UI here");
      case 2:
        return const Text("Show equal split info here");
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Buttons
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
                          : const BorderSide(
                            color: AppColors.brown,
                            width: 1.5,
                          ),
                  foregroundColor:
                      isSelected ? AppColors.background : AppColors.brown,
                ),
                child: Text(
                  options[index],
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
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
