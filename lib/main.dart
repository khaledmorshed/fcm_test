import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_with_fcm/api/firebase_api_class.dart';

import 'api/local_notification_service.dart';
import 'home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService().initNotification();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyD-s-UxLopF1HMn-j4KPWSaM0aJJnYWNs8',
        appId: '1:142114978940:android:ec733baa123ef0fc275df9',
        messagingSenderId: '142114978940',
        projectId: 'push-notification-with-f-8b80a',
        storageBucket: 'push-notification-with-f-8b80a.appspot.com',
      ),
  );
 // await Firebase.initializeApp();

  await FirebaseApiClass().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
