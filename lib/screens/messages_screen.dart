import 'package:assignment/models/chat_model.dart';
import 'package:assignment/screens/business_screen.dart';
import 'package:assignment/screens/chat_screen.dart';
import 'package:assignment/screens/navigation_screen.dart';
import 'package:assignment/utils/sample_chat_list.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
    _controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Messages',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(
                Icons.chat_bubble,
                color: _controller.index == 0 ? Colors.blue : Colors.black54,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.shopping_bag_rounded,
                color: _controller.index == 1 ? Colors.blue : Colors.black54,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.time_to_leave,
                color: _controller.index == 2 ? Colors.blue : Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          ChatScreen(
            chat: chatList,
          ),
          BusinessScreen(),
          NavigationScreen(),
        ],
      ),
    );
  }
}
