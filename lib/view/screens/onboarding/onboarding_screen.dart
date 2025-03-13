import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/screens/module/select_school_screen.dart';
import 'package:erp_school/view/screens/onboarding/widget/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  int currentPage = 0;

  final List<Color> backgroundColors = [
    Get.theme.colorScheme.onPrimary,
    Get.theme.colorScheme.primary,
    Get.theme.colorScheme.secondary
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: backgroundColors[currentPage],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.90,
                child: Stack(
                  children: [
                    SizedBox(
                      height: Get.height * 0.85,
                      child: PageView(
                        controller: _controller,
                        onPageChanged: (index) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              currentPage = index;
                              onLastPage = (index == 2);
                            });
                          });
                        },
                        children: [
                          OnBoardingWidget(
                           colortext:  backgroundColors[currentPage],
                            image: Images.onBoardingPng,
                            title: 'onboarding_title'.tr,
                            subtitle: 'onboarding_sub_title'.tr,
                            controller: _controller,
                          ),
                          OnBoardingWidget(
                            colortext:  backgroundColors[currentPage],
                            image: Images.onboardingTwoPng,
                            title: 'onboarding_title_two'.tr,
                            subtitle: 'onboarding_sub_title_two'.tr,
                            controller: _controller,
                          ),
                          OnBoardingWidget(
                            colortext:  backgroundColors[currentPage],
                            image: Images.onBoardingThreePng,
                            title: 'onboarding_title_three'.tr,
                            subtitle: 'onboarding_sub_title_three'.tr,
                            controller: _controller,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: Get.width * 0.2,
                      left: Get.width * 0.2,
                      bottom: Get.width * 0.030,
                      child:
                      CustomButton(
                          height: 55,
                          color: true,
                          radius: 30,
                          title: 'next'.tr,
                          onPressed: () {
                            if (onLastPage) {
                              Get.to(() => const SelectSchoolScreen());
                            } else {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.to(SelectSchoolScreen());
                },
                child: Text(
                  'skip'.tr,
                  style: interRegular.copyWith(
                      color: Theme.of(context).hintColor, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }
}
