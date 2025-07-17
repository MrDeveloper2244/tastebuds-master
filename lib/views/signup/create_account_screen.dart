import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_app_bar.dart';
import 'package:tastebuds/resources/components/custom_image_and_text_button.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        leadingImagePath: 'assets/icons/arrow_back.png',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Image.asset(
              //     ImageAsset.tastebuds_icon,

              //     // height: 50,
              //   ),
              // ),
              const SizedBox(height: 20),
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Gap(70),
              Row(
                children: [
                  Container(
                    height: 47,
                    width: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: AppColors.textBorderGreyColor),

                    ),
                    child: const Center(
                      child: Text("+82"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:  EdgeInsets.symmetric(horizontal: 12),
                      child:  Center(
                        child: TextField(
                          // decoration: InputDecoration(
                          //   hintText: "Phone number", 
                          //   border: InputBorder.none,
                            
                          // ),
                           decoration: InputDecoration(
          
          hintText: "Phone number",
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textBorderGreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textBorderGreyColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textBorderGreyColor),
          ),
        ),
                          
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextButton(
                text: 'Send Code',
                onTap: () {
                  Get.toNamed(RouteName.enterDigitScreen);
                },
                borderColor: AppColors.primaryColor1,
              ),
              // const SizedBox(height: 20),
              // Row(
              //   children: const [
              //     Expanded(child: Divider()),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 12),
              //       child: Text("OR"),
              //     ),
              //     Expanded(child: Divider()),
              //   ],
              // ),
              // const SizedBox(height: 20),
              // AuthButton(
              //   text: "Continue with Google",
              //   imagePath: ImageAsset.google_icon,
              //   backgroundColor: Colors.white,
              //   textColor: Colors.black,
              //   borderColor: Colors.grey,
              //   onTap: () {},
              // ),
              // const SizedBox(height: 12),
              // AuthButton(
              //   text: "Continue with Apple",
              //   imagePath: ImageAsset.apple_icon_black,
              //   backgroundColor: Colors.white,
              //   textColor: Colors.black,
              //   borderColor: Colors.grey,
              //   onTap: () {},
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       Get.toNamed('/login');
              //     },
              //     child: const Text.rich(
              //       TextSpan(
              //         text: "Already have an account? ",
              //         style: TextStyle(color: Colors.grey),
              //         children: [
              //           TextSpan(
              //             text: "Login",
              //             style: TextStyle(
              //                 color: Colors.black, fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),


                Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(RouteName.loginScreen);
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already Have An Account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Login",
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
