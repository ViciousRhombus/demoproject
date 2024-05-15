import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/User/Mobile/bookingpage_mobile.dart';
import 'package:demoproject/User/Mobile/homepage_mobile.dart';
import 'package:demoproject/User/Mobile/profile_mobile.dart';
import 'package:demoproject/User/Mobile/searchpage_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class UserNavigationMobile extends StatelessWidget {
  const UserNavigationMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final provider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: provider.selectedIndex,
        indicatorColor: AppConst.yellowColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: heightMQ * 0.08,

        onDestinationSelected: (index) => provider.setIndex(index),
        destinations: const [
          NavigationDestination(
              icon: Icon(FluentIcons.home_12_regular), label: '',),
          NavigationDestination(
              icon: Icon(FluentIcons.calendar_clock_16_regular), label: ''),
          NavigationDestination(
              icon: Icon(FluentIcons.search_12_regular), label: ''),
          NavigationDestination(
              icon: Icon(FluentIcons.person_12_regular), label: '')
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(bottom:0),
        child: provider.screens[provider.selectedIndex],
      ),
    );
  }
}

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Widget> _screens = [];
  List<String> _titles = [];

  int get selectedIndex => _selectedIndex;

  List<Widget> get screens => _screens;

  List<String> get titles => _titles;

  NavigationProvider() {
    _screens = [
      const UserHomepageMobile(),
      const UserBookingMobile(),
      const UserSearchMobile(),
      const UserProfileMobile(),
    ];
    _titles = [
      'Home Page',
      'Booking Page',
      'Search Page',
      'Profile Page',
    ];
  }

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}