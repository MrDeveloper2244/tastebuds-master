import 'package:flutter/material.dart';
import 'package:tastebuds/resources/colors/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.primaryColor1,
    this.textColor = Colors.white,
    this.borderColor=Colors.white,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          // width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: borderColor)),
          child: Center(
            child: Text(text, style: TextStyle(color: textColor, fontSize: 20 )),
          ),
        ),
      ),
    );
  }
}
