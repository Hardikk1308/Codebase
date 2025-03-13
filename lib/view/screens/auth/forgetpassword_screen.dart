import 'package:erp_school/services/login_service.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/response/login_response.dart';
import '../../../services/School_service.dart';
import '../../../services/forget_password_service.dart';

class ChangePassword extends StatefulWidget {
  // final String title;
  const ChangePassword({super.key, });

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isChecked = true;
  late Future<List<LoginResponse>> schoolsFuture;
  final LoginService loginService = LoginService();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void handleChangePassword() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? username = prefs.getString('username');
  //   int? schoolId = await SchoolService.getSchoolId();
  //
  //   String message = await ForgetPasswordService.changePassword(
  //     username: usernameController.text,
  //     oldPassword: oldpasswordController.text,
  //     newPassword: newpasswordController.text,
  //     confirmPassword: confirmpasswordController.text,
  //     schoolId: schoolId,
  //   );
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  // }


  void handleChangePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    int? schoolId = await SchoolService.getSchoolId();

    String responseMessage = await ChangePasswordService.changePassword(
      username: usernameController.text,
      oldPassword: oldpasswordController.text,
      newPassword: newpasswordController.text,
      confirmPassword: confirmpasswordController.text,
      schoolId: schoolId,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(responseMessage),),
    );
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
                  )),
              child: Center(
                child: Image.asset(Images.modulePng),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'login_title'.tr,
              style: interMedium.copyWith(
                fontSize: Dimensions.fontSizeExtraLarge,
                color: Theme.of(context).disabledColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'forget_password_sub_title'.tr,
                textAlign: TextAlign.center,
                style: interRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: usernameController,
                      required: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      height: 50,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).hintColor,
                        size: 20,
                      ),
                      title: 'Username'.tr,
                      hintText: 'Enter your username'.tr,
                    ),
                    CustomTextField(
                      controller: oldpasswordController,
                      required: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      height: 50,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).hintColor,
                        size: 20,
                      ),
                      title: 'Old password'.tr,
                      hintText: 'Enter your old password'.tr,
                    ),
                    CustomTextField(
                      controller: newpasswordController,
                      required: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      height: 50,
                      isPassword: true,
                      showPassword: true,
                      maxLines: 1,
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Theme.of(context).hintColor,
                        size: 20,
                      ),
                      title: 'New password'.tr,
                      hintText: 'Enter your new password'.tr,
                    ),
                    0.h,
                    CustomTextField(
                      controller: confirmpasswordController,
                      required: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      height: 50,
                      isPassword: true,
                      showPassword: true,
                      maxLines: 1,
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Theme.of(context).hintColor,
                        size: 20,
                      ),
                      title: 'Confirm'.tr,
                      hintText: 'Confirm password'.tr,
                    ),
                    25.h,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                          height: 50,
                          fontSize: 16,
                          color: true,
                          radius: 50,
                          title: 'signin'.tr,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              handleChangePassword();
                              // Fetch login response
                              // await loginService.fetchLoginResponse(
                              //   type: widget.title.toLowerCase(),
                              //   username: userController.text,
                              //   context: context,
                              // );
                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                              // await prefs.setString('username', userController.text);
                              // userController.text = "";
                              // passController.text = "";
                           }
                          }),
                    ),
                    50.h,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
