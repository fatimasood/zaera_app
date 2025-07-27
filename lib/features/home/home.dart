import 'package:flutter/material.dart';
import 'package:zaera_app/features/group/all_groups.dart';
import 'package:zaera_app/features/home/home_view.dart';
import 'package:zaera_app/features/profile/user_profile.dart';
import 'package:zaera_app/utils/bottom_navigationbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    AllGroups(),
    //ExpensesView(),
    UserProfile(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: _onNavTap,
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
