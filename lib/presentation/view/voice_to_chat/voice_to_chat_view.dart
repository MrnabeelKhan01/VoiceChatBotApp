import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_chatbot/applications/enum.dart';
import 'package:voice_chatbot/configurations/frontend_configs.dart';
import 'package:voice_chatbot/services/api_services.dart';

import '../../../models/chat_model.dart';
import 'layout/body.dart';

class VoiceToChatView extends StatefulWidget {
  VoiceToChatView({
    Key? key,
    this.text = "Hold Button",
  }) : super(key: key);
  String text;

  @override
  State<VoiceToChatView> createState() => _VoiceToChatViewState();
}

class _VoiceToChatViewState extends State<VoiceToChatView> {
  var isListening = false;
  SpeechToText speechToText = SpeechToText();
  final List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: FrontendConfigs.kPrimaryColor.withOpacity(0.5),
        duration: const Duration(milliseconds: 2000),
        showTwoGlows: true,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        endRadius: 45.0,
        child: Material(
          elevation: 7.0,
          shape: const CircleBorder(),
          child: GestureDetector(
            onTapDown: (details) async {
              if (!isListening) {
                var available = await speechToText.initialize();
                if (available) {
                  setState(() {
                    isListening = true;
                    speechToText.listen(onResult: (result) {
                      print( result.recognizedWords.toString() + "----------");
                      setState(() {
                        widget.text = result.recognizedWords;
                      });
                    });
                  });
                }
              }
            },
            onTapUp: (details) async {
              setState(() {
                isListening = false;
              });
              speechToText.stop();
              messages.add(
                  ChatMessage(text: widget.text, type: ChatMessageType.user));
              var msg = await ApiServices.sendMessageToServer(widget.text);
              print(msg.toString() + "Hi===================");
              setState(() {
                messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
              });
            },
            child: CircleAvatar(
              backgroundColor: FrontendConfigs.kPrimaryColor,
              radius: 30.0,
              child: isListening
                  ? const Icon(
                      Icons.mic,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.mic_none,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FrontendConfigs.kPrimaryColor,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        centerTitle: true,
        title: const Text(
          'Speech to Text',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: VoiceToChatBody(
        text: widget.text, message:messages,
      ),
    );
  }
}
