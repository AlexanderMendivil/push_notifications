import 'package:flutter/material.dart';
import 'package:notifications/screens/screens.dart';
import 'package:notifications/services/services.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    // TODO: implement initState
    PushNotificationService.messagesStream.listen((message) { 

      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    });
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': ( _ ) =>  const HomeScreen(),
        'message': ( _ ) =>  const MessageScreen()

      },
    );
  }
}