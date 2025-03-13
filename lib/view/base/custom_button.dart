import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double fontSize;
  final double height;
  final double radius;
  final bool cancel;
  final bool color;
  final Color? buttonColor;
  final bool border;
  final bool trackOrder;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 18,
      this.height = 55,
      this.cancel = false,
      this.radius = 10,
      this.color = false,
      this.trackOrder = false,
      this.border = false,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
              color: border ? Theme.of(context).primaryColor : Colors.transparent),
          color: color ? Theme.of(context).primaryColor : buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: trackOrder ? 0 : Dimensions.paddingSizeSmallExtra),
            child: Text(
              title,
              style: interMedium.copyWith(
                  color: border ? Get.theme.primaryColor : Get.theme.cardColor,
                  fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
