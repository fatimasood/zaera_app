import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaera_app/app/about_us.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/group/all_groups.dart';
import 'package:zaera_app/features/group/create_group.dart';
import 'package:zaera_app/features/home/home_view.dart';
import 'package:zaera_app/features/profile/user_profile.dart';
import 'package:zaera_app/features/settings/settings.dart';
import 'package:zaera_app/app/bottom_navigationbar.dart';
import 'package:zaera_app/app/drawar.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  late List<Widget> _pages;
  String? _userName;

  @override
  void initState() {
    super.initState();

    _userName = widget.userName;
    // if not passed, fetch from DB
    if (_userName == null || _userName!.isEmpty) {
      _fetchUserName();
    }

    _pages = [
      HomeView(userName: widget.userName),
      UserProfile(userName: widget.userName),
      AllGroups(),
      Settings(),
      AboutUs(),
    ];
  }

  // fetch user name

  Future<void> _fetchUserName() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) {
      final response =
          await Supabase.instance.client
              .from('zaera_users')
              .select('name')
              .eq('id', user.id)
              .maybeSingle();

      if (response != null && response['name'] != null) {
        setState(() {
          _userName = response['name'];
          // update _pages so children get the name
          _pages = [
            HomeView(userName: _userName ?? ""),
            UserProfile(userName: _userName ?? ""),
            AllGroups(),
            Settings(),
            AboutUs(),
          ];
        });
      }
    }
  }

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
          physics: NeverScrollableScrollPhysics(),
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
