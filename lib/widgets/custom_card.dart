import 'package:assignment/models/chat_model.dart';
import 'package:assignment/widgets/blue_circle.dart';
import 'package:assignment/widgets/contact_avatar.dart';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.user});
  final ChatModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Open signle chat screen
      },
      child: ListTile(
        leading: ContactAvatar(
          user: user,
        ),
        title: Text(
          user.name,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          user.currentmessage,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            user.hasUnreadMessage
                ? const BlueCircle()
                : const SizedBox(
                    height: 10,
                  ),
            Text(
              user.time,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
