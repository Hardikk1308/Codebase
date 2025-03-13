import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/screens/exam/exam_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
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
  final List<DropdownItem<int>> examTypeList = [
    DropdownItem(
        value: 1,
        child: Text(
          'Midterm',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Final Exam',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Practical Exam',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Weekly Test',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'exam'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                            dropdownStyle: DropdownStyle(
                                color: Get.theme.cardColor),
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
                                "select".tr,
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
                            dropdownStyle: DropdownStyle(
                                color: Get.theme.cardColor),
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
                                "select".tr,
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
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child:
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "select_subject".tr,
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
                          items: selectSubject,
                          dropdownStyle: DropdownStyle(
                              color: Get.theme.cardColor),
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
                              "select_subject".tr,
                              style: interMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                  color: Theme.of(context).disabledColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "submitted_on".tr,
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            height: 1.4,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.radiusSmall,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [BoxShadow()],
                          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: TextField(
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor,
                          ),
                          controller: _dateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Theme.of(context).primaryColor, // Selected date color
                                      onSurface: Colors.black, // Text color for dates
                                    ),
                                    dialogBackgroundColor: Colors.white, // Background color
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
                            _dateController.text = formattedDate;
                                                    },

                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Theme.of(context).disabledColor,
                            ),
                            border: InputBorder.none,
                            hintText: 'submitted_on'.tr,
                            contentPadding: const EdgeInsets.only(left: 12, top: 12),
                            hintStyle: interMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "maximum_marks".tr,
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
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [BoxShadow()],
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter_maximum_marks'.tr,
                              contentPadding: EdgeInsets.only(
                                left: 12,
                              ),
                              hintStyle: interMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                  color: Theme.of(context).disabledColor),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "total_questions".tr,
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
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [BoxShadow()],
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'total_questions'.tr,
                              contentPadding: EdgeInsets.only(
                                left: 12,
                              ),
                              hintStyle: interMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                  color: Theme.of(context).disabledColor),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "select_exam_type".tr,
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
                    items: examTypeList,
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
                        "select".tr,
                        style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "exam_title".tr,
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
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [BoxShadow()],
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'exam_title'.tr,
                        contentPadding: EdgeInsets.only(
                          left: 12,
                        ),
                        hintStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    )),
              ],
            ),
            50.h,
            CustomButton(
              title: 'next'.tr,
              fontSize: 16,
              onPressed: () {
                Get.to(ExamOptionScreen());
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
