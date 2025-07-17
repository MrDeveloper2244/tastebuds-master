// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tastebuds/controllers/location_controllers.dart';
// import 'package:tastebuds/resources/assets/image_assets.dart';
// import 'package:tastebuds/resources/colors/app_colors.dart';
// import 'package:tastebuds/resources/components/custom_app_bar.dart';
// import 'package:tastebuds/resources/components/custom_text_button.dart';

// class CountrySelectionScreen extends StatelessWidget {
//   final LocationController controller = Get.put(LocationController());

//   CountrySelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         leadingImagePath: ImageAsset.arrow_back_icon,
//         actionText: 'Skip',
//         onActionPressed: () => Get.offAllNamed('/home'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Text(
//               "Select your country",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primaryTextColor,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               "We'll show you cities available in your country",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: AppColors.greyTextColorColor,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: Obx(() {
//                 if (controller.isLoading.value && controller.countries.isEmpty) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
                
//                 return ListView.builder(
//                   itemCount: controller.countries.length,
//                   itemBuilder: (context, index) {
//                     final country = controller.countries[index];
//                     return ListTile(
//                       leading: Text(country.emoji, style: const TextStyle(fontSize: 24)),
//                       title: Text(country.name.common),
//                       subtitle: Text(country.name.official),
//                       onTap: () {
//                         controller.selectCountry(country);
//                         Get.toNamed('/city-selection');
//                       },
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

