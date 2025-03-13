import 'package:erp_school/view/screens/leaves/request_leaves.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeaveFormScreen extends StatefulWidget {
  const LeaveFormScreen({super.key});

  @override
  State<LeaveFormScreen> createState() => _LeaveFormScreenState();
}

class _LeaveFormScreenState extends State<LeaveFormScreen> {
  bool isHalfDayLeave = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();

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
        title: 'leave_form'.tr,
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
                          "start_date".tr,
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: TextField(
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor,
                          ),
                          controller: _startDateController,
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
                                      primary: Theme.of(context)
                                          .primaryColor, // Selected date color
                                      onSurface:
                                          Colors.black, // Text color for dates
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
                            _startDateController.text = formattedDate;
                                                    },
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Theme.of(context).disabledColor,
                            ),
                            border: InputBorder.none,
                            hintText: 'submitted_on'.tr,
                            contentPadding:
                                const EdgeInsets.only(left: 12, top: 12),
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
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "end_date".tr,
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
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
                                      primary: Theme.of(context)
                                          .primaryColor, // Selected date color
                                      onSurface:
                                          Colors.black, // Text color for dates
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
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Theme.of(context).disabledColor,
                            ),
                            border: InputBorder.none,
                            hintText: 'submitted_on'.tr,
                            contentPadding:
                                const EdgeInsets.only(left: 12, top: 12),
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
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "select_leave_type".tr,
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
                    dropdownStyle: DropdownStyle(color: Get.theme.cardColor),
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
                        "select_type".tr,
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
                    '${"reason_for_leave".tr}*',
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
                      boxShadow: [BoxShadow()],
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter_reason'.tr,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        hintStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Theme.of(context).hintColor,
                  value: true,
                  onChanged: (bool? value) {
                    setState(() {
                      isHalfDayLeave = value ?? false;
                    });
                  },
                ),
                Text(
                  'is_half_day'.tr,
                  style: interMedium.copyWith(
                      fontSize: 16,
                      color: Theme.of(context)
                          .disabledColor), // Adjust font size as needed
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      'cancel'.tr,
                      style: interMedium.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ),
                ),
                15.w,
                Expanded(
                  child: CustomButton(
                      height: 50,
                      fontSize: 16,
                      color: true,
                      radius: 50,
                      title: 'apply'.tr,
                      onPressed: () {
                        Get.to(RequestedLeavesScreen());
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
