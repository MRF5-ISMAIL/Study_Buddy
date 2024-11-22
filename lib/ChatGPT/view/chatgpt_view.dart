import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';  // Add this library
import 'package:flutter_application_chat/ChatGPT/controller/chatgpt_controller.dart';
import 'package:flutter_application_chat/ChatGPT/model/chatgpt_model.dart';
import 'package:flutter_application_chat/widgets/Projects/project_detail_appbar.dart';
import 'package:provider/provider.dart';

class ChatGPT_View extends StatefulWidget {
  final String color;
  final String projectName;
  final String category;

  ChatGPT_View({
    Key? key,
    required this.color,
    required this.projectName,
    required this.category,
  }) : super(key: key);

  @override
  _ChatGPT_ViewState createState() => _ChatGPT_ViewState();
}

class _ChatGPT_ViewState extends State<ChatGPT_View> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<ChatController>(
          builder: (context, viewModel, child) {
            return Stack(
              children: [
                _buildChatContent(context, viewModel),
                _buildMessageInput(context, viewModel),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildChatContent(BuildContext context, ChatController viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectDetailAppBar(
              category: widget.category,
              color: widget.color,
              projectName: widget.projectName,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(viewModel.messages[index]);
                },
              ),
            ),
            if (viewModel.isSending)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            if (viewModel.messages.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "ابدأ المحادثة!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context, ChatController viewModel) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.grey.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "أدخل رسالة...",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.send, color: Colors.blue),
              onPressed: () {
                final message = _controller.text.trim();
                if (message.isNotEmpty) {
                  viewModel.sendMessageToCopilot(message);
                  _controller.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }Widget _buildMessageBubble(ChatMessage message) {
  return Align(
    alignment: message.role == 'user' ? Alignment.centerRight : Alignment.centerLeft,
    child: Row(
      mainAxisAlignment: message.role == 'user' ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // إضافة صورة البروفايل إذا كانت الرسالة من الشات بوت
        if (message.role != 'user')
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/ChatGPT-removebg-preview.png'), // رابط صورة البروفايل
              radius: 18, // حجم الصورة
            ),
          ),
        // مربع الرسالة
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          constraints: BoxConstraints(
            maxWidth: 250, // الحد الأقصى لعرض الرسالة
          ),
          decoration: BoxDecoration(
            color: message.role == 'user' ? Colors.blueAccent : Colors.grey.shade700,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: message.role == 'user'
              ? Text(
                  message.content.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              : TypewriterAnimatedTextKit(
                  text: [message.content.toString()],
                  speed: Duration(milliseconds: 80),
                  totalRepeatCount: 1,  // عرض النص مرة واحدة فقط
                  isRepeatingAnimation: false,  // التوقف بعد الكتابة مرة واحدة
                  displayFullTextOnTap: false,
                  stopPauseOnTap: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
        ),
      ],
    ),
  );
}


}