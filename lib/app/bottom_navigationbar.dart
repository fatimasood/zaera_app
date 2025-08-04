import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final double navItemWidth = MediaQuery.of(context).size.width / 5;
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColors.musteredGreen,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.65),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(Icons.home_outlined, "Home", 0),
              buildNavItem(Icons.favorite_border, "Roomies", 1),
              SizedBox(width: navItemWidth * 0.8),
              buildNavItem(Icons.group_add_outlined, "Groups", 2),
              buildNavItem(Icons.settings_outlined, "Settings", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color:
                selectedIndex == index
                    ? AppColors.background
                    : AppColors.background.withOpacity(0.75),
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color:
                  selectedIndex == index
                      ? AppColors.background
                      : AppColors.background.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double fabRadius = 38;
    final double curveDepth = 45;

    final path = Path();
    path.lineTo((size.width / 2) - fabRadius - 15, 0);

    path.quadraticBezierTo(
      size.width / 2 - fabRadius,
      0,
      size.width / 2 - fabRadius + 5,
      curveDepth - 5,
    );

    path.arcToPoint(
      Offset(size.width / 2 + fabRadius - 5, curveDepth - 5),
      radius: Radius.circular(40),
      clockwise: false,
    );

    path.quadraticBezierTo(
      size.width / 2 + fabRadius,
      0,
      (size.width / 2) + fabRadius + 15,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
