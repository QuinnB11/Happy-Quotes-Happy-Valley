import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hqhv/Screen.dart';
import 'dart:ui';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  tz.initializeTimeZones();
  requestIOSPermissions();
  runApp(MyApp());
}


void requestIOSPermissions() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin  = FlutterLocalNotificationsPlugin();;
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Screen(),
    );
  }
}
