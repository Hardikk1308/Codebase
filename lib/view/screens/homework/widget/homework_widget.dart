import 'package:erp_school/data/models/response/homework_summary.dart';
import 'package:erp_school/view/screens/homework/home_work_details.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/School_service.dart';

class HomeworkService {


  Future<StudentHomework> fetchFinalStudentHomework() async {
    // Get the saved username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    // String? savedUsername = prefs.getString('username');
    String? type = prefs.getString('type')?.toLowerCase();
    int? schoolId = await SchoolService.getSchoolId();
    int? teacherId = prefs.getInt('teacherId');
    int? studentId = prefs.getInt('studentId');
    int? studentGradeId = prefs.getInt('gradeId');
    int? studentSectionId = prefs.getInt('sectionId');
    final monthdate = DateFormat("MM").format(DateTime.now());
    final yeardate = DateFormat("yyyy").format(DateTime.now());

    // print("Fetching homework for Grade: $selectedGradeId, Section: $selectedSectionId");

    final String apiUrl =
        // 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/student/SH1LK000S1//$yeardate';
    "https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/homework/student/$savedUsername/$monthdate/$yeardate";
    print("Url$apiUrl");
    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response into StudentHomework model
        final jsonData = json.decode(response.body);
        print("Abhi response ${response.body}");
        return StudentHomework.fromJson(jsonData);
      } else {
        throw Exception('Failed to load homework: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching homework: $e');
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////
class StudentHomework {
  final HomeworkSummary homeworkSummary;
  final List<HomeworkDetails> homeworkDetailsList;

  StudentHomework({
    required this.homeworkSummary,
    required this.homeworkDetailsList,
  });

  factory StudentHomework.fromJson(Map<String, dynamic> json) {
    return StudentHomework(
      homeworkSummary: HomeworkSummary.fromJson(json['homeworkSummary']),
      homeworkDetailsList: (json['homeworkDetailsList'] as List)
          .map((item) => HomeworkDetails.fromJson(item))
          .toList(),
    );
  }
}

class StudentHomeworkClass extends StatefulWidget {
  final bool teacherHomework;

  const StudentHomeworkClass({super.key, this.teacherHomework = true});

  @override
  State<StudentHomeworkClass> createState() => _StudentHomeworkClassState();
}

class _StudentHomeworkClassState extends State<StudentHomeworkClass> {
  late double height;
  late double width;
  Future<StudentHomework>? classhomeWorkFuture;
  final HomeworkService homeworkService = HomeworkService();
  bool isSeeMore = false;

  @override
  void initState() {
    super.initState();
    classhomeWorkFuture = homeworkService.fetchFinalStudentHomework();
  }

  int? selectedIndex = 1;

  static Future<String?> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("get School idss : ${prefs.getInt("selectedSchoolId")}");
    String? UesrType = await prefs.getString('type');
    return prefs.getString('type');

    // print()
  }
  String? userType;
  Future<void> loadUserType() async {
    userType = await getUserType();
    setState(() {}); // Update UI after getting userType
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'Homework'.tr,
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder<StudentHomework>(
          // future: classhomeWorkFuture,
          // builder: (context, snapshot) {
          //   if (snapshot.connectionState==ConnectionState.done) {
          //     // final homeworkData = snapshot.data!;
          //     // Apply filtering based on selected index
          //     // List<HomeworkDetails> filteredHomework =
          //     //     homeworkData.homeworkDetailsList;
          //     final homeworkData = snapshot.data;
          //     List<HomeworkDetails> filteredHomework =
          //         homeworkData?.homeworkDetailsList ?? [];
          //
          //     if (selectedIndex == 2) {
          //       filteredHomework = filteredHomework
          //           .where((details) => details.status == 'NEW')
          //           .toList();
          //     } else if (selectedIndex == 3) {
          //       filteredHomework = filteredHomework
          //           .where((details) => details.status == 'PENDING')
          //           .toList();
          //     } else if (selectedIndex == 4) {
          //       filteredHomework = filteredHomework
          //           .where((details) => details.status == 'SUBMITTED')
          //           .toList();
          //     } else if (selectedIndex == 5) {
          //       filteredHomework = filteredHomework
          //           .where((details) => details.status == 'COMPLETED')
          //           .toList();
          //     }

          future: classhomeWorkFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState==ConnectionState.done) {
              // final homeworkData = snapshot.data!;
              // Apply filtering based on selected index
              // List<HomeworkDetails> filteredHomework =
              //     homeworkData.homeworkDetailsList;
              final homeworkData = snapshot.data;
              List<HomeworkDetails> filteredHomework =
                  homeworkData?.homeworkDetailsList ?? [];

              if (selectedIndex == 2) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'NEW')
                    .toList();
              } else if (selectedIndex == 3) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'PENDING')
                    .toList();
              } else if (selectedIndex == 4) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'SUBMITTED')
                    .toList();
              } else if (selectedIndex == 5) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'COMPLETED')
                    .toList();
              }

              // ✅ Check if filteredHomework is empty or null
              // if (filteredHomework.isEmpty) {
              //   return const Center(
              //     child: Text(
              //       "No data found",
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              //     ),
              //   );
              // }
              return Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  /*widget.teacherHomework*/
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              "${'all'.tr} (${(homeworkData?.homeworkSummary.totalHomeWorks)??"0"}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 1
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "${'New'.tr} (${(homeworkData?.homeworkSummary.newTasks)??"0"}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 2
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 3
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'pending'.tr +
                                  " (" +
                                  (homeworkData?.homeworkSummary.pending
                                      .toString()??"0") +
                                  ") ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 3
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 4
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 4
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "${'submitted'.tr} (${(homeworkData?.homeworkSummary.submitted)??"0"}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 4
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 5;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 5
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 5
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "${'Checked'.tr} ( ${(homeworkData?.homeworkSummary.completed)??"0"}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 5
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  filteredHomework.isNotEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredHomework.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        /*onTap: () {
                          Get.to(HomeWorkDetailsScreen(
                            title: filteredHomework[index].status,
                            filteredHomework: filteredHomework[index],
                          ));
                        },*/
                        onTap: () async {

                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeWorkDetailsScreen(
                                title: filteredHomework[index].status,
                                filteredHomework: filteredHomework[index],
                              ),
                            ),
                          );
                          if (result == true) {
                            setState(() {
                              loadUserType();
                              classhomeWorkFuture = homeworkService.fetchFinalStudentHomework();
                            });
                            print("Screen Refreshed Successfully!");
                          }

                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color:
                            Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              15.h,
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'sub'.tr + " :",
                                          style: interSemiBold.copyWith(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 14),
                                        ),
                                        5.w,
                                        Text(
                                          filteredHomework[index].subject,
                                          style: interSemiBold.copyWith(
                                              color: Colors.indigo,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 28,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: BoxDecoration(
                                          color: filteredHomework[index]
                                              .status ==
                                              'SUBMITTED'
                                              ? Color.fromARGB(255, 7, 122, 66)
                                              : filteredHomework[index]
                                              .status ==
                                              'PENDING'
                                              ? Colors.purple
                                              : filteredHomework[
                                          index]
                                              .status ==
                                              'NEW'
                                              ? Colors.amber
                                              : Colors.blueAccent,
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          filteredHomework[index].status,
                                          style: interRegular.copyWith(
                                              fontSize: 13,
                                              color: Theme.of(context)
                                                  .cardColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              15.h,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    // userType == "student" ?
                                Row(
                                      children: [
                                        Text(
                                          "Teacher name:  ",
                                          style: interSemiBold.copyWith(
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          filteredHomework[index]
                                              .teachername ?? "no data",
                                          style: interSemiBold.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ) /*: SizedBox()*/,
                                  const SizedBox(height: 10),
                                    Text(
                                      filteredHomework[index].title,
                                      style: interSemiBold.copyWith(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Assigned date",
                                              // details.assignedDate,
                                              style:
                                              interSemiBold.copyWith(
                                                color: Colors.indigo,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              filteredHomework[index]
                                                  .assignedDate,
                                              // details.assignedDate,
                                              style:
                                              interRegular.copyWith(
                                                color: Theme.of(context)
                                                    .disabledColor,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Submission date",
                                              // details.assignedDate,
                                              style:
                                              interSemiBold.copyWith(
                                                color: Colors.indigo,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              filteredHomework[index]
                                                  .dueDate,
                                              style:
                                              interRegular.copyWith(
                                                color: Theme.of(context)
                                                    .disabledColor,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ), // 10.h
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : Center(
                    child: Text(
                      "No homework data found",
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error.toString()}');
            }
            return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
          },
        ),
      ),

    );
  }
}
