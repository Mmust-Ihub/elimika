import 'package:elimika/state/chat/chatProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message {
  final String text;
  final String role;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.role,
    required this.timestamp,
  });
}

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();

  // void _sendMessage() {
  //   if (_messageController.text.trim().isEmpty) return;

  //   setState(() {
  //     _messages.add(Message(
  //       text: _messageController.text,
  //       isUser: true,
  //       timestamp: DateTime.now(),
  //     ));

  //     // Simulate AI response
  //     // Future.delayed(const Duration(seconds: 1), () {
  //     //   setState(() {
  //     //     _messages.add(Message(
  //     //       text: "This is a simulated AI response.",
  //     //       isUser: false,
  //     //       timestamp: DateTime.now(),
  //     //     ));
  //     //   });
  //     //   _scrollToBottom();
  //     // });
  //     if (_messageController.text != '' && _messageController.text.isNotEmpty) {
  //        ref.read(chatProvider.notifier).chat(
  //         _messageController.text,
  //         _messages,
  //       );
  //       _messages.add(Message(
  //         text: "This is a simulated AI response.",
  //         isUser: false,
  //         timestamp: DateTime.now(),
  //       ));

  //     }
  //   });

  //   _messageController.clear();
  //   _scrollToBottom();
  // }
  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    String userMessage = _messageController.text;
    _messageController.clear();

    print("User message: $userMessage");

    // Add user message to UI
    setState(() {
      _messages.add(Message(
        text: userMessage,
        role: 'user',
        timestamp: DateTime.now(),
      ));
    });

    _scrollToBottom();

    List<Map<String, dynamic>> history = [];

    // Get chat history
    for (var message in _messages) {
      history.add({
        'parts': [
          message.text,
        ],
        'role': message.role,
      });
    }

    // Send message to API
    await ref.read(chatProvider.notifier).chat(userMessage, history);

    // Get chatbot response
    final chatState = ref.read(chatProvider);
    if (chatState.response != null) {
      print("Chatbot response: ${chatState.response}");
      setState(() {
        _messages.add(Message(
          text: chatState.response!, // Chatbot's response
          role: 'model',
          timestamp: DateTime.now(),
        ));
      });
    }

    _scrollToBottom();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    print(chatState.response);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.android, color: Colors.blue),
            ),
            const SizedBox(width: 12),
            const Text('AI Chat Assistant'),
          ],
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _MessageBubble(message: message);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: _sendMessage,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;

  const _MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.role == 'user' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: message.role == 'user' ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.role == 'user' ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: message.role == 'user' ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
