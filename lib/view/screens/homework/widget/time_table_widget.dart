import 'package:erp_school/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/utils/styles.dart';

import 'package:get/get.dart';

class TimeTableWidget extends StatelessWidget {
  final bool lunch;
  final String subject;
  final String teacher;
  final String timeslot;
  final String roomNumber;
  final String startTime;
  final String endTime;
  final String className;
  final String type;
  const TimeTableWidget(
      {super.key,
      this.lunch = false,
      this.subject = "",
      this.teacher = "",
      this.timeslot = "",
      this.roomNumber = "",
      this.startTime = "",
      this.endTime = "",
      this.className = "",
      this.type = ""});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white70, // Need to change here
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 50,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
              height: height*0.09,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: lunch
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: !lunch
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: Text(
                                "Subject : ",
                                style: interMedium.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                subject,
                                style: interSemiBold.copyWith(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Center(
                              child: Text(
                                type == STUDENT
                                    ? "Teacher : "
                                    : "Class Name : ",
                                style: interMedium.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).disabledColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                type == STUDENT ? teacher : className,
                                style: interSemiBold.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Column()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  Center(
                    child: Text(
                      !lunch ? "Timings : " : 'Lunch',
                      style: interMedium.copyWith(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      type == STUDENT ? timeslot : "$startTime - $endTime",
                      style: interMedium.copyWith(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ] //Children
                    ),
                // 5.h,
                Row(children: [
                  Center(
                    child: Text(
                      !lunch ? "Room No :" : 'Lunch',
                      style: interMedium.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      !lunch
                          ? " ${roomNumber.toString().split(" ").last}"
                          : 'Lunch',
                      style: interMedium.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ], //children
      ),
    );
  }
}
