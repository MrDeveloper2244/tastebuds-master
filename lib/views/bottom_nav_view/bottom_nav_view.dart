

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tastebuds/controllers/bottom_nav_controller.dart';
import 'package:tastebuds/views/explore_view.dart/explore_view.dart';
import 'package:tastebuds/views/home_view/home_view.dart';
import 'package:tastebuds/views/saved_view/saved_view.dart';
class BottomNavScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> screens = [
     HomeScreen(),
    SavedScreen(),
    ExploreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
        child: Obx(() => GNav(
             gap: 3, // Reduce gap for better fit
              iconSize: 27, // Reduce icon size
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Adjust padding
              tabBackgroundColor: Colors.white,
              color: Colors.black54,
              activeColor: Colors.black, // Highlight selected icon
              tabBorderRadius: 10,
              textSize: 12, // Reduce text size to fit well
              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.bookmark_border_outlined, text: "Saved"),
                GButton(icon: Icons.visibility, text: "Explore"),


              ],
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) => controller.changeIndex(index),
            )),
      ),
    );
  }
}
