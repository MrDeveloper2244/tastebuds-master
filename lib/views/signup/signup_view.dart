import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastebuds/controllers/signup_controller.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/components/custom_textfield.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';


class SignupScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingImagePath: 'assets/icons/arrow_back.png',
        leadingImgHeight: 15,
        leadingImgWidth: 15,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text('Pick a Username and \nPassword',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 70),

              CustomTextField(
                controller: controller.nameController,
                hintText: 'Choose a Username',
                hintTextColor: AppColors.textfieldColor,
                   boxColor: Colors.white,
                borderColor: AppColors.textBorderGreyColor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Username';
                  }
                  return null;},),

              CustomTextField(
                controller: controller.passwordController,
                hintText: 'Create a Password',
                     hintTextColor: AppColors.textfieldColor,

                                suffixIcon: Icon(Icons.remove_red_eye,color: AppColors.textfieldColor,),

                boxColor: Colors.white,
                borderColor: AppColors.textBorderGreyColor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
                CustomTextField(
                controller: controller.passwordController,
                hintText: 'Confirm Password',
                                hintTextColor: AppColors.textfieldColor,

                                suffixIcon: Icon(Icons.remove_red_eye, color: AppColors.textfieldColor,),

                boxColor: Colors.white,
                borderColor: AppColors.textBorderGreyColor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Confirm password';
                  }
                  return null;
                },
              ),
              CustomTextButton(
                text: "Create",
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.toNamed(RouteName.palleteShareScreen);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}



