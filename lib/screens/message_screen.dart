import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
   
  const MessageScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final atgs = (ModalRoute.of(context)?.settings.arguments ?? 'no-data') as String;
    return Scaffold(
      appBar: AppBar(
         title: const Text('MessageScreen'),
      ),
      body: Center(
         child: Text(atgs, style: const TextStyle(fontSize: 30),),
      ),
    );
  }
}