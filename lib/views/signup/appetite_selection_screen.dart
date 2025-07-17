import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class AppetiteSelectionScreen extends StatefulWidget {
  @override
  _AppetiteSelectionScreenState createState() =>
      _AppetiteSelectionScreenState();
}

class _AppetiteSelectionScreenState extends State<AppetiteSelectionScreen> {
  String? selectedAppetite;
  // TextEditingController searchController = TextEditingController();
  // List<Map<String, String>> filteredCountries = [];

  final List<Map<String, String>> appetites = [
    {
      "name": "Korean",
    },
    {
      "name": "Chinese",
    },
    {
      "name": "American",
    },
    {
      "name": "Japanese",
    },
    {
      "name": "South East Asian",
    },
    {
      "name": "French",
    },
    {
      "name": "Italian",
    },
    {
      "name": "Spain",
    },
    {
      "name": "Hotpot",
    },
    {
      "name": "Seafood",
    },
    {
      "name": "Street Food",
    },
    {
      "name": "Steak&BBQ",
    },
    {
      "name": "Fast Food",
    },
    {
      "name": "Beer",
    },
    {
      "name": "Drinks",
    },
  ];

  final List<String> topAppetiteList = [
    'Korean',
    'Chinese'
        'American',
    'Japanese'
        'South East Asian',
    'French',
    'Italian',
    'Spain',
    'Hotpot',
    'Seafood',
    'Steak&BBQ',
    'Street Food',
    'Fast Food',
    'Dining',
    'Spanish',
    'Drinks',
  ];

  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    final topCountryWidgets = appetites
        .where((c) => topAppetiteList.contains(c['name']))
        .map((country) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedAppetite = country['name'];
                });
                Get.toNamed(RouteName.weekMealSelectionScreen);
              },
              child: Chip(
                label: Text(country['name']!),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: AppColors.selectionBoxBorderColor)),
                backgroundColor: selectedAppetite == country['name']
                    ? AppColors.primaryColor1
                    : AppColors.primarywhiteColor,
                labelStyle: TextStyle(
                    color: selectedAppetite == country['name']
                        ? Colors.white
                        : Colors.black),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: CustomAppBar(
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
                  const Text("What would you eat",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("more than 3 times a week?",
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: topCountryWidgets,
            ),
            const SizedBox(height: 30),
            Text(
              selectedAppetite == null
                  ? "No country selected"
                  : "Selected: $selectedAppetite",
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            CustomTextButton(
              text: 'Continue',
              onTap: () {
                Get.toNamed(RouteName.weekMealSelectionScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
