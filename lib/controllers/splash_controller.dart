import 'dart:async';

import 'package:get/get.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Timer(Duration(seconds: 10), () {
      Get.offNamed(RouteName.loginSelectionScreen);
    });
  }
}
