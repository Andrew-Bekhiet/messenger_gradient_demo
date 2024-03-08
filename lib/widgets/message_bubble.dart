import 'package:flutter/material.dart';
import 'package:messenger_gradient_demo/models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, {super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        ClipRect(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              theme.scaffoldBackgroundColor,
              BlendMode.srcOut,
            ),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black,
                backgroundBlendMode: BlendMode.dstOut,
              ),
              child: _MessageContent(message: message),
            ),
          ),
        ),
        _MessageContent(
          message: message,
          isTransparent: message.senderIsMe,
        )
      ],
    );
  }
}

class _MessageContent extends StatelessWidget {
  final Message message;
  final bool isTransparent;

  const _MessageContent({
    required this.message,
    this.isTransparent = false,
  });

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
            color: isTransparent
                ? null
                : message.senderIsMe
                    ? Colors.blue
                    : Colors.grey[200],
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
