class ChatModel {
  String name;
  String icon;
  bool isOnline;
  String time;
  String currentmessage;
  bool hasUnreadMessage;

  ChatModel({
    required this.name,
    required this.icon,
    required this.isOnline,
    required this.time,
    required this.currentmessage,
    required this.hasUnreadMessage,
  });
}
