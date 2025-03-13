// // import 'dart:convert';
// //
// // import 'package:dio/dio.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:get/get.dart';
// //
// // import '../utils/app_constant.dart';
// // // import 'package:mosead/app_resources/app_images.dart';
// // // import 'package:mosead/backend/config.dart';
// // // import 'package:mosead/backend/services/messages/responses/message_service.dart';
// // // import 'package:mosead/backend/services/sockets/mosead_socket_manager.dart';
// // // import 'package:mosead/backend/services/user/user_client.dart';
// // // import 'package:mosead/common/overlaywidgets/ms_toast.dart';
// // // import 'package:mosead/logging/ms_logger.dart';
// // // import 'package:mosead/notifications/tray_call_manager.dart';
// // //
// // // import '../app_resources/app_constants.dart';
// // // import '../firebase_options.dart';
// // // import '../ms_navigator.dart';
// //
// // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// //
// // Future<void> _initializeFirebaseApp() {
// //   return Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _onBackgroundNotification(RemoteMessage message) async {
// //   await _initializeFirebaseApp();
// //   return await _onReceiveNotification(message, true);
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _onForegroundNotification(RemoteMessage message) {
// //   return _onReceiveNotification(message, false);
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _onReceiveNotification(RemoteMessage message, bool isBackgroundNotification) async {
// //   print("${message.data}, $_onReceiveNotification");
// //
// //   Map<String, dynamic> notificationData = message.data;
// //
// //   final callEndTime = (DateTime.tryParse(notificationData['callStartTime'] ?? '') ?? DateTime(1999)).add(const Duration(seconds: 30));
// //
// //   // if (notificationData.containsKey("callType")) {
// //   //   if (callEndTime.difference(DateTime.now()).inSeconds.abs() > 30) {
// //   //     return;
// //   //   }
// //   //   if (isBackgroundNotification) {
// //   //     await UserClient().initialize();
// //   //     notificationData['caller'] = UserClient().getUser().toJson();
// //   //   }
// //   //   TrayCallManager().showCall(notificationData);
// //   //   return;
// //   // }
// //
// //   String senderName = notificationData['sender_name'] ?? "Deleted User";
// //   String userProfilePhoto = notificationData['profile_photo'] ?? PlaceHolders.profileImage;
// //   userProfilePhoto = userProfilePhoto.startsWith('http') ? userProfilePhoto : "${AppConstants.baseUrl}/$userProfilePhoto";
// //
// //   AndroidBitmap<Object>? largeIcon;
// //   try {
// //     final response = await Dio().get(
// //       userProfilePhoto,
// //       options: Options(responseType: ResponseType.bytes),
// //     );
// //     if (response.statusCode == 200) {
// //       largeIcon = ByteArrayAndroidBitmap(response.data);
// //     }
// //   } catch (_) {}
// //
// //   List<String> unreadMessages = notificationData['unread_messages'] is String
// //       ? List<String>.from(jsonDecode(notificationData['unread_messages']))
// //       : [];
// //   var style = InboxStyleInformation(
// //     unreadMessages.length > 1 ? unreadMessages : [],
// //     summaryText: "${unreadMessages.length} messages",
// //   );
// //
// //   AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //     'mosead_push_notifications',
// //     AppConstants.appName,
// //     channelDescription: 'Notifications of ${AppConstants.appName}.',
// //     importance: Importance.max,
// //     priority: Priority.high,
// //     styleInformation: style,
// //     largeIcon: largeIcon,
// //
// //     actions: <AndroidNotificationAction>[
// //       const AndroidNotificationAction(
// //         'action_reply',
// //         'Reply',
// //         allowGeneratedReplies: true,
// //         cancelNotification: true,
// //         inputs: [AndroidNotificationActionInput(label: "Reply here")],
// //       ),
// //     ],
// //     ticker: 'ticker',
// //   );
// //
// //   NotificationDetails platformChannelSpecifics =
// //   NotificationDetails(android: androidPlatformChannelSpecifics);
// //
// //   await flutterLocalNotificationsPlugin.show(
// //     generateUniqueId(message.messageId ?? 'mosead'),
// //     senderName,
// //     unreadMessages.isNotEmpty ? unreadMessages.last : '',
// //     platformChannelSpecifics,
// //     payload: jsonEncode({'screen': MsNavigator.chatRoute, MsNavigatorKeys.user: notificationData['user_id'], MsNavigatorKeys.roomId: notificationData['room_id']}),
// //   );
// //
// //   print("showing notification");
// // }
// //
// //
// // int generateUniqueId(String inputString) {
// //   const prime = 31;
// //   int hash = 0;
// //   for (int i = 0; i < inputString.length; i++) {
// //     hash = (prime * hash + inputString.codeUnitAt(i)) % 2147483647;
// //   }
// //   return hash;
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _onBackgroundNotificationResponse(NotificationResponse response) {
// //   try {
// //     return _onReceiveNotificationResponse(response, jsonDecode(response.payload!), true);
// //   } catch (error) {
// //     return _onReceiveNotificationResponse(response, {}, true);
// //   }
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _onForegroundNotificationResponse(NotificationResponse response) {
// //   try {
// //     return _onReceiveNotificationResponse(response, jsonDecode(response.payload!), false);
// //   } catch (error) {
// //     return _onReceiveNotificationResponse(response, {}, true);
// //   }
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _onReceiveNotificationResponse(NotificationResponse? response, Map<String, dynamic> payload, bool fromBackground) async {
// //   msDebug("$payload -> ${response?.actionId}: ${response?.input}", tag: '_onReceiveNotificationResponse');
// //
// //   if (response?.actionId == 'action_reply') {
// //     MsToast.show("Replied with '${response?.input}'");
// //     _sendMessage(payload['user'], payload['roomId'], response?.input??'');
// //   }
// // }
// //
// // @pragma("vm:entry-point")
// // Future<void> _sendMessage(String userId, String chatId, String message) async {
// //   MessageService messageService;
// //   try {
// //     messageService = Get.find<MessageService>();
// //   } catch (error) {
// //     messageService = MessageService();
// //     Get.put(MoseadSocketManager());
// //     await UserClient().initialize();
// //   }
// //   await messageService.sendMessage(roomId: chatId, content: message, mediaFiles: []);
// // }
// //
// // class FCMIMPL {
// //   static final FCMIMPL _instance = FCMIMPL._internal();
// //   late FirebaseMessaging fcm = FirebaseMessaging.instance;
// //
// //   factory FCMIMPL() {
// //     return _instance;
// //   }
// //
// //   FCMIMPL._internal();
// //
// //   Future<String?> initialize() async {
// //     await _initializeFirebaseApp();
// //
// //     const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
// //     const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
// //
// //     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
// //         onDidReceiveNotificationResponse: _onForegroundNotificationResponse,
// //         onDidReceiveBackgroundNotificationResponse: _onBackgroundNotificationResponse
// //     );
// //
// //     FirebaseMessaging.onMessageOpenedApp.listen((msg) {
// //       _onReceiveNotificationResponse(null, msg.data, true);
// //     });
// //
// //     var msg = await fcm.getInitialMessage();
// //     if (msg?.data != null) {
// //       _onReceiveNotificationResponse(null, msg!.data, true);
// //     }
// //
// //     FirebaseMessaging.onMessage.listen(_onForegroundNotification);
// //     FirebaseMessaging.onBackgroundMessage(_onBackgroundNotification);
// //
// //     final NotificationAppLaunchDetails? notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
// //     if (notificationAppLaunchDetails != null && notificationAppLaunchDetails.didNotificationLaunchApp) {
// //       if (notificationAppLaunchDetails.notificationResponse != null) {
// //        // msDebug(notificationAppLaunchDetails.notificationResponse?.payload, tag: "FROM FCM");
// //         print("fcm token ${notificationAppLaunchDetails.notificationResponse?.payload}");
// //         _onForegroundNotificationResponse(notificationAppLaunchDetails.notificationResponse!); // TODO May cause double response
// //       }
// //     }
// //
// //   //  msDebug(await fcm.getToken(), tag: 'tokebnbb');
// //
// //
// //     return await fcm.getToken();
// //   }
// //
// //   Future<void> temp() async {
// //
// //     // Map<String, dynamic> notificationData = {
// //     //   'sender_name': 'Ishwar',
// //     //   'unread_messages': ['Hello', 'This is test of local notifications']
// //     // };
// //     //
// //     // List<String> unreadMessages = notificationData['unread_messages'] is List ? List<String>.from(notificationData['unread_messages']) : [];
// //     // var style = InboxStyleInformation(
// //     //   unreadMessages.length > 1 ? unreadMessages : [],
// //     //   summaryText: "${unreadMessages.length} messages",
// //     // );
// //     //
// //     // AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //     //   'mosead_push_notifications',
// //     //   AppConstants.appName,
// //     //   channelDescription: 'Notifications of ${AppConstants.appName}.',
// //     //   importance: Importance.max,
// //     //   priority: Priority.high,
// //     //   styleInformation: style,
// //     //   largeIcon: null, // Set large icon only if image exists
// //     //   actions: <AndroidNotificationAction>[
// //     //     const AndroidNotificationAction('action_reply', 'Reply', allowGeneratedReplies: true, cancelNotification: true, inputs: [AndroidNotificationActionInput(label: "Reply here")]),
// //     //   ],
// //     //   ticker: 'ticker',
// //     // );
// //     //
// //     // NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
// //     //
// //     // await flutterLocalNotificationsPlugin.show(
// //     //     28,
// //     //     notificationData['sender_name'] ?? 'Deleted User',
// //     //     unreadMessages.isNotEmpty ? unreadMessages[unreadMessages.length - 1] : '',
// //     //     platformChannelSpecifics,
// //     //     payload: jsonEncode({'screen': '/welcomeRoute', MsNavigatorKeys.user: '6740508c83182e37faebf60c',  MsNavigatorKeys.roomId: '67175173c94f71e9abdd7afe' })
// //     // );
// //     //
// //     // msDebug("showing notification");
// //
// //
// //     // _audioPlayer.play(AssetSource('ringtone.mp3'), loop: true);
// //
// //     // await Future.delayed(Duration(seconds: 2));
// //     //
// //     // await FlutterCallkitIncoming.showCallkitIncoming(const CallKitParams(
// //     //   id: "12345",
// //     //   nameCaller: "Ishwar",
// //     //   appName: "MoSead",
// //     //   avatar: "",
// //     //   duration: 30000
// //     // ));
// //
// //     _onReceiveNotification(const RemoteMessage(), false);
// //   }
// //
// //   Future<NotificationSettings> requestPermission() {
// //     return fcm.requestPermission(
// //       alert: true,
// //       announcement: false,
// //       badge: true,
// //       carPlay: false,
// //       criticalAlert: false,
// //       provisional: false,
// //       sound: true
// //     );
// //   }
// //
// //   Future<void> logout() {
// //     return fcm.deleteToken();
// //   }
// // }
//
// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//
//   NotificationService._internal();
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   Future<void> initialize() async {
//     await Firebase.initializeApp();
//     await _requestPermission();
//     await _setupLocalNotifications();
//     await _getFCMToken();
//     _setupFCMListeners();
//   }
//
//   /// Step 1: Notification Permission Maange
//   Future<void> _requestPermission() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("Notification Permission Granted");
//     } else {
//       print("Notification Permission Denied");
//     }
//   }
//
//   /// FCM Token Fetch Kare
//   Future<void> _getFCMToken() async {
//     String? token = await _firebaseMessaging.getToken();
//     print("FCM Token: $token");
//   }
//
//   /// Local Notification Setup Kare
//   Future<void> _setupLocalNotifications() async {
//     const AndroidInitializationSettings androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initSettings = InitializationSettings(android: androidInitSettings);
//
//     await _localNotificationsPlugin.initialize(initSettings,
//       onDidReceiveNotificationResponse: (response) {
//         _handleNotificationClick(response.payload);
//       },
//     );
//   }
//
//   /// Foreground aur Background Notification Listeners
//   void _setupFCMListeners() {
//     // Foreground notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Foreground Notification: ${message.notification?.title}");
//       _showLocalNotification(message);
//     });
//
//     // Background/Terminated notification click handle
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("User ne notification par click kiya: ${message.data}");
//       _handleNotificationClick(jsonEncode(message.data));
//     });
//
//     // Terminated state me notification se open hone par
//     _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
//       if (message != null) {
//         print("App terminated state me notification click: ${message.data}");
//         _handleNotificationClick(jsonEncode(message.data));
//       }
//     });
//   }
//
//   /// Local Notification Show Karne Ka Function
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//       'channel_id', 'App Notifications',
//       channelDescription: 'This is a test notification channel',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//
//     const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);
//
//     await _localNotificationsPlugin.show(
//       0, // Notification ID
//       message.notification?.title ?? "No Title",
//       message.notification?.body ?? "No Body",
//       platformDetails,
//       payload: jsonEncode(message.data),
//     );
//   }
//
//   /// Step 6: Notification Click Handle Karna
//   void _handleNotificationClick(String? payload) {
//     if (payload != null) {
//       Map<String, dynamic> data = jsonDecode(payload);
//       print("Navigate to: ${data['screen']}");
//       // Yaha navigation ya koi action perform kar sakte hain
//     }
//   }
// }