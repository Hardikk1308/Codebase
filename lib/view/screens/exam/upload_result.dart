import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/screens/exam/upload_result_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadResultScreen extends StatefulWidget {
  const UploadResultScreen({super.key});

  @override
  State<UploadResultScreen> createState() => _UploadResultScreenState();
}

class _UploadResultScreenState extends State<UploadResultScreen> {
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
  final List<DropdownItem<int>> leaveType = [
    DropdownItem(
        value: 1,
        child: Text(
          'Sick Leave',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Casual Leave',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Maternity/Paternity Leave',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Emergency Leave ',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];

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
            SizedBox(height: 25,),
            Column(
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
                        color: Get.theme.secondaryHeaderColor),
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
            SizedBox(height: 20,),
            Column(
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
                        color: Get.theme.secondaryHeaderColor),
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
            SizedBox(height: 20,),
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
                        color: Get.theme.secondaryHeaderColor),
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
            SizedBox(height: 20,),
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
                    items: leaveType,
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
                        "select_exam_type".tr,
                        style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),
            CustomButton(
              title: 'next'.tr,
              fontSize: 16,
              onPressed: () {
                Get.to(const UploadResultTwoScreen());
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
