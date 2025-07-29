import 'package:flutter/material.dart';
import 'package:zaera_app/app/about_us.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/group/all_groups.dart';
import 'package:zaera_app/features/group/widgets/create_group.dart';
import 'package:zaera_app/features/home/home_view.dart';
import 'package:zaera_app/features/profile/user_profile.dart';
import 'package:zaera_app/features/settings/settings.dart';
import 'package:zaera_app/utils/bottom_navigationbar.dart';
import 'package:zaera_app/utils/drawar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomeView(),
    UserProfile(),
    AllGroups(),
    Settings(),
    AboutUs(),
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onSidebarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
    Navigator.pop(context); // Close the sidebar
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onBottomNavItemTapped,
        ),
        drawer: Drawar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onSidebarItemTapped,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Disable swipe navigation
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),

        floatingActionButton: Transform.translate(
          offset: Offset(0, 22), // push FAB down
          child: SizedBox(
            height: 62,
            width: 62,
            child: FloatingActionButton(
              onPressed: () {
                showCreateGroupDialog(context);
              },
              backgroundColor: AppColors.musteredGreen,
              shape: CircleBorder(),
              child: Image.asset(
                'lib/assets/images/addgroup.png',
                width: 47,
                height: 47,
              ),
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
