// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static StreamController<NotificationResponse> streamController =
//       StreamController();
//
//   static onTap(NotificationResponse notificationResponse) {
//     streamController.add(notificationResponse);
//   }
//
//   static Future init() async {
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }
//
//   // Basic Notification
//   static void showBasicNotification(String title) async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//       'id 1',
//       'basic notification',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails details = NotificationDetails(android: android);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Basic Notification',
//       title,
//       details,
//       payload: "Payload Data",
//     );
//   }
//
//   //showSchduledNotification
//   static void showSchduledNotification(String title) async {
//     const AndroidNotificationDetails android = AndroidNotificationDetails(
//       'سفريات العبود جاء من بعيد....',
//       'id 3',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails details = const NotificationDetails(
//       android: android,
//     );
//     tz.initializeTimeZones();
//     log(tz.local.name);
//     log("Before ${tz.TZDateTime.now(tz.local).hour}");
//     final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
//     log(currentTimeZone);
//     tz.setLocalLocation(tz.getLocation(currentTimeZone));
//     log(tz.local.name);
//     log("After ${tz.TZDateTime.now(tz.local).hour}");
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       2,
//       'سفريات العبود جااء من بعيد...',
//       title,
//       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1)),
//       // tz.TZDateTime(
//       //   tz.local,
//       //   2024,
//       //   2,
//       //   10,
//       //   21,
//       //   30,
//       // ),
//       details,
//       payload: 'zonedSchedule',
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }
