import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  @override
  void initState() {
    super.initState();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "abc",
      text: message.text,
    );
    _addMessage(textMessage);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Chat(
          messages: _messages,
          theme: DarkChatTheme(),
          // onAttachmentPressed: _handleAtachmentPressed,
          // onMessageTap: _handleMessageTap,
          // onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      ),
    );
  }
}
