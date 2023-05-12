import 'package:flutter/material.dart';
import 'package:voice_chatbot/applications/enum.dart';
import 'package:voice_chatbot/models/chat_model.dart';
import 'package:voice_chatbot/presentation/elements/chat_bubble.dart';

class VoiceToChatBody extends StatefulWidget {
  const VoiceToChatBody({
    Key? key,
    required this.text,
    required this.message,
  }) : super(key: key);
  final String text;
  final List<ChatMessage> message;

  @override
  State<VoiceToChatBody> createState() => _VoiceToChatBodyState();
}

class _VoiceToChatBodyState extends State<VoiceToChatBody> {
  var scrollController = ScrollController();

  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
    ChatMessageType ?type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Text(
            widget.text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.teal,
              ),
              child: ListView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.message.length,
                  itemBuilder: (context, i) {
                   var chat =widget.message[i];
                    return ChatBubble(
                      message: widget.message[i].text.toString(),
                      type:chat.type!,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
