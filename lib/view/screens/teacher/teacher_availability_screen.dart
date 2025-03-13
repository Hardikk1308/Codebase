import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/screens/teacher/teacher_leave_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeachersAvailabilityScreen extends StatefulWidget {
  const TeachersAvailabilityScreen({super.key});

  @override
  State<TeachersAvailabilityScreen> createState() =>
      _TeachersAvailabilityScreenState();
}

class _TeachersAvailabilityScreenState
    extends State<TeachersAvailabilityScreen> {
  int? selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).disabledColor,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'leave_request'.tr,
          style: interMedium.copyWith(
              color: Theme.of(context).disabledColor,
              fontSize: Dimensions.fontSizeDefault),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset(
              Images.teacherAvailability,
              height: 20,
              width: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      height: 39,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedIndex == 1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: selectedIndex == 1
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        "all_leave".tr,
                        style: interMedium.copyWith(
                          fontSize: 14,
                          color: selectedIndex == 1
                              ? Theme.of(context).cardColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedIndex == 2
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: selectedIndex == 2
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'sick'.tr,
                        style: interMedium.copyWith(
                          fontSize: 14,
                          color: selectedIndex == 2
                              ? Theme.of(context).cardColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedIndex == 3
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: selectedIndex == 3
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'unavailable'.tr,
                        style: interMedium.copyWith(
                          fontSize: 14,
                          color: selectedIndex == 3
                              ? Theme.of(context).cardColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _leaveCard(
                    type: index == 0 ? 'Sick Leave' : 'Personal Leave',
                    name: index == 0 ? 'Mr. John Smith' : 'Mr. Henna Jemsen',
                    date: '12 Nov, 2024 - 14 Nov, 2024',
                    status: index == 1 ? 'Rejected' : 'Pending',
                    isNew: index == 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leaveCard({
    required String type,
    required String name,
    required String date,
    required String status,
    required bool isNew,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(TeacherLeaveDetails());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
            boxShadow: [customBoxShadow()]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(type,
                          style: interMedium.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(name,
                      style: interMedium.copyWith(
                          fontSize: 14, color: Theme.of(context).hintColor)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 4),
                          Text(date,
                              style: interMedium.copyWith(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              isNew
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text('new',
                          style: interRegular.copyWith(
                              fontSize: 16,
                              color: Theme.of(context).disabledColor)),
                    )
                  : Text(
                      status,
                      style: interMedium.copyWith(
                        fontSize: 14,
                        color: status == 'Rejected'
                            ? Theme.of(context).canvasColor
                            : Theme.of(context).hoverColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
