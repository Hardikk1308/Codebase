import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_textfield.dart';
import 'package:erp_school/view/screens/student/event_calender_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
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
        title: 'add_event'.tr,
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
                    child: Customfield(
                      readonly: true,
                        controller: _dateController,
                        suffixIcon: GestureDetector(
                          onTap: ()async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Theme.of(context)
                                          .primaryColor, // Selected date color
                                      onSurface: Colors.black, // Text color for dates
                                    ),
                                    dialogBackgroundColor:
                                    Colors.white, // Background color
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate!);
                            _dateController.text = formattedDate;
                                                    },
                          child: Icon(
                            Icons.calendar_month,
                            color: Theme.of(context).disabledColor,
                          ),
                        ) ,
                        title: 'submitted_on'.tr, hintText: 'submitted_on'.tr)),
                SizedBox(width: 15,),
                Expanded(
                    child: Customfield(
                        readonly: true,
                        controller: _dateController,
                        suffixIcon: GestureDetector(
                          onTap: ()async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Theme.of(context)
                                          .primaryColor, // Selected date color
                                      onSurface: Colors.black, // Text color for dates
                                    ),
                                    dialogBackgroundColor:
                                    Colors.white, // Background color
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate!);
                            _dateController.text = formattedDate;
                                                    },
                          child: Icon(
                            Icons.calendar_month,
                            color: Theme.of(context).disabledColor,
                          ),
                        ) ,
                        title: 'end_date'.tr, hintText: 'end_date'.tr)),
              ],
            ),
            Customfield(
              title: 'event_title'.tr,
              hintText: 'enter_event_title'.tr,
            ),
            Customfield(
              height: 100,
              maxLines: 5,
              title: 'event_description'.tr,
              hintText: 'enter_event_description'.tr,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'submit'.tr,
              fontSize: 16,
              onPressed: () {
                Get.off( EventsCalendarScreen(eventCalender: true,));
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
