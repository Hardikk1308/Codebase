import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/student/widget/student_detail_children_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'student_details'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [customBoxShadow()],
                borderRadius:
                BorderRadius.circular(8),),
              child: Row(
                children: [
                  Icon(Icons.search,color: Theme.of(context).hintColor,),
                  SizedBox(width: 10,),
                  Text('search_by_name'.tr,style: interRegular.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,

                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
              return StudentDetailChildrenWidget();
            })
          ],
        ),
      ),
    );
  }
}

