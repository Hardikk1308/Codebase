import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDetailChildrenWidget extends StatelessWidget {
  const StudentDetailChildrenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [customBoxShadow()],
        borderRadius:
        BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Images.childImage,height: 70,width: 70,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ruhi Sharma".tr,
                      style: interMedium.copyWith(
                          fontSize: 16,
                          height: 1.4,
                          color: Theme.of(context).disabledColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "25".tr,
                      style: interMedium.copyWith(
                          fontSize: 14,
                          height: 1.4,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "+91 8882871801".tr,
                      style: interMedium.copyWith(
                          fontSize: 14,
                          height: 1.4,
                          color: Theme.of(context).hintColor),
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ],
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "S/O Mr. Ashwani sharma & Mrs. Sushimta sharma".tr,
              style: interMedium.copyWith(
                  fontSize: 12,
                  height: 1.4,
                  color: Theme.of(context).hintColor),
            ),
          ),
        ],
      ),

    );
  }
}
