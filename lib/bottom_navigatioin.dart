import 'package:employee_list/home/view/home_profile.dart';
import 'package:employee_list/setting/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'profile/view/add_new_profile.dart';

class PersistenBottomNavBarDemo extends StatelessWidget {
  const PersistenBottomNavBarDemo({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: "Persistent Bottom Navigation Bar Demo", home: MinimalExample());
}

class MinimalExample extends StatefulWidget {
  MinimalExample({super.key});

  @override
  State<MinimalExample> createState() => _MinimalExampleState();
}

class _MinimalExampleState extends State<MinimalExample> {
  List<PersistentTabConfig> tabsss() => [
        PersistentTabConfig(
          screen: HomeProfileScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: AddNewProfile(),
          item: ItemConfig(
            icon: const Icon(Icons.add),
            title: "Add Now",
          ),
        ),
        PersistentTabConfig(
          screen: const SettingScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Settings",
          ),
        ),
        PersistentTabConfig(
          screen: Container(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: tabsss(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}
