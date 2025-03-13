
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/screens/module/choose_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/response/School_model.dart';
import '../../../services/School_service.dart';

class SelectSchoolScreen extends StatefulWidget {
  const SelectSchoolScreen({super.key});

  @override
  State<SelectSchoolScreen> createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends State<SelectSchoolScreen> {
  late Future<List<SchoolModel>> _schoolsFuture;
  final SchoolService _teacherAttendanceService = SchoolService();

  List<DropdownItem<String>> selectSubject = [];
  String? _selectedSchoolName;
  int? _selectedSchoolId;
  bool _isSchoolSelected = true;

  @override
  void initState() {
    super.initState();
    _schoolsFuture = _teacherAttendanceService.fetchSchool();
    _loadSelectedSchool();
  }

  Future<void> _loadSelectedSchool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedSchoolName = prefs.getString('selectedSchool');
      _selectedSchoolId = prefs.getInt('selectedSchoolId');
    });
  }

  Future<void> _saveSelectedSchool(String value, int schoolId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedSchool', value);
    await prefs.setInt('selectedSchoolId', schoolId);
    setState(() {
      _selectedSchoolName = value;
      _selectedSchoolId = schoolId;
      _isSchoolSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.35,
              width: Get.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Image.asset(Images.modulePng),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'select_school_title'.tr,
                    style: interMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'select_school_subtitle_title'.tr,
                    textAlign: TextAlign.center,
                    style: interRegular.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "select_school".tr,
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            height: 1.4,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.radiusSmall),
                      FutureBuilder<List<SchoolModel>>(
                        future: _schoolsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(color: Colors.blue);
                          }
                          if (snapshot.hasError) {
                            if (snapshot.hasError) {
                              print("Abhi FutureBuilder Error: ${snapshot.error}");
                              print("Abhi StackTrace: ${snapshot.stackTrace}");
                              return Text('Error: ${snapshot.error}');
                            }
                            return Text('Error: \${snapshot.error}');
                          }
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Text('No schools available');
                          }
                          selectSubject = snapshot.data!
                              .map((school) => DropdownItem<String>(
                            value: school.schoolName,
                            child: Text(
                              school.schoolName,
                              style: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeSmall,
                                color: Colors.black,
                              ),
                            ),
                          ))
                              .toList();
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              border: Border.all(
                                color: Theme.of(context).hintColor,
                                width: 0.08,
                              ),
                              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                            ),
                            child: CustomDropdown<String>(
                              onChange: (String? value, int index) async {
                                if (value != null && index >= 0 && index < snapshot.data!.length) {
                                  final selectedSchool = snapshot.data![index];
                                  await _saveSelectedSchool(value, selectedSchool.schoolId);
                                }
                              },
                              value: _selectedSchoolName,
                              items: selectSubject,
                              dropdownStyle: DropdownStyle(color: Get.theme.cardColor),
                              itemTextStyle: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: Theme.of(context).hintColor,
                              ),
                              icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).hintColor),
                              dropdownButtonStyle: DropdownButtonStyle(
                                height: 55,
                                primaryColor: Theme.of(context).primaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSMALL),
                                child: Text(
                                  _selectedSchoolName ?? 'Select your School',
                                  style: interMedium.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                    color: _isSchoolSelected ? Theme.of(context).disabledColor : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  CustomButton(
                    height: 50,
                    fontSize: 16,
                    color: true,
                    radius: 50,
                    title: 'continue'.tr,
                    onPressed: () {
                      if (_selectedSchoolName == null) {
                        setState(() => _isSchoolSelected = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            content: Text(
                              "Please select your school",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            duration: Duration(seconds: 3),
                            // backgroundColor: Theme.of(context).primaryColor,
                          ),
                        );
                        return;
                      }
                      Get.to(const ChooseModuleScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
///       testing code              ///

