import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_textfield.dart';
import 'package:erp_school/view/screens/teacher/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'add_activity'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
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
              ExamTextField(
                title: 'event_title'.tr,
                hintText: 'event_title'.tr,
              ),
              20.h,
              Center(
                child: Text(
                  'attach_images'.tr,
                  style: interSemiBold.copyWith(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
              ),
              30.h,
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        Images.activity,
                        height: 140,
                        width: 140,
                      ),
                      Positioned(
                        right: 10,
                          top: 10,
                          child: Icon(
                        Icons.close_outlined,
                        color: Theme.of(context).primaryColor,
                      ))
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        Images.activity,
                        height: 140,
                        width: 140,
                      ),
                      Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(
                            Icons.close_outlined,
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                ],
              ),
              30.h,
              CustomButton(
                height: 50,
                fontSize: 16,
                color: true,
                radius: 50,
                title: 'save'.tr,
                onPressed: () {
                  Get.to(TeacherScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
