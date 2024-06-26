import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String commentid;
  String comment;
  DateTime time;
  String userId;
  String postId;
  List likes;
  CommentModel(
      {required this.commentid,
        required this.comment,
        required this.time,
        required this.userId,
        required this.postId,
        required this.likes,
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentid': commentid,
      'comment': comment,
      'time': time,
      'userId': userId,
      'postId': postId,
      'likes': likes,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentid: map['commentid'] as String,
      comment: map['comment'] as String,
      time: (map['time'] as Timestamp).toDate(),
      userId: map['userId'] as String,
      postId: map['postId'] as String,
      likes: List.from((map['likes'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}