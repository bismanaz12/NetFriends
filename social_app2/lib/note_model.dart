// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

class NoteModel {
  String noteId;
  String username;
  String photoUrl;
  String userToken;
  String title;
  String userUid;
  List tagPeople;
  String noteUrl;
  DateTime publishedDate;
  bool isPinned;
  List likes;
  List comments;
  List<String> hashtags;

  NoteModel({
    required this.noteId,
    required this.username,
    required this.photoUrl,
    required this.title,
    required this.userUid,
    required this.tagPeople,
    required this.likes,
    required this.userToken,
    required this.noteUrl,
    required this.publishedDate,
    required this.comments,
    required this.isPinned,
    required this.hashtags,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteId': noteId,
      'username': username,
      'photoUrl': photoUrl,
      'title': title,
      'userUid': userUid,
      'tagPeople': tagPeople,
      'noteUrl': noteUrl,
      'publishedDate': publishedDate,
      'userToken': userToken,
      'comments': comments,
      'isPinned': isPinned,
      'likes': likes,
      'hashtags': hashtags,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      noteId: map['noteId'] as String? ?? '',
      username: map['username'] as String? ?? '',
      photoUrl: map['photoUrl'] as String? ?? '',
      title: map['title'] as String? ?? '',
      userUid: map['userUid'] as String? ?? '',
      tagPeople: List.from(map['tagPeople'] as List? ?? []),
      comments: List.from(map['comments'] as List? ?? []),
      likes: List.from(map['likes'] as List? ?? []),
      userToken: map['userToken'] as String? ?? '',
      isPinned: map['isPinned'] as bool? ?? false,
      noteUrl: map['noteUrl'] as String? ?? '',
      publishedDate: map['publishedDate']?.toDate() ?? DateTime.now(),
      hashtags: List<String>.from(map['hashtags'] as List? ?? []),
    );
  }
}
