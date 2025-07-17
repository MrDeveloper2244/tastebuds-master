import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class WeekMealSelectionScreen extends StatefulWidget {
  @override
  _WeekMealSelectionScreenState createState() =>
      _WeekMealSelectionScreenState();
}

class _WeekMealSelectionScreenState extends State<WeekMealSelectionScreen> {
  String? selectedAppetite;
  // TextEditingController searchController = TextEditingController();
  // List<Map<String, String>> filteredCountries = [];

  final List<Map<String, String>> appetites = [
    {
      "name": "To eat without taking queue",
    },
    {
      "name": "To find the best local places to eat",
    },
    {
      "name": "To be noticed best menu at a place",
    },
    {
      "name": "To be shared tips and etiquette local culture",
    },
    {
      "name": "Others",
    },
  ];

  final List<String> topAppetiteList = [
    'To eat without taking queue',
    'To find the best local places to eat',
    'To be noticed best menu at a place',
    'To be shared tips and etiquette local culture',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    final topCountryWidgets = appetites
        .where((c) => topAppetiteList.contains(c['name']))
        .map((country) {
      final isSelected = selectedAppetite == country['name'];
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedAppetite = country['name'];
          });
        },
        child: Container(
          // width: 250, // Same fixed width for all boxes
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor1 : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.textBorderGreyColor),
          ),
          child: Center(
            child: Text(
              country['name']!,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }).toList();

    return Scaffold(
      appBar: CustomAppBar(
        leadingImgHeight: 20,
        leadingImgWidth: 20,
        leadingImagePath: ImageAsset.arrow_back_icon,
        actionText: 'Skip',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text("What would make your",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("experience better on travel?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  Text("You Can Choose Multiple",
                      style: TextStyle(
                          fontSize: 14, color: AppColors.greyTextColorColor)),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            Column(
              children: topCountryWidgets
                  .map((chip) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Align(
                          alignment: Alignment.center,
                          child: chip,
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextButton(
              text: 'Continue',
              onTap: () {
                Get.toNamed(RouteName.bottomNavScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
