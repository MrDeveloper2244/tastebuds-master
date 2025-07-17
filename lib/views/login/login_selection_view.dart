import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_image_and_text_button.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';
import 'package:tastebuds/resources/widgets/login_animation_widget.dart';

class LoginSelectionView extends StatelessWidget {
  const LoginSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children:[
// Image.asset(ImageAsset.icon),
                    ]),
          Center(child: Image.asset(ImageAsset.loginAnimation3),
),
            SizedBox(height: MediaQuery.of(context).size.height*.3,),
            AuthButton(
              text: 'Continue with Google',
              imagePath: ImageAsset.google_icon,
                backgroundColor: Colors.white,
              textColor: Colors.black,
                            borderColor: AppColors.textBorderGreyColor,

              onTap: () {
                // your Google login logic
              },
            ),
                AuthButton(
              text: 'Continue with Apple',
              imagePath: ImageAsset.apple_icon_black,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderColor: AppColors.textBorderGreyColor,
              onTap: () {
            
              },
            ),
            
           
            
                  CustomTextButton(text: "Login", onTap: (){
          
                                  Get.toNamed(RouteName.loginScreen);
      
            },
            textColor: AppColors.primarywhiteColor,
            backgroundColor:AppColors.primaryColor1 ,
             borderColor: AppColors.primaryColor1
            ),
            // CustomTextButton(text: "Login", onTap: (){},
            // textColor: Colors.black,
            // backgroundColor: Colors.white,
            // borderColor: Colors.grey,),
  SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(RouteName.createAccountScreen);
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't Have Account Yet? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Signup",
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
        ));
  }
}
