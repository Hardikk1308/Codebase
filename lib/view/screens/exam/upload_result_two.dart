import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/screens/exam/widget/upload_result_widget.dart';
import 'package:erp_school/view/screens/teacher/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadResultTwoScreen extends StatelessWidget {
  const UploadResultTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'upload_result'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            UploadResultWidget(),
            UploadResultWidget(),
            UploadResultWidget(),
            UploadResultWidget(),
            UploadResultWidget(),
            UploadResultWidget(),
            UploadResultWidget(),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'submit_result'.tr,
              fontSize: 16,
              onPressed: () {
                Get.to(TeacherScreen());
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

