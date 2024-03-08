import 'package:flutter/material.dart';
import 'package:messenger_gradient_demo/models/message.dart';
import 'package:messenger_gradient_demo/widgets/message_bubble.dart';
import 'package:messenger_gradient_demo/widgets/user_info_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(
      text: "Hey there! What are you up to tonight?",
      senderIsMe: false,
    ),
    Message(
      text: "Oh, not much, just chilling at home. You?",
      senderIsMe: true,
    ),
    Message(
      text: "Same here! This weather is crazy, right?",
      senderIsMe: false,
    ),
    Message(
      text:
          "Tell me about it! Feels like it can't decide if it wants to rain or snow",
      senderIsMe: true,
    ),
    Message(
      text: "Haha, seriously. Maybe it's just confused",
      senderIsMe: false,
    ),
    Message(
      text: "Probably! So, any plans for the weekend?",
      senderIsMe: true,
    ),
    Message(
      text: "Not really yet. Just hoping to relax and maybe catch a movie",
      senderIsMe: false,
    ),
    Message(
      text:
          "Nice! I was thinking about doing the same thing. Seen anything good lately?",
      senderIsMe: true,
    ),
    Message(
      text:
          "Hmm, not in theaters. But I did rewatch that old sci-fi comedy you recommended last month",
      senderIsMe: false,
    ),
    Message(
      text:
          "Oh cool! Glad you liked it. Maybe we can find something new to watch together this weekend",
      senderIsMe: true,
    ),
    Message(
      text: "Sounds like a plan! We could do a movie night over video call",
      senderIsMe: false,
    ),
    Message(
      text:
          "That's a great idea! We can browse some streaming options together",
      senderIsMe: true,
    ),
    Message(
      text:
          "Perfect! Also, speaking of that sci-fi comedy, did you ever notice the hidden easter egg in the final scene?",
      senderIsMe: false,
    ),
    Message(
      text: "You know what, I don't think I did! What was it?",
      senderIsMe: true,
    ),
    Message(
      text:
          "I won't spoil it in case you want to rewatch it, but keep an eye out for the blinking light in the background",
      senderIsMe: false,
    ),
    Message(
      text:
          "Haha, sneaky! I'll definitely pay attention next time. Maybe that's why I need a rewatch anyway",
      senderIsMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const SafeArea(
          child: UserInfo(
            name: 'Andrew Bekhiet',
            subtitle: 'Flutter Developer',
            imageUrl: 'https://avatars.githubusercontent.com/u/40571928',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: ListView.builder(
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              final Message message = messages.reversed.elementAt(index);

              return MessageBubble(message);
            },
          ),
        ),
      ),
    );
  }
}
