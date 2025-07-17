import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:tastebuds/controllers/splash_controller.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with 
SingleTickerProviderStateMixin {
  SplashServices splashServices = SplashServices();

  final controller = Get.put(SplashController());






  @override
  Widget build(BuildContext context) {
    return 
//     Scaffold(
//       backgroundColor: Colors.white,
//   body: Column(

//     children: [
//       Expanded(
//         child: Center(
//           child: Image.asset(
//             ImageAsset.icon,
      
//           ),
//         ),
//       ),
//     ],
//   ),

// );

Scaffold(
      body: Center(
        child: Image.asset(ImageAsset.lodingIcon),
      ),
    );
}
}
