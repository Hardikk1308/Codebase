import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/exam/exam_detail.dart';
import 'package:erp_school/view/screens/exam/exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class McqScreen extends StatefulWidget {
  final bool student;

  const McqScreen({super.key, this.student = false});

  @override
  State<McqScreen> createState() => _McqScreenState();
}

class _McqScreenState extends State<McqScreen> {
  final List<Map<String, dynamic>> leaveRequests = [
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Science',
      'description': 'Science Midterm Examination',
      'status': 'Approved',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Maths',
      'description': 'Multiple-Choice Questions for sessional Exams',
      'status': 'Rejected',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Maths',
      'description': 'Multiple-Choice Questions for sessional Exams',
      'status': 'Approved',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Science',
      'description': 'Science Midterm Examination',
      'status': 'Rejected',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Science',
      'description': 'Science Midterm Examination',
      'status': 'Rejected',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Science',
      'description': 'Science Midterm Examination',
      'status': 'Rejected',
    },
    {
      'dateRange': '18 Nov, 2024 - 20 Nov, 2024',
      'type': 'Science',
      'description': 'Science Midterm Examination',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.student
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Get.to(const ExamScreen());
              },
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            )
          : null,
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'online_exam'.tr,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: leaveRequests.length,
        itemBuilder: (context, index) {
          final leave = leaveRequests[index];
          return GestureDetector(
            onTap: () {
              Get.to(ExamDetailsScreen(
                student: widget.student ? false : true,
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [customBoxShadow()],
                borderRadius: BorderRadius.circular(8),
              ),
              // margin: EdgeInsets.only(bottom: 10),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
              // elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(leave['type'],
                        style: interMedium.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).disabledColor)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                size: 16,
                                color: Theme.of(context).primaryColor),
                            SizedBox(width: 8),
                            Text(leave['dateRange'],
                                style: interRegular.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'M.M : 60',
                            style: interMedium.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      leave['description'],
                      style: interMedium.copyWith(
                          fontSize: 12, color: Theme.of(context).hintColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
