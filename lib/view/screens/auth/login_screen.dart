
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


class LoginScreen extends StatefulWidget {
  final String title;
  final passScreenType;
  const LoginScreen({super.key, required this.title, this.passScreenType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = true;
  late Future<List<LoginResponse>> schoolsFuture;
  final LoginService loginService = LoginService();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   handleLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? schoolId = await SchoolService.getSchoolId();


    String responseMessage = await LoginService.fetchLoginResponse(
      username: userController.text.trim(),
      password: passController.text.trim(),
      schoolId: schoolId /*"${schoolId}"*/,
      type: widget.title.toLowerCase(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar( content: Text(responseMessage),backgroundColor: Colors.green,),
    );
  }


  ///this is correct code ///
  /*void handleLoginStatus() async {
    int? schoolId = await SchoolService.getSchoolId();

    // 🛠 API Call for Login Response
    String responseMessage = await LoginService.fetchLoginResponse(
      username: userController.text.trim(),
      password: passController.text.trim(),
      schoolId: schoolId,
      type: widget.passScreenType.toLowerCase(), // ✅ This is the user-chosen type
    );

    if (!responseMessage.toLowerCase().contains("success")) {
      _showSnackBar(responseMessage, Colors.red);
      return;
    }

    // 🛠 Fetch Updated User Data from API Response
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');

    if (userJson == null || userJson.isEmpty) {
      _showSnackBar("Error: User data not found after login!", Colors.red);
      return;
    }

    try {
      LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(userJson));
      User? user = loginResponse.user;

      if (user == null || user.roles.isEmpty) {
        _showSnackBar("Invalid User: No roles assigned!", Colors.red);
        return;
      }

      print("User Roles from API: ${user.roles}");
      print("Selected PassUserType: ${widget.passScreenType}");

      // ✅ Check Role Matching using API Response
      bool typeMatches = user.roles.any((role) =>
      role.toLowerCase() == widget.passScreenType.toLowerCase());

      if (!typeMatches) {
        _showSnackBar(
          "Unauthorized Access! Your role (${user.roles.join(', ')}) doesn't match ${widget.passScreenType}.",
          Colors.red,
        );
        return;
      }

      // ✅ Redirect to Dashboard after verification
      _showSnackBar("Login Successful!", Colors.green);
      Get.offAll(() => DashboardScreen());

    } catch (e) {
      _showSnackBar("Error parsing user data: $e", Colors.red);
    }
  }*/

  ///this code is working but not perfect tested show i have commented this code
  ///and before testing uncommented this code.
  // void handleLoginStatus() async {
  //   int? schoolId = await SchoolService.getSchoolId();
  //
  //   // 🛠 API Call for Login Response
  //   String responseMessage = await LoginService.fetchLoginResponse(
  //     username: userController.text.trim(),
  //     password: passController.text.trim(),
  //     schoolId: schoolId,
  //     type: widget.passScreenType.toLowerCase(),
  //   );
  //
  //   if (!responseMessage.toLowerCase().contains("success")) {
  //     _showSnackBar(responseMessage, Colors.red);
  //     return;
  //   }
  //
  //   // ✅ Fetch Latest User Data from API Response
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final userJson = prefs.getString('user');
  //
  //   if (userJson == null || userJson.isEmpty) {
  //     _showSnackBar("Error: User data not found after login!", Colors.red);
  //     return;
  //   }
  //
  //   try {
  //     LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(userJson));
  //     User? user = loginResponse.user;
  //
  //     if (user == null || user.roles.isEmpty) {
  //       _showSnackBar("Invalid User: No roles assigned!", Colors.red);
  //       return;
  //     }
  //
  //     print("User Roles from API: ${user.roles}");
  //     print("Selected PassUserType: ${widget.passScreenType}");
  //
  //     // ✅ Strict Role Validation using API Response
  //     bool typeMatches = user.roles.any((role) =>
  //     role.toLowerCase().trim() == widget.passScreenType.toLowerCase().trim());
  //
  //     if (!typeMatches) {
  //       _showSnackBar(
  //         "Unauthorized Access! Your role (${user.roles.join(', ')}) doesn't match ${widget.passScreenType}.",
  //         Colors.red,
  //       );
  //
  //       // ❌ Force Logout (Prevent Access)
  //       await prefs.clear(); // ✅ User Data Clear to Prevent Login
  //       Get.offAll(() => Navigator.pop(context)); /*LoginScreen(title: '${widget.passScreenType.toLowerCase().trim()}',));*/ // 🔄 Redirect to Login Page
  //       return;
  //     }
  //
  //     // ✅ If Role Matches, Redirect to Dashboard
  //     _showSnackBar("Login Successful!", Colors.green);
  //     Get.offAll(() => DashboardScreen());
  //
  //   } catch (e) {
  //     _showSnackBar("Error parsing user data: $e", Colors.red);
  //   }
  // }



// Helper method to show SnackBar
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme
            .of(context)
            .cardColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.35,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSecondary,
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
                  color: Theme
                      .of(context)
                      .disabledColor,
                ),
              ),
             // Text("data : -  ${widget.passScreenType}"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  'login_sub_title'.tr,
                  textAlign: TextAlign.center,
                  style: interRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme
                        .of(context)
                        .hintColor,
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
                        controller: userController,
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
                          color: Theme
                              .of(context)
                              .hintColor,
                          size: 20,
                        ),
                        title: 'user_name'.tr,
                        hintText: 'enter_your_user_name'.tr,
                      ),
                      CustomTextField(
                        controller: passController,
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
                          color: Theme
                              .of(context)
                              .hintColor,
                          size: 20,
                        ),
                        title: 'password'.tr,
                        hintText: 'enter_your_password'.tr,
                      ),
                      15.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                activeColor: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary, // Selected color
                                fillColor:
                                WidgetStateProperty.resolveWith<Color>(
                                        (states) {
                                      if (states.contains(
                                          WidgetState.selected)) {
                                        return Theme
                                            .of(context)
                                            .primaryColor; // Selected color
                                      }
                                      return Colors.white; // Unselected color
                                    }),
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value ?? false;
                                  });
                                },
                              ),
                              5.w,
                              Text(
                                'remember_me'.tr,
                                style: interMedium.copyWith(
                                    color: Theme
                                        .of(context)
                                        .hintColor,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          GestureDetector(
                            // Get.to(ChooseModuleScreen());
                            onTap: () async {
                              // if (savedUsername!.isNotEmpty) {
                              // SharedPreferences prefs = await SharedPreferences
                              //     .getInstance();
                              // await prefs.setString('student', "Student");
                             // Get.to(() =>
                             // const ChangePassword(title: 'student',));
                              //   ;
                              // } else {
                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                              // await prefs.setString('student', "Student");
                              // Get.to(
                              //       () => const LoginScreen(title: 'Student'),
                              // );
                              // }
                            },
                            child: Text(
                              'forgot_password'.tr,
                              style: interRegular.copyWith(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: 14),
                            ),
                          ),

                        ],
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
                                // Fetch login response
                                // await loginService.fetchLoginResponse(
                                //   type: widget.title.toLowerCase(),
                                //   username: userController.text,
                                //   context: context,
                                // );

                                handleLoginStatus();
                                // SharedPreferences prefs = await SharedPreferences
                                //     .getInstance();
                                // await prefs.setString(
                                //     'username', userController.text);
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