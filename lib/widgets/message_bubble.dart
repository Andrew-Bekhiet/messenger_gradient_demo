import 'package:flutter/material.dart';
import 'package:messenger_gradient_demo/models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, {super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Align(
      alignment:
          message.senderIsMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: mediaQuery.size.width * 0.80),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: message.senderIsMe ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.senderIsMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
