import 'package:flutter/material.dart';

import '../models/chat_model.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({super.key, required this.user});
  final ChatModel user;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          child: Image.asset(
            user.icon,
            fit: BoxFit.contain,
          ),
        ),
      ),
      Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
              color: user.isOnline ? Colors.green : Colors.grey,
            ),
          ))
    ]);
  }
}
