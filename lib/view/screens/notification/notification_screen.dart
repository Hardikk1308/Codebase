// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/notification_model.dart';
// import 'package:erp_school/services/attendance_service.dart';
// import 'package:erp_school/services/notification_service.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:erp_school/view/screens/notification/announcement_screen.dart';
// import 'package:erp_school/view/screens/notification/widget/notification_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../base/custom_Image.dart';
//
// class NotificationScreen extends StatefulWidget {
//   final bool notification;
//   final String userType;
//
//   const NotificationScreen(
//       {super.key, this.notification = false, required this.userType});
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   int? selectedIndex = 1;
//   late Future<List<NotificationModel>> notificationsFuture;
//   final NotificationService _notificationService = NotificationService();
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch notifications when the screen initializes
//     notificationsFuture =
//         _notificationService.fetchNotifications(widget.userType);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: widget.notification
//           ? FloatingActionButton(
//               backgroundColor: Theme.of(context).primaryColor,
//               onPressed: () {
//                 Get.to(AnnouncementScreen());
//               },
//               child: Container(
//                 height: 64,
//                 width: 64,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Theme.of(context).primaryColor),
//                 child: Center(
//                   child: Icon(
//                     Icons.add,
//                     color: Theme.of(context).cardColor,
//                   ),
//                 ),
//               ),
//             )
//           : null,
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(
//         title: 'notification'.tr,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 40,
//               ),
//               FutureBuilder<List<NotificationModel>>(
//                 future: notificationsFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(
//                         child: Text('No notifications available'));
//                   } else {
//                     final notifications = snapshot.data!;
//                     return Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 1;
//                             });
//                           },
//                           child: Container(
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 1
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.primary,
//                               border: Border.all(
//                                 color: selectedIndex == 1
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               'all'.tr,
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 1
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 2;
//                             });
//                           },
//                           child: Container(
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 2
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.primary,
//                               border: Border.all(
//                                 color: selectedIndex == 2
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               'school'.tr,
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 2
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 3;
//                             });
//                           },
//                           child: Container(
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 3
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.primary,
//                               border: Border.all(
//                                 color: selectedIndex == 3
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               'class'.tr,
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 3
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//               // Use FutureBuilder to fetch and display notifications
//               FutureBuilder<List<NotificationModel>>(
//                 future: notificationsFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(
//                         child: Text('No notifications available'));
//                   } else {
//                     final notifications = snapshot.data!;
//                     return ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: notifications.length,
//                       itemBuilder: (context, index) {
//                         final notification = notifications[index];
//                         return NotificationWidget(notification: notification);
//                       },
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class NotificationWidget extends StatelessWidget {
//   final NotificationModel notification;
//
//   const NotificationWidget({
//     super.key,
//     required this.notification,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             notification.notificationDate/*   DateFormat("EEEE").format(DateTime.parse(notification.notificationDate))*/ ,
//             style: interMedium.copyWith(
//               color: Theme.of(context).disabledColor,
//               fontSize: 16,
//             ),
//           ),
//           15.h,
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.shade300,
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const ClipRRect(
//                       child: CustomImage(
//                         image: '',
//                         height: 60,
//                         width: 60,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         notification.notificationTitle, // Dynamic title
//                         style: interMedium.copyWith(
//                             color: Theme.of(context).disabledColor,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.calendar_month_sharp,
//                       color: Theme.of(context).primaryColor,
//                       size: 18,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       DateFormat("dd-MM-yyy hh:mm a").format(DateTime.parse(notification.notificationDate)),
//                       // Dynamic date
//                       style: interMedium.copyWith(
//                         color: Theme.of(context).primaryColor,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   notification.notificationMessage, // Dynamic message
//                   style: interRegular.copyWith(
//                     color: Theme.of(context).disabledColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:erp_school/data/models/response/notification_model.dart';
import 'package:erp_school/services/notification_service.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/notification/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationScreen extends StatefulWidget {
  final bool notification;
  final String userType;

  const NotificationScreen(
      {super.key, this.notification = false, required this.userType});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int? selectedIndex = 1;
  late Future<List<NotificationModel>> notificationsFuture;
  final NotificationService _notificationService = NotificationService();
  // Function to filter notifications based on selectedIndex
  List<NotificationModel> filterNotifications(List<NotificationModel> notifications) {
    if (selectedIndex == 1) {
      return notifications;
    } else if (selectedIndex == 2) {
      return notifications.where((notification) => notification.visibility == 'Teacher').toList();
    } else if (selectedIndex == 3) {
      return notifications.where((notification) => notification.visibility == 'Student').toList();
    }
    return notifications;
  }

  @override
  void initState() {
    super.initState();
    // Fetch notifications when the screen initializes
    notificationsFuture =
        _notificationService.fetchNotifications(widget.userType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* floatingActionButton: widget.notification
          ? FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.to(AnnouncementScreen());
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).cardColor,
            ),
          ),
        ),
      )
          : null,*/
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'notification'.tr,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              FutureBuilder<List<NotificationModel>>(
                future: notificationsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No notifications available'));
                  } else {
                    final notifications = snapshot.data!;
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.primary,
                              border: Border.all(
                                color: selectedIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'all'.tr,
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
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.primary,
                              border: Border.all(
                                color: selectedIndex == 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'school'.tr,
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
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.primary,
                              border: Border.all(
                                color: selectedIndex == 3
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'class'.tr,
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 3
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              // Use FutureBuilder to fetch and display notifications
              FutureBuilder<List<NotificationModel>>(
                future: notificationsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.transparent,));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No notifications available'));
                  } else {
                    final filteredNotifications = filterNotifications(snapshot.data!);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = filteredNotifications[index];
                        return NotificationWidget(notification: notification);
                      },
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}