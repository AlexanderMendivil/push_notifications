//SHA1: DF:09:31:50:DC:B4:C6:11:DD:B7:72:54:4B:F1:68:DA:A5:DF:36:0A

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStreamController = StreamController.broadcast();
  
  static Stream<String> get messagesStream => _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['product'] ?? 'no-data');
  }
  static Future _onMessageHandler(RemoteMessage message) async {
    _messageStreamController.add(message.data['product'] ?? 'no-data');
  }
  static Future _onMessageOpenApp(RemoteMessage message) async {
    _messageStreamController.add(message.data['product'] ?? 'no-data');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);
    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );
  }

  static _closeStream(){
    _messageStreamController.close();
  }
}