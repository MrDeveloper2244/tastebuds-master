import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tastebuds/resources/components/custom_button.dart';
import 'package:tastebuds/resources/components/custom_text_button.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';
import 'package:tastebuds/resources/widgets/otp_widget.dart';

class EnterDigitScreen extends StatelessWidget {
   EnterDigitScreen({super.key});
TextEditingController countryCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
        
        children: [
        
          Gap(100),
           const Text("Enter the 4 digit code", style: TextStyle(fontSize: 25)),
        const SizedBox(height: 20),
        OTPInputWidget(
          onCompleted: (otp) {
            print("Entered OTP: $otp");
            // Add validation or API call
          },
        ),
        Gap(50),
          CustomTextButton(text: 'Verify', 
           onTap: () {  
                              Get.toNamed(RouteName.signupScreen);

           },)
        ],
          
        ),
      ),
    );
  }
  Widget countryCodeTextField({
  required TextEditingController controller,
  String hint = "",
  double height = 48,
  double width = 70,
  Color? backgroundColor,
  double borderRadius = 8,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}
}
