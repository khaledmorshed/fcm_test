import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification_service.dart';

//var value = "dAtxzE0gQmmR7iWIx86fqZ:APA91bHRFjnYBNgw0Jj0tNnLW9dRGp9nohw4fYbEu57vbCEzTWM02ENZ5s8pjWjQ-KQSyevjiYz7JNYPp4plYpxk96CWT8SyIz_GFuwpsVeBWlY3R2aXg7l9kGNgkZILUhWqapZJyvjo";
//eZ-5C_jUS3yMxUETj_X7vW:APA91bGd0iBeVLMpS8FEkzKu0qYYAoPQ0QCl9wEi0gZcsNSZQ0aAUr7-c4C0LztnGusz5m5NnI9cS4k0a6PrfvlAGylzXDMP9bKk9Jdko-mEI7ZVdaOraYYvf7A8yCD9QxruL50hR0IH
class FirebaseApiClass{
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications()async{
    print("initNo.....1");
    await firebaseMessaging.requestPermission();
    print("initNo.....2");
    final fCMToken = await firebaseMessaging.getToken();
    print("#FCMTOKEN: $fCMToken");

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // Set up foreground message handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService().showNotification(title: "local", body: "${message.notification?.body}", payLoad: "payload");

      print("onMessage.....: ${message.notification?.title} / ${message.notification?.body}");
      // Handle foreground message here
      dynamic payload ;

      //LocalNotificationService().showNotification(/*title: title,*/ body: "message", payLoad: "payload");

    });

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }

  static Future<void> handleBackgroundMessage(RemoteMessage message)async{
    print("message...1");
  //  if(message == null)return;
    print("message...2");
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");
    print("Payload: ${message.data}");
    dynamic payload ;

    LocalNotificationService().showNotification(title: "local", body: "${message.notification?.body}", payLoad: "payload");

  }

}