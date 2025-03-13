import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/screens/parents/parents_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';

class AddTimeTableScreen extends StatefulWidget {
  const AddTimeTableScreen({super.key});

  @override
  State<AddTimeTableScreen> createState() => _AddTimeTableScreenState();
}

class _AddTimeTableScreenState extends State<AddTimeTableScreen> {
  int? selectedIndex = 1;

  final List<DropdownItem<int>> selectClass = [
    DropdownItem(
        value: 1,
        child: Text(
          'Class 1',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Class 2',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Class 3',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Class 4',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 5,
        child: Text(
          'Class 5',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];
  final List<DropdownItem<int>> selectSection = [
    DropdownItem(
        value: 1,
        child: Text(
          'Section A',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Section B',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Section C',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Section D',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 5,
        child: Text(
          'Section E',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];
  final List<DropdownItem<int>> selectSubject = [
    DropdownItem(
        value: 1,
        child: Text(
          'Science',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Mathematics',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Physics',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Chemistry',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 5,
        child: Text(
          'Arts',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];
  final List<DropdownItem<int>> selectTeacher = [
    DropdownItem(
        value: 1,
        child: Text(
          'Mr. John Smith',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Ms. Emily Davis',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Physics',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Mr. David Brown',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 5,
        child: Text(
          ' Dr. Michael Garcia',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 6,
        child: Text(
          ' Mr. Ethan Moore ',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];
  List<Map<String, String>> lectures = [
    {"lecture": "Lecture 1", "time": "08:45 To 09:30"},
    {"lecture": "Lecture 2", "time": "09:35 To 10:20"},
    {"lecture": "Lecture 3", "time": "10:25 To 11:10"},
    {"lecture": "Lecture 4", "time": "11:15 To 12:00"},
    {"lecture": "Lecture 5", "time": "12:05 To 12:50"},
    {"lecture": "Lecture 6", "time": "01:00 To 01:45"},
    {"lecture": "Lecture 7", "time": "01:50 To 02:35"},
    {"lecture": "Lecture 8", "time": "02:40 To 03:25"},
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> lectureContainers = lectures.map((lecture) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
          boxShadow: [customBoxShadow()],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      lecture["lecture"]!,
                      style: interMedium.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    // Text(
                    //   lecture["lecture"]!,
                    //   style: interMedium.copyWith(
                    //     fontSize: 16,
                    //     color: Theme.of(context).disabledColor,
                    //   ),
                    // ),
                  ],
                ),
                Text(
                  lecture["time"]!,
                  style: interMedium.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "select_subject".tr,
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            height: 1.4,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.radiusSmall),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [BoxShadow()],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: CustomDropdown<int>(
                          onChange: (int? value, int index) {},
                          items: selectSubject,
                          dropdownStyle:
                              DropdownStyle(color: Get.theme.cardColor),
                          itemTextStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).hintColor,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).hintColor,
                          ),
                          dropdownButtonStyle: DropdownButtonStyle(
                            height: 55,
                            primaryColor: Theme.of(context).primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSMALL,
                            ),
                            child: Text(
                              "select_subject".tr,
                              style: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "select_teacher".tr,
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            height: 1.4,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.radiusSmall),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [BoxShadow()],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: CustomDropdown<int>(
                          onChange: (int? value, int index) {},
                          items: selectTeacher,
                          dropdownStyle:
                              DropdownStyle(color: Get.theme.cardColor),
                          itemTextStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).hintColor,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).hintColor,
                          ),
                          dropdownButtonStyle: DropdownButtonStyle(
                            height: 55,
                            primaryColor: Theme.of(context).primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSMALL,
                            ),
                            child: Text(
                              "select_teacher".tr,
                              style: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    }).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'add_time_table'.tr,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(6, (index) {
                  List<String> days = [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                  ];

                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index + 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: selectedIndex == index + 1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.surface,
                          border: Border.all(
                            color: selectedIndex == index + 1
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          days[index],
                          style: interMedium.copyWith(
                            fontSize: 14,
                            color: selectedIndex == index + 1
                                ? Theme.of(context).cardColor
                                : Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "select_class".tr,
                        style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            height: 1.4,
                            color: Theme.of(context).disabledColor),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.radiusSmall,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [BoxShadow()],
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                      child: CustomDropdown<int>(
                        onChange: (int? value, int index) {},
                        items: selectClass,
                        dropdownStyle:
                            DropdownStyle(color: Get.theme.cardColor),
                        itemTextStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).hintColor),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).hintColor,
                        ),
                        dropdownButtonStyle: DropdownButtonStyle(
                          height: 55,
                          primaryColor: Theme.of(context).primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSMALL),
                          child: Text(
                            "select_class".tr,
                            style: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: Theme.of(context).disabledColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "select_section".tr,
                        style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            height: 1.4,
                            color: Theme.of(context).disabledColor),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.radiusSmall,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [BoxShadow()],
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                      child: CustomDropdown<int>(
                        onChange: (int? value, int index) {},
                        items: selectSection,
                        dropdownStyle:
                            DropdownStyle(color: Get.theme.cardColor),
                        itemTextStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).hintColor),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).hintColor,
                        ),
                        dropdownButtonStyle: DropdownButtonStyle(
                          height: 55,
                          primaryColor: Theme.of(context).primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSMALL),
                          child: Text(
                            "select_section".tr,
                            style: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: Theme.of(context).disabledColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 500,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 2),
                children: lectureContainers,
              ),
            ),
            40.h,
            CustomButton(
                height: 50,
                fontSize: 16,
                color: true,
                radius: 50,
                title: 'save_timetable'.tr,
                onPressed: () {
                  Get.off(const ParentsScreen());
                }),
          ],
        ),
      ),
    );
  }
}
