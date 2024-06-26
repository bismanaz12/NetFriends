import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String chatId;
  final String photoUrl;
  final String senderId;
  final String receiverId;
  final String message;
  final MessageType type;
  final DateTime time;

  ChatModel({required this.chatId, required this.photoUrl, required this.senderId, required this.receiverId, required this.message, required this.time, required this.type});



  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'photoUrl': photoUrl,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'time': time,
      'type': type == MessageType.text ?'text': type == MessageType.image ? 'image':'video',
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic>map){
    return ChatModel(chatId: map['chatId'], photoUrl: map['photoUrl'], senderId: map['senderId'], receiverId: map['receiverId'],
        type:map['type']=='text'?MessageType.text :map['type']=='image'?MessageType.image :MessageType.video,
        message: map['message'], time: (map['time'] as Timestamp).toDate());
  }
}
enum MessageType{
  text,
  image,
  video
}