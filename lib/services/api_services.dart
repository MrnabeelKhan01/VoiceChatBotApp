import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = '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';

class ApiServices {
  static String baseUrl = 'https://api.openai.com/v1/completions';
  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };

  static Future<String> sendMessageToServer( String ?message) async {
    print(message.toString() + "get data from api");
    var response = await http.post(
      Uri.parse("https://api.openai.com/v1/completions"),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": '$message',
        "temperature": 0,
        "max_tokens": 100,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["Human:", "AI:"]
      }),
    );
    print(response.request!.url);
    print(response.statusCode);
    print(response.body);
    var msg;
    if(response.statusCode==200){
      var data=jsonDecode(response.body.toString());
      msg =data['choices'][0]['text'];

    }
    else{
      print("Failed to get Data");
    }
    return msg;
  }
}
