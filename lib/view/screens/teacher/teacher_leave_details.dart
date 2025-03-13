import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/screens/parents/parents_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TeacherLeaveDetails extends StatefulWidget {
  const TeacherLeaveDetails({super.key});

  @override
  State<TeacherLeaveDetails> createState() => _TeacherLeaveDetailsState();
}

class _TeacherLeaveDetailsState extends State<TeacherLeaveDetails> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(title: 'leave_detail'.tr),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'applicant_detail'.tr +':',
                style: interMedium.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).disabledColor
                )
              ),
              SizedBox(height: 8),
              buildDetailRow('name'.tr, 'Mr. Sri Kamdev',context),
              buildDetailRow('designation'.tr, 'Mathematics Teacher',context),
              buildDetailRow('class_Section_handled'.tr, 'Class 10A, 9B',context),
              SizedBox(height: 16),
              Text(
                'leave_details'.tr,
                style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 16
                ),
              ),
              SizedBox(height: 8),
              buildDetailRow('leave_type'.tr, 'Mr. Sri Kamdev',context),
              buildDetailRow('start_date'.tr, '12 Nov, 2024',context),
              buildDetailRow('end_date'.tr, '16 Nov, 2024',context),
              buildDetailRow('duration'.tr, '3 Days',context),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reason for Leave'.tr,
                    style: interMedium.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).disabledColor),
                  ),
                  10.h,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [customBoxShadow()],
                        color: Theme.of(context).cardColor),
                    height: 100,
                    child: TextField(
                      cursorColor: Theme.of(context).primaryColor,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).cardColor,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        hintText: 'Family commitment requiring out-of-town travel'.tr,
                        hintStyle: interRegular.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).hintColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('Is Substitute Required',style:  interRegular.copyWith(
                      color: Theme.of(context).disabledColor,
                      fontSize: 14
                  ),),
                ],
              ),
              SizedBox(height: 8),
             ListView.builder(
               shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: 8,
                 itemBuilder: (context,index){
               return  Padding(
                 padding: const EdgeInsets.symmetric(vertical: 12),
                 child: Row(
                   children: [
                     Expanded(
                         child: Column(
                           children: [
                             Align(
                               alignment: Alignment.topLeft,
                               child: Row(
                                 children: [
                                   Text(
                                     "Leave ".tr + '${index + 1}',
                                     style: interMedium.copyWith(
                                         fontSize: Dimensions.fontSizeExtraSmall,
                                         height: 1.4,
                                         color: Theme.of(context).disabledColor),
                                   ),
                                   Text(
                                     " (08:45 To 09:30)".tr,
                                     style: interMedium.copyWith(
                                         fontSize: 12,
                                         height: 1.4,
                                         color: Theme.of(context).hintColor),
                                   ),
                                 ],
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
                                     "select_class_section".tr,
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
                                 "select_teacher".tr,
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
                                 items: selectTeacher,
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
                                     "select_teacher".tr,
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
               );
             }),
              20.h,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'approve_comments'.tr,
                    style: interMedium.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).disabledColor),
                  ),
                  10.h,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [customBoxShadow()],
                        color: Theme.of(context).cardColor),
                    height: 100,
                    child: TextField(
                      cursorColor: Theme.of(context).primaryColor,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).cardColor,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        hintText: 'approve_comments'.tr,
                        hintStyle: interRegular.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).hintColor),
                      ),
                    ),
                  ),
                ],
              ),
              20.h,
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'upload_attachment'.tr,
                      style: interSemiBold.copyWith(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    )),
              ),
              20.h,
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
                        'reject'.tr,
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
                        title: 'approved'.tr,
                        onPressed: () {
                          Get.off(ParentsScreen());
                        }),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor
            ),
          ),
          Text(value,style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).hintColor
          ),),
        ],
      ),
    );
  }

  Widget buildLectureDropdown(String lectureTitle,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lectureTitle,
            style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(
                      value: 'Class 10A',
                      child: Text('Class 10A'),
                    ),
                    DropdownMenuItem(
                      value: 'Class 9B',
                      child: Text('Class 9B'),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Select Class / Section',
                    hintStyle: interRegular.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).disabledColor
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(
                      value: 'Teacher A',
                      child: Text('Teacher A'),
                    ),
                    DropdownMenuItem(
                      value: 'Teacher B',
                      child: Text('Teacher B'),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Select teacher',
                    hintStyle: interRegular.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).disabledColor
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).cardColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

