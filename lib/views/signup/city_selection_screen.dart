// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tastebuds/controllers/location_controllers.dart';
// import 'package:tastebuds/resources/assets/image_assets.dart';
// import 'package:tastebuds/resources/colors/app_colors.dart';
// import 'package:tastebuds/resources/components/custom_app_bar.dart';
// import 'package:tastebuds/resources/components/custom_text_button.dart';

// class CitySelectionScreen extends StatelessWidget {
//   final LocationController controller = Get.find();

//   CitySelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         leadingImagePath: ImageAsset.arrow_back_icon,
//         onLeadingPressed: () {
//           controller.clearSelection();
//           Get.back();
//         },
//         actionText: 'Skip',
//         onActionPressed: () => Get.offAllNamed('/home'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Obx(() => Text(
//                   "Select city in ${controller.selectedCountry.value?.name.common ?? 'your country'}",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.primaryTextColor,
//                   ),
//                 )),
//             const SizedBox(height: 10),
//             Text(
//               "We'll customize your experience based on your location",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: AppColors.greyTextColorColor,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: Obx(() {
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
                
//                 if (controller.cities.isEmpty) {
//                   return Center(
//                     child: Text(
//                       'No cities found for ${controller.selectedCountry.value?.name.common ?? 'this country'}',
//                       style: TextStyle(color: AppColors.greyTextColorColor),
//                     ),
//                   );
//                 }
                
//                 return ListView.builder(
//                   itemCount: controller.cities.length,
//                   itemBuilder: (context, index) {
//                     final city = controller.cities[index];
//                     return ListTile(
//                       leading: const Icon(Icons.location_city),
//                       title: Text(city.locality ?? city.subAdministrativeArea ?? 'Unknown city'),
//                       subtitle: Text(city.administrativeArea ?? ''),
//                       onTap: () {
//                         controller.selectCity(city.locality ?? city.subAdministrativeArea ?? 'Unknown city');
//                         Get.toNamed('/appetite-selection');
//                       },
//                     );
//                   },
//                 );
//               }),
//             ),
//             Obx(() => controller.selectedCity.isNotEmpty
//                 ? CustomTextButton(
//                     text: 'Continue with ${controller.selectedCity.value}',
//                     onTap: () {
//                       Get.toNamed('/appetite-selection');
//                     },
//                   )
//                 : const SizedBox()),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  String? selectedCountry;
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredCountries = [];


  final List<Map<String, String>> cities = [
    {'name': 'Seoul', 'code': 'KR-11'}, // Special City
    {'name': 'Busan', 'code': 'KR-26'}, // Metropolitan city
    {'name': 'Daegu', 'code': 'KR-27'},
    {'name': 'Incheon', 'code': 'KR-28'},
    {'name': 'Gwangju', 'code': 'KR-29'},
    {'name': 'Daejeon', 'code': 'KR-30'},
    {'name': 'Ulsan', 'code': 'KR-31'},
    {'name': 'Sejong', 'code': 'KR‑50'}, // Special Self-Governing City
    // Provincial-level cities with over 500k pop:
    {'name': 'Suwon', 'code': 'KR-41111'},
    {'name': 'Changwon', 'code': 'KR-48111'},
    {'name': 'Goyang', 'code': 'KR-41281'},
    {'name': 'Seongnam', 'code': 'KR-41131'},
    {'name': 'Uijeongbu', 'code': 'KR-41211'},
    {'name': 'Bucheon', 'code': 'KR-41271'},
    {'name': 'Cheongju', 'code': 'KR-43111'},
    {'name': 'Jeonju', 'code': 'KR-45111'},
    {'name': 'Cheonan', 'code': 'KR-43181'},
  ];

  final List<String> topCountries = [
    'South Korea',
    'japan'
        'United Kingdom',
    'Vietnam'
        'indonesia',
    'USA',
    'Malaysia',
    'Taiwan',
    'France',
    'Spain',
    'Italy',
    'Denmark',
    'Portugal',
    'China',
    'Pakistan',
    'Trkey',
    'Newzeland',
    'Australia'
  ];

  void _showCountrySelectorModal(BuildContext context) {
    filteredCountries = [...cities]; // Clone full list at start

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext ctx) {
        return StatefulBuilder(builder: (ctx, modalSetState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Find City',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      modalSetState(() {
                        filteredCountries = cities
                            .where((country) => country['name']!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 400, // Set a fixed height for scroll
                  child: ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (ctx, index) {
                      final country = filteredCountries[index];
                      return ListTile(
                        title: Text(country['name']!),
                        onTap: () {
                          setState(() {
                            selectedCountry = country['name'];
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  final FocusNode searchFocus = FocusNode();

  bool isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    filteredCountries = [...cities];

    searchFocus.addListener(() {
      setState(() {
        isSearchFocused = searchFocus.hasFocus;
      });
    });
  }

  void _filterCountries(String value) {
    setState(() {
      filteredCountries = cities
          .where((country) =>
              country['name']!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _selectCountry(String name) {
    setState(() {
      selectedCountry = name;
      searchController.text = name;
      isSearchFocused = false;
      searchFocus.unfocus(); // close keyboard
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final halfScreenHeight = MediaQuery.of(context).size.height * 0.5;

    return Scaffold(
      appBar: CustomAppBar(
        leadingImgHeight: 20,
        leadingImgWidth: 20,
        leadingImagePath: ImageAsset.arrow_back_icon,
        actionText: 'Skip',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const Text("Which city do you spend",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("the time the most?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Find your city",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.greyTextColorColor)),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              TextField(
                controller: searchController,
                focusNode: searchFocus,
                onChanged: _filterCountries,
                readOnly: false,
                decoration: const InputDecoration(
                  labelText: 'Find City',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              if (isSearchFocused)
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      return ListTile(
                        title: Text(country['name']!),
                        onTap: () => _selectCountry(country['name']!),
                      );
                    },
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              CustomTextButton(
                  text: 'Continue',
                  onTap: () {
                    Get.toNamed(RouteName.appetiteSelectionScreen);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
