import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/base/custom_textfield.dart';
import 'package:erp_school/view/screens/teacher/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamOptionScreen extends StatelessWidget {
  const ExamOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownItem<int>> dmTypeList = [];
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'exam'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExamTextField(
                title: 'enter_question'.tr, hintText: 'enter_question'.tr),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ExamTextField(
                        title: ''.tr, hintText: 'enter_option'.tr)),
                15.w,
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    Images.deleteOption,
                    height: 30,
                    width: 30,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ExamTextField(
                        title: ''.tr, hintText: 'enter_option'.tr)),
                15.w,
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    Images.deleteOption,
                    height: 30,
                    width: 30,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ExamTextField(
                        title: ''.tr, hintText: 'enter_option'.tr)),
                15.w,
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    Images.deleteOption,
                    height: 30,
                    width: 30,
                  ),
                )
              ],
            ),
            20.h,
            Container(
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8)

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.addOptionPng,
                    height: 17,
                    width: 17,
                    color: Theme.of(context).disabledColor,
                  ),
                  10.w,
                  Text('add_new_option'.tr,style: interRegular.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor
                  ),)
                ],
              ),
            ),
            20.h,
            Row(
              children: [
                Image.asset(
                  Images.addOptionPng,
                  height: 32,
                  width: 32,
                ),
                10.w,
                Text('add_more_question'.tr,style: interMedium.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).disabledColor
                ),)
              ],
            ),
            50.h,
            CustomButton(
              title: 'upload_exam'.tr,
              fontSize: 16,
              onPressed: () {
                Get.to(const TeacherScreen());
              },
              border: false,
              radius: 50,
              color: true,
            ),
          ],
        ),
      ),
    );
  }
}
