import 'package:flutter/material.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAsset.lodingIcon),
      ),
    );
  }
}
