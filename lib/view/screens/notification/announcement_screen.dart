import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:intl/intl.dart';
class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
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
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'Announcement'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Column(
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
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "title".tr,
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
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter_title'.tr,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        hintStyle:interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${"enter_description".tr}',
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
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: const [BoxShadow()],
                      borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter_description_here'.tr,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        hintStyle:interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    )
                ),
              ],
            ),
            const SizedBox(height: 40,),
            CustomButton(
              title: 'submit'.tr,
              fontSize: 16,
              onPressed: () {
                Get.off(const NotificationScreen(notification: true,
                    userType: 'teacher'));
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
