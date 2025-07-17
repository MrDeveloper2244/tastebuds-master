import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/assets/image_assets.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';

class PalleteShareScreen extends StatelessWidget {
  const PalleteShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor1,
      body: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
AppColors.primaryColor1,              Color(0xFFebf7ff), // Light blue at bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You're All Set!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white ) ,),
              Gap(20),  
                          Text("Would you share your pallete ",style: TextStyle(fontSize: 16, color: Colors.white )),
                          Gap(5),
                          Text("for personal curation?",style: TextStyle(fontSize: 16, color: Colors.white )),
        SizedBox(height: MediaQuery.of(context).size.height*.1,),
        
        
        // SizedBox(height: MediaQuery.of(context).size.height*.1,),
        Stack(children: [
        Image.asset(
          // width: 134,
          // height: 130,
          ImageAsset.bearImage
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350),
          child: GestureDetector(
            onTap: (){ 
Get.toNamed(RouteName.citySelectionScreen);

            },
            child: Container(
              height: 50,
              // width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primaryColor1)),
              child: Center(
                child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 20 )),
              ),
            ),
          ),
        ),
        ],),
         
              CustomTextButton(text: 'Skip',
            backgroundColor: Colors.white,
            textColor:AppColors.primaryColor1, onTap: () {  },
            borderColor: AppColors.primaryColor1,)
        
              ],
          )),),
      ),);}}



  