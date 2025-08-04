import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class Drawar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Drawar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        color: AppColors.musteredGreen,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Navigation Options
          Column(
            children: [
              const SizedBox(height: 30),
              _buildDrawerItem(
                icon: Icons.home_outlined,
                title: 'Home',
                index: 0,
              ),
              _buildDrawerItem(
                icon: Icons.favorite_border,
                title: 'Roomies',
                index: 1,
              ),
              _buildDrawerItem(
                icon: Icons.group_add_outlined,
                title: 'Groups',
                index: 2,
              ),
              _buildDrawerItem(
                icon: Icons.settings_outlined,
                title: 'Settings',
                index: 3,
              ),
              _buildDrawerItem(
                icon: Icons.people_outlined,
                title: 'About Us',
                index: 4,
              ),
            ],
          ),

          // Logout at the Bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.background,
                size: 25,
              ),
              title: Text(
                'Logout',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.background,
                ),
              ),
              onTap: () {
                // Perform logout
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    return SizedBox(
      height: 40,
      child: ListTile(
        leading: Icon(icon, size: 25, color: AppColors.background),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.background,
          ),
        ),
        onTap: () => onItemTapped(index),
      ),
    );
  }
}
