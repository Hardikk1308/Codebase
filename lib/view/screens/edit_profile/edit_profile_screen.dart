// import 'dart:convert';
// import 'package:erp_school/view/screens/dashboard/dashboard_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import '../../../data/models/response/login_response.dart';
// import '../../../services/School_service.dart';
// import '../../../services/login_service.dart';
// import '../../../utils/shared_preference_util.dart';
// import '../../base/custom_appbar.dart';
// import '../teacher/teacher_screen.dart';
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   String? selectedModule;
//   User? _user; // Nullable to avoid late initialization issues
//   final LoginService loginService = LoginService();
//
//   // TextEditingControllers
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final addressController = TextEditingController();
//   final bloodGroupController = TextEditingController();
//   final streamOfStudyController = TextEditingController();
//   final motherNameController = TextEditingController();
//   final fatherNameController = TextEditingController();
//   final mediumOfInstructionController = TextEditingController();
//   final guardianNameController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeLogin();
//   }
//
//   Future<void> _initializeLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//     String? type = prefs.getString('type')?.toLowerCase();
//
//     setState(() {
//       selectedModule = type;
//     });
//
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       final prefsInstance = await SharedPreferenceUtil.getInstance();
//       String? userJson = prefsInstance.getString('user');
//       if (userJson != null) {
//         setState(() {
//           _user = LoginResponse.fromJson(jsonDecode(userJson)).user;
//           _loadUserDataIntoControllers();
//         });
//       } else {
//         print("Abhi :-No user data found in SharedPreferences.");
//       }
//     } else {
//       print("Abhi :-No username found in SharedPreferences.");
//     }
//   }
//
//   void _loadUserDataIntoControllers() {
//     if (_user != null) {
//       emailController.text = _user!.email;
//       firstNameController.text = _user!.firstName;
//       lastNameController.text = _user!.lastName;
//       addressController.text = _user!.moreDetails.address;
//       bloodGroupController.text = _user!.moreDetails.bloodGrp ?? '';
//       streamOfStudyController.text = _user!.moreDetails.streamOfStudy ?? '';
//       fatherNameController.text = _user!.moreDetails.fatherName;
//       motherNameController.text = _user!.moreDetails.motherName;
//       mediumOfInstructionController.text = _user!.moreDetails.mediumOfInstruction ?? '';
//       guardianNameController.text = _user!.moreDetails.guardianName ?? '';
//     }
//   }
//   void navigateToDashboard(BuildContext context) {
//     final scaffoldState = Scaffold.maybeOf(context);
//
//     Navigator.pop(context); // Pehle Drawer close karo
//     Future.delayed(Duration(milliseconds: 90), () {
//       selectedModule == 'student'
//           ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()))
//           : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
//     });
//
//   }
//   Future<void> updateProfile() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? schoolId = await SchoolService.getSchoolId();
//     int? teacherId = prefs.getInt('teacherId');
//     int? studentId = prefs.getInt('studentId');
//     int? studentGradeId = prefs.getInt('gradeId');
//     int? studentSectionId = prefs.getInt('sectionId');
//
//     print("Abhi :-Student ID: $studentId");
//     printControllerValues(beforeUpdate: true);
//
//     String studentUrl = 'https://www.sutramsol.in/ssapigw-dev/onboard-dev/api/v1/students/$studentId';
//     String teacherUrl = 'https://www.sutramsol.in/ssapigw-dev/onboard-dev/api/v1/teachers/$teacherId';
//     String url = (selectedModule == 'student') ? studentUrl : teacherUrl;
//
//     Map<String, dynamic> updatedData = {
//       "schoolId": schoolId,
//       if (selectedModule == 'student') ...{
//         "gradeId": studentGradeId,
//         "sectionId": studentSectionId,
//         "mediumOfInstruction": mediumOfInstructionController.text,
//         "bloodGroup": bloodGroupController.text,
//         "streamOfStudy": streamOfStudyController.text,
//         "guardianName": guardianNameController.text,
//       },
//       "firstName": firstNameController.text,
//       "lastName": lastNameController.text,
//       "email": emailController.text,
//       "address": addressController.text,
//       "fatherName": fatherNameController.text,
//       "motherName": motherNameController.text,
//     };
//
//     try {
//       final response = await http.put(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(updatedData),
//       );
//
//       if (response.statusCode == 200) {
//         print("Profile updated successfully");
//         print("Abhi :-API Response: ${response.body}");
//
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//
//         setState(() {
//           updateControllers(responseData);
//           printControllerValues(beforeUpdate: false);
//         });
//
//         await mergeDataAndSave();
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile Updated Successfully")),
//         );
//         // if(Scaffold.of(context).isDrawerOpen){
//         //         Navigator.pop(context);}else {
//         //   selectedModule == 'student' ? Navigator.pushReplacement(context,
//         //       MaterialPageRoute(builder: (context) => DashboardScreen()))
//         //       : Navigator.pushReplacement(context,
//         //       MaterialPageRoute(builder: (context) => TeacherScreen()));
//         // }
//
//         navigateToDashboard(context);
//       } else {
//         print("Abhi :-Failed to update profile: ${response.statusCode} - ${response.body}");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Update Failed! Try Again.")),
//         );
//       }
//     } catch (e) {
//       print("Error updating profile: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Something went wrong!")),
//       );
//     }
//   }
//
//   // Helper to print controller values for debugging
//   void printControllerValues({required bool beforeUpdate}) {
//     String prefix = beforeUpdate ? "Before Update" : "After Update";
//     print("Abhi :-=== Controller Values $prefix ===");
//     print("Abhi :-First Name: ${firstNameController.text}");
//     print("Abhi :-Last Name: ${lastNameController.text}");
//     print("Abhi :-Email: ${emailController.text}");
//     print("Abhi :-Address: ${addressController.text}");
//     print("Abhi :-Father Name: ${fatherNameController.text}");
//     print("Abhi :-Mother Name: ${motherNameController.text}");
//
//     if (selectedModule == 'student') {
//       print("Abhi :-Blood Group: ${bloodGroupController.text}");
//       print("Abhi :-Stream of Study: ${streamOfStudyController.text}");
//       print("Abhi :-Medium of Instruction: ${mediumOfInstructionController.text}");
//       print("Abhi :-Guardian Name: ${guardianNameController.text}");
//     }
//   }
//
//   // Update controllers with API response
//   void updateControllers(Map<String, dynamic> responseData) {
//     firstNameController.text = responseData["firstName"] ?? firstNameController.text;
//     lastNameController.text = responseData["lastName"] ?? lastNameController.text;
//     emailController.text = responseData["email"] ?? emailController.text;
//     addressController.text = responseData["address"] ?? addressController.text;
//     // FatherName aur MotherName response mein nahi hain to current values rakhein
//     fatherNameController.text = fatherNameController.text; // API se nahi aata
//     motherNameController.text = motherNameController.text; // API se nahi aata
//
//     if (selectedModule == 'student') {
//       mediumOfInstructionController.text =
//           responseData["mediumOfInstruction"] ?? mediumOfInstructionController.text;
//       bloodGroupController.text =
//           responseData["bloodGroup"] ?? bloodGroupController.text;
//       streamOfStudyController.text =
//           responseData["streamOfStudy"] ?? streamOfStudyController.text;
//       guardianNameController.text =
//           guardianNameController.text; // API se nahi aata
//     }
//   }
//
//   // Merge API response data with existing SharedPreferences data and save it
//   Future<void> mergeDataAndSave() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String? userData = prefs.getString('user');
//     Map<String, dynamic> existingData = userData != null ? jsonDecode(userData) : {};
//
//     Map<String, dynamic> user = existingData['user'] ?? {};
//
//     // `user` object ke fields update karna
//     user['firstName'] = firstNameController.text;
//     user['lastName'] = lastNameController.text;
//     user['email'] = emailController.text;
//
//     // `moreDetails` object ke fields update karna
//     Map<String, dynamic> moreDetails = user['moreDetails'] ?? {};
//     moreDetails['address'] = addressController.text;
//     moreDetails['bloodGrp'] = bloodGroupController.text; // SharedPreferences mein 'bloodGrp' hai
//     moreDetails['streamOfStudy'] = streamOfStudyController.text;
//     moreDetails['mediumOfInstruction'] = mediumOfInstructionController.text;
//     moreDetails['fatherName'] = fatherNameController.text;
//     moreDetails['motherName'] = motherNameController.text;
//     moreDetails['guardianName'] = guardianNameController.text;
//
//     user['moreDetails'] = moreDetails;
//     existingData['user'] = user;
//
//     await prefs.setString('user', jsonEncode(existingData));
//
//     print("Abhi :-🔄 Updated SharedPreferences: ${jsonEncode(existingData)}");
//
//     // Verify karna
//     String? updatedUserData = prefs.getString('user');
//     print("Abhi :- Final Stored Data in SharedPreferences: $updatedUserData");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: selectedModule == 'teacher' ? "Edit Profile".tr : 'Edit Profile'.tr,
//       ),
//       body: _user == null
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // selectedModule == 'student'
//               //     ? Text("user name --> ${_user?.username}")
//               //     : Text("Welcome to teacher"),
//               Text("First name", style: TextStyle(fontSize: 12)),
//               CustomTextFormFiledBotton(
//                   controller: firstNameController),
//               SizedBox(height: height * 0.01),
//               Text("Last name", style: TextStyle(fontSize: 12)),
//               CustomTextFormFiledBotton(
//                   controller: lastNameController),
//               SizedBox(height: height * 0.01),
//               Text("Email", style: TextStyle(fontSize: 12)),
//               CustomTextFormFiledBotton(controller: emailController),
//               SizedBox(height: height * 0.01),
//               Text("Address", style: TextStyle(fontSize: 12)),
//               CustomTextFormFiledBotton(
//                   controller: addressController),
//               if (selectedModule == 'student') ...[
//                 SizedBox(height: height * 0.01),
//                 Text("Blood group", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: bloodGroupController),
//                 SizedBox(height: height * 0.01),
//                 Text("Stream of study", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: streamOfStudyController),
//                 SizedBox(height: height * 0.01),
//                 Text("Mother name", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: motherNameController),
//                 SizedBox(height: height * 0.01),
//                 Text("Father name", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: fatherNameController),
//                 SizedBox(height: height * 0.01),
//                 Text("Study medium", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: mediumOfInstructionController),
//                 SizedBox(height: height * 0.01),
//                 Text("Guardian name", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: guardianNameController),
//               ] else ...[
//                 SizedBox(height: height * 0.01),
//                 Text("Mother name", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: motherNameController),
//                 SizedBox(height: height * 0.01),
//                 Text("Father name", style: TextStyle(fontSize: 12)),
//                 CustomTextFormFiledBotton(
//                     controller: fatherNameController),
//               ],
//               SizedBox(height: height * 0.05),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: TextButton(
//                   onPressed: updateProfile,
//                   child: Text(
//                     "Edit Profile",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomTextFormFiledBotton extends StatelessWidget {
//   final String? hint;
//   final maxline;
//   final TextEditingController? controller;
//   const CustomTextFormFiledBotton({Key? key, this.hint, this.controller, this.maxline}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLines: maxline,
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hint,
//         contentPadding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 8.0),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey, width: 2),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:erp_school/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/response/login_response.dart';
import '../../../services/School_service.dart';
import '../../../services/login_service.dart';
import '../../../utils/shared_preference_util.dart';
import '../../base/custom_appbar.dart';
import '../student/edit_profile.dart';
import '../teacher/teacher_screen.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedModule;
  User? _user; // Nullable to avoid late initialization issues
  final LoginService loginService = LoginService();

  // TextEditingControllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final streamOfStudyController = TextEditingController();
  final motherNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final mediumOfInstructionController = TextEditingController();
  final guardianNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeLogin();
  }

  Future<void> _initializeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? type = prefs.getString('type')?.toLowerCase();

    setState(() {
      selectedModule = type;
    });

    if (savedUsername != null && savedUsername.isNotEmpty) {
      final prefsInstance = await SharedPreferenceUtil.getInstance();
      String? userJson = prefsInstance.getString('user');
      if (userJson != null) {
        setState(() {
          _user = LoginResponse.fromJson(jsonDecode(userJson)).user;
          _loadUserDataIntoControllers();
        });
      } else {
        print("Abhi :-No user data found in SharedPreferences.");
      }
    } else {
      print("Abhi :-No username found in SharedPreferences.");
    }
  }

  void _loadUserDataIntoControllers() {
    if (_user != null) {
      emailController.text = _user!.email;
      firstNameController.text = _user!.firstName;
      lastNameController.text = _user!.lastName;
      addressController.text = _user!.moreDetails.address;
      bloodGroupController.text = _user!.moreDetails.bloodGrp ?? '';
      streamOfStudyController.text = _user!.moreDetails.streamOfStudy ?? '';
      fatherNameController.text = _user!.moreDetails.fatherName;
      motherNameController.text = _user!.moreDetails.motherName;
      mediumOfInstructionController.text = _user!.moreDetails.mediumOfInstruction ?? '';
      guardianNameController.text = _user!.moreDetails.guardianName ?? '';
    }
  }
  // void navigateToDashboard(BuildContext context) {
  //   final scaffoldState = Scaffold.maybeOf(context);
  //   setState(() {
  //     Navigator.pop(context);
  //   });
  //    // Pehle Drawer close karo
  //   Future.delayed(Duration(milliseconds: 90), () {
  //     selectedModule == 'student'
  //         ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()))
  //         : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
  //   });
  // }

  void navigateToDashboard(BuildContext context) {
    final scaffoldState = Scaffold.maybeOf(context);
    setState(() {
      Navigator.pop(context);
    });
     // Pehle Drawer close karo
    Future.delayed(Duration(milliseconds: 5), () {
      selectedModule == 'student'
          ? Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfileScreen()))
          : Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfileScreen()));
    });
  }

  Future<void> updateProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? schoolId = await SchoolService.getSchoolId();
    int? teacherId = prefs.getInt('teacherId');
    int? studentId = prefs.getInt('studentId');
    int? studentGradeId = prefs.getInt('gradeId');
    int? studentSectionId = prefs.getInt('sectionId');

    print("Abhi :-Student ID: $studentId");
    printControllerValues(beforeUpdate: true);

    String studentUrl = 'https://www.sutramsol.in/ssapigw-dev/onboard-dev/api/v1/students/$studentId';
    String teacherUrl = 'https://www.sutramsol.in/ssapigw-dev/onboard-dev/api/v1/teachers/$teacherId';
    String url = (selectedModule == 'student') ? studentUrl : teacherUrl;

    Map<String, dynamic> updatedData = {
      "schoolId": schoolId,
      if (selectedModule == 'student') ...{
        "gradeId": studentGradeId,
        "sectionId": studentSectionId,
        "mediumOfInstruction": mediumOfInstructionController.text,
        "bloodGroup": bloodGroupController.text,
        "streamOfStudy": streamOfStudyController.text,
        "guardianName": guardianNameController.text,
      },
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "address": addressController.text,
      "fatherName": fatherNameController.text,
      "motherName": motherNameController.text,
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        print("Profile updated successfully");
        print("Abhi :-API Response: ${response.body}");

        Map<String, dynamic> responseData = jsonDecode(response.body);

        setState(() {
          updateControllers(responseData);
          printControllerValues(beforeUpdate: false);
        });

        await mergeDataAndSave();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile Updated Successfully")),
        );
        // if(Scaffold.of(context).isDrawerOpen){
        //         Navigator.pop(context);}else {
        //   selectedModule == 'student' ? Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) => DashboardScreen()))
        //       : Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) => TeacherScreen()));
        // }

        navigateToDashboard(context);
      } else {
        print("Abhi :-Failed to update profile: ${response.statusCode} - ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Update Failed! Try Again.")),
        );
      }
    } catch (e) {
      print("Error updating profile: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong!")),
      );
    }
  }

  // Helper to print controller values for debugging
  void printControllerValues({required bool beforeUpdate}) {
    String prefix = beforeUpdate ? "Before Update" : "After Update";
    print("Abhi :-=== Controller Values $prefix ===");
    print("Abhi :-First Name: ${firstNameController.text}");
    print("Abhi :-Last Name: ${lastNameController.text}");
    print("Abhi :-Email: ${emailController.text}");
    print("Abhi :-Address: ${addressController.text}");
    print("Abhi :-Father Name: ${fatherNameController.text}");
    print("Abhi :-Mother Name: ${motherNameController.text}");

    if (selectedModule == 'student') {
      print("Abhi :-Blood Group: ${bloodGroupController.text}");
      print("Abhi :-Stream of Study: ${streamOfStudyController.text}");
      print("Abhi :-Medium of Instruction: ${mediumOfInstructionController.text}");
      print("Abhi :-Guardian Name: ${guardianNameController.text}");
    }
  }

  // Update controllers with API response
  void updateControllers(Map<String, dynamic> responseData) {
    firstNameController.text = responseData["firstName"] ?? firstNameController.text;
    lastNameController.text = responseData["lastName"] ?? lastNameController.text;
    emailController.text = responseData["email"] ?? emailController.text;
    addressController.text = responseData["address"] ?? addressController.text;
    // FatherName aur MotherName response mein nahi hain to current values rakhein
    fatherNameController.text = fatherNameController.text; // API se nahi aata
    motherNameController.text = motherNameController.text; // API se nahi aata

    if (selectedModule == 'student') {
      mediumOfInstructionController.text =
          responseData["mediumOfInstruction"] ?? mediumOfInstructionController.text;
      bloodGroupController.text =
          responseData["bloodGroup"] ?? bloodGroupController.text;
      streamOfStudyController.text =
          responseData["streamOfStudy"] ?? streamOfStudyController.text;
      guardianNameController.text =
          guardianNameController.text; // API se nahi aata
    }
  }

  // Merge API response data with existing SharedPreferences data and save it
  Future<void> mergeDataAndSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userData = prefs.getString('user');
    Map<String, dynamic> existingData = userData != null ? jsonDecode(userData) : {};

    Map<String, dynamic> user = existingData['user'] ?? {};

    // `user` object ke fields update karna
    user['firstName'] = firstNameController.text;
    user['lastName'] = lastNameController.text;
    user['email'] = emailController.text;

    // `moreDetails` object ke fields update karna
    Map<String, dynamic> moreDetails = user['moreDetails'] ?? {};
    moreDetails['address'] = addressController.text;
    moreDetails['bloodGrp'] = bloodGroupController.text; // SharedPreferences mein 'bloodGrp' hai
    moreDetails['streamOfStudy'] = streamOfStudyController.text;
    moreDetails['mediumOfInstruction'] = mediumOfInstructionController.text;
    moreDetails['fatherName'] = fatherNameController.text;
    moreDetails['motherName'] = motherNameController.text;
    moreDetails['guardianName'] = guardianNameController.text;

    user['moreDetails'] = moreDetails;
    existingData['user'] = user;

    await prefs.setString('user', jsonEncode(existingData));

    print("Abhi :-🔄 Updated SharedPreferences: ${jsonEncode(existingData)}");

    // Verify karna
    String? updatedUserData = prefs.getString('user');
    print("Abhi :- Final Stored Data in SharedPreferences: $updatedUserData");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: selectedModule == 'teacher' ? "Edit Profile".tr : 'Edit Profile'.tr,
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // selectedModule == 'student'
              //     ? Text("user name --> ${_user?.username}")
              //     : Text("Welcome to teacher"),
              Text("First name", style: TextStyle(fontSize: 12)),
              CustomTextFormFiledBotton(
                  controller: firstNameController),
              SizedBox(height: height * 0.01),
              Text("Last name", style: TextStyle(fontSize: 12)),
              CustomTextFormFiledBotton(
                  controller: lastNameController),
              SizedBox(height: height * 0.01),
              Text("Email", style: TextStyle(fontSize: 12)),
              CustomTextFormFiledBotton(controller: emailController),
              SizedBox(height: height * 0.01),
              Text("Address", style: TextStyle(fontSize: 12)),
              CustomTextFormFiledBotton(
                  controller: addressController),
              if (selectedModule == 'student') ...[
                SizedBox(height: height * 0.01),
                Text("Blood group", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: bloodGroupController),
                SizedBox(height: height * 0.01),
                Text("Stream of study", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: streamOfStudyController),
                SizedBox(height: height * 0.01),
                Text("Mother name", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: motherNameController),
                SizedBox(height: height * 0.01),
                Text("Father name", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: fatherNameController),
                SizedBox(height: height * 0.01),
                Text("Study medium", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: mediumOfInstructionController),
                SizedBox(height: height * 0.01),
                Text("Guardian name", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: guardianNameController),
              ] else ...[
                SizedBox(height: height * 0.01),
                Text("Mother name", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: motherNameController),
                SizedBox(height: height * 0.01),
                Text("Father name", style: TextStyle(fontSize: 12)),
                CustomTextFormFiledBotton(
                    controller: fatherNameController),
              ],
              SizedBox(height: height * 0.05),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: updateProfile,
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormFiledBotton extends StatelessWidget {
  final String? hint;
  final maxline;
  final TextEditingController? controller;
  const CustomTextFormFiledBotton({Key? key, this.hint, this.controller, this.maxline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}