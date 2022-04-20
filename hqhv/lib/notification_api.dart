import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class NotificationAPI{

  static final _notification = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(
        
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload
  }) async => 
      _notification.show(
        id,
        title, 
        body, 
        await _notificationDetails(), 
        payload: payload
        );

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async => 
      _notification.zonedSchedule(
        id,
        title, 
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        await _notificationDetails(), 
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime
        );
    
    // static tz.TZDateTime _scheduleDaily(Time time) {
    //   final now = tz.TZDateTime.now(tz.local);
    //   final scheduledDate = tz.TZDateTime(
    //     tz.local,
    //     now.year,
    //     now.month,
    //     now.day,
    //   );

    //   return scheduledDate.isBefore(now)
    //     ? scheduledDate.add(Duration(days: 1))
    //     : scheduledDate;
    // }
}