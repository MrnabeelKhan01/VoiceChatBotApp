import 'package:flutter/material.dart';
import 'package:voice_chatbot/applications/enum.dart';
import 'package:voice_chatbot/configurations/frontend_configs.dart';
import 'package:voice_chatbot/models/chat_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
    required this.type,
  }) : super(key: key);
  final String message;
  final ChatMessageType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 5, top: 18),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: type == ChatMessageType.bot
                ? const AssetImage('assets/images/gpt_logo.png')
                : const AssetImage('assets/images/ds_logo.png'),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: FrontendConfigs.kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Text(
                  message,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
