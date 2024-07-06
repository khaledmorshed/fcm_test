import 'package:flutter/material.dart';

import 'api/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fcm"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("FCM"),
          ),
          ElevatedButton(onPressed: (){
            dynamic payload ;
            LocalNotificationService().showNotification(
                body: "lat=",
                payLoad: "payload"
            );
          }, child: Text("local noti"))
        ],
      ),
    );
  }
}
