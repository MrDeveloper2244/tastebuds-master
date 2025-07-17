import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class SplashServices {
  void islogin() async {
    Timer(Duration(seconds: 4), () {
      
      Get.offNamed(RouteName.loginScreen);
    });
  }
}
