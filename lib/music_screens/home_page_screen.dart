import 'package:example/music_screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'home_screen.dart';
import 'hotlist_screen.dart';
import 'library_screen.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key key}) : super(key: key);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomeScreen(), SearchScreen(), LibraryScreen(), HotListScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.house_fill,
          size: 22,
        ),
        title: ("Home"),
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.search,
          size: 22,
        ),
        title: ("Search"),
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.library_music_sharp,
          size: 22,
        ),
        title: ("Library"),
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.whatshot,
          size: 22,
        ),
        title: ("Hotlist"),
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[850].withOpacity(0.9),
      //   title: const Text('Audio Player'),
      //   elevation: 0,
      // ),

      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        navBarHeight: 50,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.black,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
        // Choose the nav bar style with this property.
      ),
    );
  }
}
