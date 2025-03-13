import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/student/widget/student_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'student_screen'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "view_students".tr,
                style: interMedium.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    height: 1.4,
                    color: Theme.of(context).disabledColor),
              ),
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "access_manage".tr,
                style: interMedium.copyWith(
                    fontSize: 14,
                    height: 1.4,
                    color: Theme.of(context).hintColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),
        StudentDetailWidget(),

          ],
        ),
      ),
    );
  }
}

