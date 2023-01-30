

class MessageModel{
  final String sender;
  final String message;

  final String messageTime;

  final String chatId;
  final String messageId;
  final String type;
  MessageModel({ required this.sender, required this.message, required this.messageTime,
    required this.chatId,required this.messageId,required this.type
  });

}