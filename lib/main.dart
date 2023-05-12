import 'package:flutter/material.dart';
import 'package:voice_chatbot/presentation/view/splash_screen/splash_view.dart';

import 'presentation/view/voice_to_chat/voice_to_chat_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily:'Geomanist-Regular.otf',
            scaffoldBackgroundColor:Colors.white
      ),
     home: VoiceToChatView(),
    );
  }
}