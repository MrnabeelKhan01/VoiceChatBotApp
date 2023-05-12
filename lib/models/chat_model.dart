import 'package:voice_chatbot/applications/enum.dart';

class ChatMessage {
  ChatMessage({required this.text, required this.type});

  String? text;
  ChatMessageType? type;
}
