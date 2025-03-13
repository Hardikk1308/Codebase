import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/screens/student/student_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDetailWidget extends StatelessWidget {
  const StudentDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [customBoxShadow()],
        borderRadius:
        BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Class IX th , Section B".tr,
                  style: interMedium.copyWith(
                      fontSize: 16,
                      height: 1.4,
                      color: Theme.of(context).disabledColor),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Image.asset(Images.studentAttendance,height: 20,width: 20,),
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Students : 193".tr,
                      style: interRegular.copyWith(
                          fontSize: 14,
                          height: 1.4,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
              onTap: (){
                Get.to(const StudentDetailScreen());
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "view_details".tr,
                style: interMedium.copyWith(
                    fontSize: 14,
                    height: 1.4,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
