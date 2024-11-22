import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_chat/ChatGPT/model/chatgpt_model.dart';
import 'package:flutter_application_chat/ChatGPT/model/copilot_response.dart';
import 'package:http/http.dart' as http;

class ChatController with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isSending = false;

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isSending => _isSending;

  Future<void> sendMessageToCopilot(String message) async {
    if (message.isEmpty) return;

    _addUserMessage(message);
    _setSendingState(true);

    try {
      final copilotResponse = await _fetchCopilotResponse(message);
      if (copilotResponse != null) {
        print("Response Message: ${copilotResponse.message}");
        _addCopilotMessage(copilotResponse.message);
      } else {
        _addErrorMessage("فشل في الحصول على الرد.");
      }
    } catch (e) {
      _addErrorMessage("حدث خطأ: $e");
    } finally {
      _setSendingState(false);
    }
  }

  Future<CopilotResponse?> _fetchCopilotResponse(String message) async {
    final url = Uri.parse('https://copilot5.p.rapidapi.com/copilot');
    final headers = {
      'x-rapidapi-key': 'b9d32fc4abmsh0d4671975365793p169a2cjsn39862a4a55eb', // قم بتخزين المفتاح بطريقة آمنة
      'x-rapidapi-host': 'copilot5.p.rapidapi.com',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'message': message,
      'tone': 'BALANCED',
      'markdown': false,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("API Response: $data");

      // إنشاء الكائن CopilotResponse من البيانات
      return CopilotResponse.fromJson(data);
    } else {
      print("HTTP Error: ${response.statusCode}");
    }
    return null;
  }

  void _addUserMessage(String content) {
    _messages.add(ChatMessage(role: 'user', content: content));
    notifyListeners();
  }

  void _addCopilotMessage(String content) {
    _messages.add(ChatMessage(role: 'copilot', content: content));
    notifyListeners();
  }

  void _addErrorMessage(String error) {
    _messages.add(ChatMessage(role: 'copilot', content: error));
    notifyListeners();
  }

  void _setSendingState(bool state) {
    _isSending = state;
    notifyListeners();
  }
}
