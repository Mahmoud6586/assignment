import 'package:assignment/models/chat_model.dart';
import 'package:assignment/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.chat});
  final List<ChatModel> chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) {
          return CustomCard(
            user: chat[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
