// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../data/models/response/homework_summary.dart';
// import '../../../services/login_service.dart';
// import '../edit_profile/edit_profile_screen.dart';
//
// class HomeWorkDetailsScreen extends StatefulWidget {
//   final String title;
//   final HomeworkDetails filteredHomework;
//
//   const HomeWorkDetailsScreen({
//     super.key,
//     required this.title,
//     required this.filteredHomework,
//   });
//
//   @override
//   State<HomeWorkDetailsScreen> createState() => _HomeWorkDetailsScreenState();
// }
//
// class _HomeWorkDetailsScreenState extends State<HomeWorkDetailsScreen> {
//   String? selectedModule;
//   List<String> _statusvalue = ['PENDING', 'COMPLETED',];
//   late String selectedLocation;
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController moreController = TextEditingController();
//   TextEditingController commentsController = TextEditingController();
//   final String dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   @override
//   void initState() {
//     super.initState();
//     _loadUserType();
//     // selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//     //     ? widget.filteredHomework.status
//     //     : _statusvalue.first;
//     selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//         ? widget.filteredHomework.status
//         : _statusvalue.first;
//     titleController.text = widget.filteredHomework.title;
//     moreController.text = widget.filteredHomework.moreDetails;
//     commentsController.text = widget.filteredHomework.comments ?? '';
//     // print("type -->$dateTime");
//   }
//   Future<void> _loadUserType() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedModule = prefs.getString('type')?.toLowerCase() ?? 'no type';
//     });
//     print("Selected Module: $selectedModule");
//   }
//   /// The API to update student status ///
//   // Future<void> updateUserData(Map<String, dynamic> updatedData) async {
//   //   String? baseUrl = selectedModule == 'teacher'? 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/teacher/${widget.filteredHomework.homeworkId}'
//   //       : 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/student/${widget.filteredHomework.homeworkId}/submit';
//   //
//   //   final headers = await LoginService.getHeaders();
//   //   final String dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   //
//   //   print("Current Date: $dateTime");
//   //
//   //   final response = await http.put(
//   //     Uri.parse(baseUrl),
//   //     headers: headers,
//   //     body: jsonEncode({
//   //       "status": selectedLocation,
//   //       "moreDetails": moreController.text,
//   //       "title": titleController.text,
//   //       "dueDate": dateTime,
//   //       "comments": commentsController.text,
//   //     }),
//   //   );
//   //
//   //   if (response.statusCode == 200) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text("Detail updated successfully")),
//   //     );
//   //     print(' User data updated successfully');
//   //   } else {
//   //     throw Exception(' Failed to update user data: ${response.statusCode}');
//   //   }
//   // }
//
//   // Function to process and set comments in the TextFormField
//   void processComments(String commentsString) {
//     // Check if commentsString is not empty
//     if (commentsString.isNotEmpty) {
//       // Split comments using ';' and remove empty values
//       List<String> commentsList = commentsString.split(';').where((c) => c.trim().isNotEmpty).toList();
//
//       // Count total comments
//       int commentCount = commentsList.length;
//
//       // Join comments with a newline for displaying in TextFormField
//       String formattedComments = commentsList.join("\n");
//
//       // Assign formatted comments to the TextFormField controller
//       commentsController.text = formattedComments;
//
//       // Debugging (optional)
//       print("Total Comments: $commentCount");
//       print("Formatted Comments:\n$formattedComments");
//     }
//   }
//
//   Future<void> updateUserData(Map<String, dynamic> updatedData) async {
//     String? baseUrl = selectedModule == 'teacher'
//         ? 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/teacher/${widget.filteredHomework.homeworkId}'
//         : 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/student/${widget.filteredHomework.homeworkId}/SUBMITTED';
//
//     final headers = await LoginService.getHeaders();
//     final String dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//     print("Current Date: $dateTime");
//
//     try {
//       final response = await http.put(
//         Uri.parse(baseUrl),
//         headers: headers,
//         body: jsonEncode({
//           "status": selectedLocation,
//           "moreDetails": moreController.text,
//           "title": titleController.text,
//           "dueDate": dateTime,
//           "comments": commentsController.text,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         print('User data updated successfully');
//         print("Abhi reponse:-${response.body}");
//         print("Abhi status:-${response.statusCode}");
//         if (mounted) {
//           // ScaffoldMessenger.of(context).showSnackBar(
//           //   SnackBar(content: Text("Detail updated successfully")),
//             print("Detail update succesfuly");
//             selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//                 ? widget.filteredHomework.status
//                 : _statusvalue.first;
//             titleController.text = widget.filteredHomework.title;
//             moreController.text = widget.filteredHomework.moreDetails;
//             // commentsController.text = widget.filteredHomework.comments;
//           //);
//         }
//       } else {
//         throw Exception('Failed to update user data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Error updating user data: $e");
//
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Something went wrong!")),
//         );
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: Text('Homework Details')),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.secondary,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Text('Subject: ',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold)),
//                       Text(widget.filteredHomework.subject,
//                           style: TextStyle(
//                               fontSize: 16, color: Colors.black54)),
//                     ],
//                   ),
//
//                   selectedModule == 'teacher'
//                       ?  Container(
//                     decoration: BoxDecoration(
//                       color: selectedLocation == "PENDING"
//                           ? Colors.purple
//                           : selectedLocation == 'COMPLETED'
//                           ? Colors.blueAccent
//                           : selectedLocation == 'NEW'
//                           ? Colors.amber
//                           : Color.fromARGB(255, 7, 122, 66),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: DropdownButton(
//                       focusColor: Colors.red,
//                       iconEnabledColor: Colors.white,
//                       value: selectedLocation,
//                       style: TextStyle(color: Colors.white),
//                       underline: SizedBox(),
//                       dropdownColor: Colors.white,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedLocation = newValue!;
//                         });
//                       },
//                       selectedItemBuilder: (BuildContext context) {
//                         return _statusvalue.map((String value) {
//                           return Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(value,
//                                   style: TextStyle(color: Colors.white)),
//                             ),
//                           );
//                         }).toList();
//                       },
//                       items: _statusvalue.map((String location) {
//                         return DropdownMenuItem<String>(
//                           value: location,
//                           child: Padding(
//                             padding: const EdgeInsets.all(0.0),
//                             child: Text(location,
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.black)),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     /*DropdownButton(
//                         value: selectedLocation,
//                         onChanged: (String? newValue) {
//                           if (newValue != null) {
//                             setState(() {
//                               selectedLocation = newValue;
//                             });
//                             print("Updated selectedLocation: $selectedLocation"); // Debugging ke liye
//                           }
//                         },
//                         items: _statusvalue.map((String location) {
//                           return DropdownMenuItem<String>(
//                             value: location,
//                             child: Text(location),
//                           );
//                         }).toList(),
//                       )*/
//                   ): SizedBox(),
//                   selectedModule == 'student' ?  Container(
//                       height: 35,
//                       width: 90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                     color: selectedLocation == "PENDING"
//                         ? Colors.purple
//                         : selectedLocation == 'COMPLETED'
//                         ? Colors.blueAccent
//                         : selectedLocation == 'NEW'
//                         ? Colors.amber
//                         : Color.fromARGB(255, 7, 122, 66),
//                   ), child: Center(child: Text("${widget.filteredHomework.status}",style: TextStyle(color: Colors.white,fontSize: 12),))) : SizedBox(),
//                 ],
//               ),
//             ) ,
//             SizedBox(height: 20),
//             // selectedModule == 'student' ?   Text('Homework Details',
//             //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
//             selectedModule == 'student' ?   Text('Title',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
//             selectedModule == 'student' ?  SizedBox(height: 15):SizedBox(),
//             selectedModule == 'student' ?   Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).cardColor,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.shade300,
//                       blurRadius: 8,
//                       offset: Offset(0, 4)),
//                 ],
//               ),
//               padding: EdgeInsets.all(12),
//               child:  Text(
//                 widget.filteredHomework.title,
//                 textAlign: TextAlign.justify,
//                 style: TextStyle(fontSize: 16, color: Colors.black87),
//               ),
//             ): SizedBox(),
//             selectedModule == 'student' ?  SizedBox(height: 20) : SizedBox(),
//             selectedModule == 'student' ?   Text('More Details',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
//             selectedModule == 'student' ?   SizedBox(height: 20) :SizedBox(),
//             selectedModule == 'student' ?   Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).cardColor,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.shade300,
//                       blurRadius: 8,
//                       offset: Offset(0, 4)),
//                 ],
//               ),
//               padding: EdgeInsets.all(12),
//               child: Text(
//                 widget.filteredHomework.moreDetails,
//                 textAlign: TextAlign.justify,
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//             ) : SizedBox(),
//             selectedModule == 'student' ?  SizedBox(height: 20) : SizedBox(),
//             selectedModule == 'student' ?   Text('Comments',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
//             selectedModule == 'student' ? Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).cardColor,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.shade300,
//                       blurRadius: 8,
//                       offset: Offset(0, 4)),
//                 ],
//               ),
//               padding: EdgeInsets.all(12),
//               child: Text(
//                 widget.filteredHomework.comments ?? "No comment",
//                 textAlign: TextAlign.justify,
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),) : SizedBox() ,
//             selectedModule == 'student' ?  SizedBox(height: 20) : SizedBox(),
//             selectedModule == 'teacher' ?  SizedBox(height: 10) : SizedBox(),
//             selectedModule == 'teacher' ? Text("Title"): SizedBox(),
//             selectedModule == 'teacher' ? CustomTextFormFiledBotton(controller: titleController): SizedBox(),
//             selectedModule == 'teacher' ?  SizedBox(height: 10) : SizedBox(),
//             selectedModule == 'teacher' ?   Text("More Details") : SizedBox(),
//             selectedModule == 'teacher' ?  CustomTextFormFiledBotton(controller: moreController,maxline: 5,): SizedBox(),
//             selectedModule == 'teacher' ?  SizedBox(height: 10) : SizedBox(),
//             selectedModule == 'teacher' ?   Text("Comments") : SizedBox(),
//             // selectedModule == 'teacher' ? CustomTextFormFiledBotton(controller: commentsController,maxline: 3,) :SizedBox(),
//             selectedModule == 'teacher' ?  TextFormField(
//               controller: commentsController,
//               maxLines: 5,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Comments",
//               ),
//             ) :SizedBox(),
//             SizedBox(height: 50),
//             selectedModule == 'student' ?
//             Center(
//               child: Container(
//                 width: 190,
//                 decoration: BoxDecoration(
//                   color: (selectedLocation == "PENDING" || selectedLocation == "NEW")
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextButton(
//                   onPressed: (selectedLocation == "PENDING" || selectedLocation == "NEW")
//                       ? () async {
//                     await updateUserData({'status': selectedLocation});
//
//                     setState(() {
//                       selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//                           ? widget.filteredHomework.status
//                           : _statusvalue.first;
//                       titleController.text = widget.filteredHomework.title;
//                       moreController.text = widget.filteredHomework.moreDetails;
//                       // commentsController.text = widget.filteredHomework.comments ?? '';
//                     });
//                     // 🔹 Pop & Refresh
//                     Navigator.pop(context, true);
//                   }
//                       : null,
//                   child: Text("Submit", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             )
//
//           /*Center(
//               child: Container(
//                 width: 190,
//                 decoration: BoxDecoration(
//                   color: (selectedLocation == "PENDING" || selectedLocation == "NEW")
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextButton(
//                      onPressed: (selectedLocation == "PENDING" || selectedLocation == "NEW")
//                          ? () {
//                     // updateUserData({'status': selectedLocation});
//                     updateUserData({'status': selectedLocation});
//                     setState(() {
//                       *//* selectedLocation = _statusvalue.contains(
//                             widget.filteredHomework.status)
//                             ? widget.filteredHomework.status
//                             : _statusvalue.first;*//*
//                       selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//                           ? widget.filteredHomework.status
//                           : _statusvalue.first;
//                       titleController.text = widget.filteredHomework.title;
//                       moreController.text = widget.filteredHomework.moreDetails;
//                       commentsController.text = widget.filteredHomework.comments ?? '';
//                     });
//                     Navigator.pop(context, true);
//                   } : null,
//                   child: Text("Submit", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             )*/ :SizedBox(),
//             /*selectedModule == 'teacher' ?  Center(
//               child: Container(
//                 width: 190,
//                 decoration: BoxDecoration(
//                   color: (selectedLocation == "COMPLETED" || widget.filteredHomework.status == "COMPLETED")  ? Theme.of(context).primaryColor : Colors.grey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextButton(
//                   onPressed: (selectedLocation == "COMPLETED" || widget.filteredHomework.status == "COMPLETED") ? () async {
//                     // updateUserData({'status': selectedLocation});
//                  await updateUserData({'status': selectedLocation});
//                     selectedLocation = _statusvalue.contains(
//                         widget.filteredHomework.status)
//                         ? widget.filteredHomework.status
//                         : _statusvalue.first;
//                     setState(() {
//                       // selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//                       //     ? widget.filteredHomework.status
//                       //     : _statusvalue.first;
//                       // titleController.text = widget.filteredHomework.title;
//                       // moreController.text = widget.filteredHomework.moreDetails;
//                       // commentsController.text = widget.filteredHomework.comments ?? '';
//                     });
//                     // selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//                     //     ? widget.filteredHomework.status
//                     //     : _statusvalue.first;
//                     Navigator.pop(context, true);
//                   } : null,
//                   child: Text("Submit", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ): SizedBox(),*/
//         selectedModule == 'teacher'
//             ? Center(
//           child: Container(
//             width: 190,
//             decoration: BoxDecoration(
//               color: (/*selectedLocation == "COMPLETED" ||*/ widget.filteredHomework.status == "COMPLETED")
//                   ? Colors.grey // Disabled state color
//                   : Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: TextButton(
//               onPressed: (/*selectedLocation == "COMPLETED" ||*/ widget.filteredHomework.status == "COMPLETED")
//                   ? null
//                   : () async {
//                 await updateUserData({'status': selectedLocation});
//
//                 setState(() {
//                   selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
//                       ? widget.filteredHomework.status
//                       : _statusvalue.first;
//                 });
//                 await Future.delayed(Duration(milliseconds: 100));
//                 Navigator.pop(context, true);
//               },
//               child: Text("Submit", style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         )
//             : SizedBox(),
//         ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/response/homework_summary.dart';
import '../../../services/login_service.dart';
import '../edit_profile/edit_profile_screen.dart';

class HomeWorkDetailsScreen extends StatefulWidget {
  final String title;
  final HomeworkDetails filteredHomework;

  const HomeWorkDetailsScreen({
    super.key,
    required this.title,
    required this.filteredHomework,
  });

  @override
  State<HomeWorkDetailsScreen> createState() => _HomeWorkDetailsScreenState();
}

class _HomeWorkDetailsScreenState extends State<HomeWorkDetailsScreen> {
  String? selectedModule;
  List<String> _statusvalue = ['PENDING', 'COMPLETED',];
  late String selectedLocation;

  TextEditingController titleController = TextEditingController();
  TextEditingController moreController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  final String dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _loadUserType();
    // selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
    //     ? widget.filteredHomework.status
    //     : _statusvalue.first;
    selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
        ? widget.filteredHomework.status
        : _statusvalue.first;
    titleController.text = widget.filteredHomework.title;
    moreController.text = widget.filteredHomework.moreDetails;
    commentsController.text = widget.filteredHomework.comments ?? '';
    processComments(widget.filteredHomework.comments ?? '');
    // print("type -->$dateTime");
  }
  Future<void> _loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedModule = prefs.getString('type')?.toLowerCase() ?? 'no type';
    });
    print("Selected Module: $selectedModule");
  }
  /// The API to update student status ///
  // void processComments(String commentsString) {
  //   if (commentsString.isNotEmpty) {
  //     List<String> commentsList =
  //     commentsString.split(';').where((c) => c.trim().isNotEmpty).toList();
  //     String formattedComments = commentsList.join("\n");
  //     commentsController.text = formattedComments;
  //   } else {
  //     commentsController.text = '';
  //   }
  // }

  void processComments(String commentsString) {
    if (commentsString.isNotEmpty) {
      List<String> commentsList = commentsString
          .split(';')
          .where((c) => c.trim().isNotEmpty)
          .toList();

      String formattedComments = commentsList
          .asMap()
          .entries
          .map((entry) => "${entry.key + 1}. ${entry.value.trim()}")
          .join("\n");

      commentsController.text = formattedComments;
    } else {
      commentsController.text = '';
    }
  }


  Future<void> updateUserData(Map<String, dynamic> updatedData) async {
    String? baseUrl = selectedModule == 'teacher'
        ? 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/teacher/${widget.filteredHomework.homeworkId}'
        : 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/student/${widget.filteredHomework.homeworkId}/SUBMITTED';

    final headers = await LoginService.getHeaders();
    final String dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

    print("Current Date: $dateTime");

    try {
      final response = await http.put(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode({
          "status": selectedLocation,
          "moreDetails": moreController.text,
          "title": titleController.text,
          "dueDate": dateTime,
          "comments": commentsController.text,
        }),
      );

      if (response.statusCode == 200) {
        print('User data updated successfully');
        print("Abhi reponse:-${response.body}");
        print("Abhi status:-${response.statusCode}");
        if (mounted) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text("Detail updated successfully")),
          print("Detail update succesfuly");
          selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
              ? widget.filteredHomework.status
              : _statusvalue.first;
          titleController.text = widget.filteredHomework.title;
          moreController.text = widget.filteredHomework.moreDetails;
          // commentsController.text = widget.filteredHomework.comments;
          //);
        }
      } else {
        throw Exception('Failed to update user data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error updating user data: $e");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong!")),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Homework Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Subject: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(widget.filteredHomework.subject,
                          style: TextStyle(
                              fontSize: 16, color: Colors.black54)),
                    ],
                  ),
                  selectedModule == 'teacher'
                      ?  Container(
                    decoration: BoxDecoration(
                      color: selectedLocation == "PENDING"
                          ? Colors.purple
                          : selectedLocation == 'COMPLETED'
                          ? Colors.blueAccent
                          : selectedLocation == 'NEW'
                          ? Colors.amber
                          : Color.fromARGB(255, 7, 122, 66),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton(
                      focusColor: Colors.red,
                      iconEnabledColor: Colors.white,
                      value: selectedLocation,
                      style: TextStyle(color: Colors.white),
                      underline: SizedBox(),
                      dropdownColor: Colors.white,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue!;
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return _statusvalue.map((String value) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(value,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          );
                        }).toList();
                      },
                      items: _statusvalue.map((String location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(location,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ),
                        );
                      }).toList(),
                    ),
                  ): SizedBox(),
                  selectedModule == 'student' ?  Container(
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedLocation == "PENDING"
                            ? Colors.purple
                            : selectedLocation == 'COMPLETED'
                            ? Colors.blueAccent
                            : selectedLocation == 'NEW'
                            ? Colors.amber
                            : Color.fromARGB(255, 7, 122, 66),
                      ), child: Center(child: Text("${widget.filteredHomework.status}",style: TextStyle(color: Colors.white,fontSize: 12),))) : SizedBox(),
                ],
              ),
            ) ,
            SizedBox(height: 20),
            // selectedModule == 'student' ?   Text('Homework Details',
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
            selectedModule == 'student' ?   Text('Title',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
            selectedModule == 'student' ?  SizedBox(height: 15):SizedBox(),
            selectedModule == 'student' ?   Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4)),
                ],
              ),
              padding: EdgeInsets.all(12),
              child:  Text(
                widget.filteredHomework.title,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ): SizedBox(),
            selectedModule == 'student' ?  SizedBox(height: 20) : SizedBox(),
            selectedModule == 'student' ?   Text('More Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
            selectedModule == 'student' ?   SizedBox(height: 20) :SizedBox(),
            selectedModule == 'student' ?   Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4)),
                ],
              ),
              padding: EdgeInsets.all(12),
              child: Text(
                widget.filteredHomework.moreDetails,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ) : SizedBox(),
            selectedModule == 'student' ?  SizedBox(height: 20) : SizedBox(),
            selectedModule == 'student' ?   Text('Comments',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)) : SizedBox(),
            selectedModule == 'student' ? Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4)),
                ],
              ),
              padding: EdgeInsets.all(12),
              child: Text(
                widget.filteredHomework.comments ?? "No comment",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),) : SizedBox() ,
            selectedModule == 'student' ?  SizedBox(height: 20) : SizedBox(),
            selectedModule == 'teacher' ?  SizedBox(height: 10) : SizedBox(),
            selectedModule == 'teacher' ? Text("Title"): SizedBox(),
            selectedModule == 'teacher' ? CustomTextFormFiledBotton(controller: titleController): SizedBox(),
            selectedModule == 'teacher' ?  SizedBox(height: 10) : SizedBox(),
            selectedModule == 'teacher' ?   Text("More Details") : SizedBox(),
            selectedModule == 'teacher' ?  CustomTextFormFiledBotton(controller: moreController,maxline: 5,): SizedBox(),
            selectedModule == 'teacher' ?  SizedBox(height: 10) : SizedBox(),
            selectedModule == 'teacher' ?   Text("Comments") : SizedBox(),
            selectedModule == 'teacher' ? CustomTextFormFiledBotton(controller: commentsController,maxline: 3,) :SizedBox(),
           /* selectedModule == 'teacher' ?  TextFormField(
              controller: commentsController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
               // labelText: "Comments",
              ),
            ) :SizedBox(),*/
            SizedBox(height: 50),
            selectedModule == 'student' ?
            Center(
              child: Container(
                width: 190,
                decoration: BoxDecoration(
                  color: (selectedLocation == "PENDING" || selectedLocation == "NEW")
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: (selectedLocation == "PENDING" || selectedLocation == "NEW")
                      ? () async {
                    await updateUserData({'status': selectedLocation});

                    setState(() {
                      selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
                          ? widget.filteredHomework.status
                          : _statusvalue.first;
                      titleController.text = widget.filteredHomework.title;
                      moreController.text = widget.filteredHomework.moreDetails;
                      // commentsController.text = widget.filteredHomework.comments ?? '';
                    });
                    // 🔹 Pop & Refresh
                    Navigator.pop(context, true);
                  }
                      : null,
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
            )

            /*Center(
              child: Container(
                width: 190,
                decoration: BoxDecoration(
                  color: (selectedLocation == "PENDING" || selectedLocation == "NEW")
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                     onPressed: (selectedLocation == "PENDING" || selectedLocation == "NEW")
                         ? () {
                    // updateUserData({'status': selectedLocation});
                    updateUserData({'status': selectedLocation});
                    setState(() {
                      *//* selectedLocation = _statusvalue.contains(
                            widget.filteredHomework.status)
                            ? widget.filteredHomework.status
                            : _statusvalue.first;*//*
                      selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
                          ? widget.filteredHomework.status
                          : _statusvalue.first;
                      titleController.text = widget.filteredHomework.title;
                      moreController.text = widget.filteredHomework.moreDetails;
                      commentsController.text = widget.filteredHomework.comments ?? '';
                    });
                    Navigator.pop(context, true);
                  } : null,
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
            )*/ :SizedBox(),
            /*selectedModule == 'teacher' ?  Center(
              child: Container(
                width: 190,
                decoration: BoxDecoration(
                  color: (selectedLocation == "COMPLETED" || widget.filteredHomework.status == "COMPLETED")  ? Theme.of(context).primaryColor : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: (selectedLocation == "COMPLETED" || widget.filteredHomework.status == "COMPLETED") ? () async {
                    // updateUserData({'status': selectedLocation});
                 await updateUserData({'status': selectedLocation});
                    selectedLocation = _statusvalue.contains(
                        widget.filteredHomework.status)
                        ? widget.filteredHomework.status
                        : _statusvalue.first;
                    setState(() {
                      // selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
                      //     ? widget.filteredHomework.status
                      //     : _statusvalue.first;
                      // titleController.text = widget.filteredHomework.title;
                      // moreController.text = widget.filteredHomework.moreDetails;
                      // commentsController.text = widget.filteredHomework.comments ?? '';
                    });
                    // selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
                    //     ? widget.filteredHomework.status
                    //     : _statusvalue.first;
                    Navigator.pop(context, true);
                  } : null,
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
            ): SizedBox(),*/
            selectedModule == 'teacher'
                ? Center(
              child: Container(
                width: 190,
                decoration: BoxDecoration(
                  color: (/*selectedLocation == "COMPLETED" ||*/ widget.filteredHomework.status == "COMPLETED")
                      ? Colors.grey // Disabled state color
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: (/*selectedLocation == "COMPLETED" ||*/ widget.filteredHomework.status == "COMPLETED")
                      ? null
                      : () async {
                    await updateUserData({'status': selectedLocation});

                    setState(() {
                      selectedLocation = _statusvalue.contains(widget.filteredHomework.status)
                          ? widget.filteredHomework.status
                          : _statusvalue.first;
                    });
                    await Future.delayed(Duration(milliseconds: 100));
                    Navigator.pop(context, true);
                  },
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
