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
  final _user2 = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666b');

  @override
  void initState() {
    super.initState();
    _messages.addAll({
      types.TextMessage(
          author: _user,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch,
          id: "m5",
          text: "Contrary to popular belief, Lorem Ipsum is not simply random text."
      ),
      types.TextMessage(
          author: _user2,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch,
          id: "m4",
          text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      ),
      types.TextMessage(
          author: _user2,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch,
          id: "m3",
          text: "I\'m good."
      ),
      types.TextMessage(
          author: _user,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch,
          id: "m2",
          text: "How are you?"
      ),
      types.TextMessage(
          author: _user,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch,
          id: "m1",
          text: "Hello!"
      ),
    });
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
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Chat(
          messages: _messages,
          theme: DefaultChatTheme(
            primaryColor: Color(0xff6a85e5)
          ),
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
