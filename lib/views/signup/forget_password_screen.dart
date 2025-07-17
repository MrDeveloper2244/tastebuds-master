import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tastebuds/controllers/signup_controller.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/components/custom_textfield.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';
class ForgetPasswordView extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingImagePath: 'assets/icons/arrow_back.png',
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
                  Text('Please Enter Your Account \nID',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 110),

              CustomTextField(
                controller: controller.nameController,
                hintText: 'PLease Enter Your ID',
               hintTextColor: AppColors.textfieldColor,
                   boxColor: Colors.white,
                borderColor: AppColors.textBorderGreyColor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),

            

              CustomTextButton(
                text: "Continue",
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.toNamed(RouteName.createAccountScreen);
                  }
                },
              ),
                  Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Forgot Password? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Reset",
                          style: TextStyle(
                              color:AppColors.primaryColor1, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
