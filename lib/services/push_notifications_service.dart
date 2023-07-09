//SHA1: DF:09:31:50:DC:B4:C6:11:DD:B7:72:54:4B:F1:68:DA:A5:DF:36:0A

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;


  static Future _backgroundHandler(RemoteMessage message) async {
    print('on background Handler ${message.messageId}');
  }
  static Future _onMessageHandler(RemoteMessage message) async {
    print('on message Handler ${message.messageId}');
  }
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('on open app Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);
    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );
  }
}