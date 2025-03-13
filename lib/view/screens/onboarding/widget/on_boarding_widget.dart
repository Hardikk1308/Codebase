import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWidget extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final PageController controller;
  final Color? colortext;

  const OnBoardingWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.controller, required this.colortext});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color:widget.colortext,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * 0.1,),
          Image.asset(
            widget.image,
            height: Get.height * 0.35,
            width: Get.width,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  dotHeight: 6,
                  activeDotColor: Theme.of(context).disabledColor,
                  dotWidth: 10,
                ),
                count: 3,
                controller: widget.controller),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            widget.title,
            style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraLarge,
              color: Theme.of(context).disabledColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: interRegular.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: Dimensions.fontSizeExtraSmall),
          ),
        ],
      ),
    );
  }
}
