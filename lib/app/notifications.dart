import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart'; // Make sure your color theme file is imported

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> notifications = [
      {
        'icon': Icons.payment,
        'title': 'Payment Received',
        'subtitle': 'Ali paid you Rs. 1500 for Dinner',
        'time': '2 hrs ago',
      },
      {
        'icon': Icons.group,
        'title': 'Group Updated',
        'subtitle': 'Zaera Squad changed the group name',
        'time': 'Yesterday',
      },
      {
        'icon': Icons.warning,
        'title': 'Pending Expense',
        'subtitle': 'You owe Zara Rs. 350',
        'time': '3 days ago',
      },
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.goNamed('home'),
            icon: Icon(Icons.arrow_back_ios_new, size: 20),
          ),
          title: const Text("Notifications"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.02,
          ),
          child:
              notifications.isEmpty
                  ? Center(
                    child: Text(
                      'No notifications yet',
                      style: GoogleFonts.inter(
                        color: AppColors.tealGreen.withOpacity(0.75),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  : ListView.separated(
                    itemCount: notifications.length,
                    separatorBuilder:
                        (_, __) => Divider(height: screenHeight * 0.025),
                    itemBuilder: (context, index) {
                      final item = notifications[index];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.tealGreen.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item['icon'],
                              size: 24,
                              color: AppColors.tealGreen,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item['subtitle'],
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item['time'],
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
