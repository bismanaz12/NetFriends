import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app2/chat_model.dart';

import 'comments_model.dart';



class HomeScreenController{
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;

  addLike(List likes,String postId)async{
    if(likes.contains(auth.currentUser!.uid)){
      likes.remove(auth.currentUser!.uid);
    }else{
      likes.add(auth.currentUser!.uid);
    }
    await  _firestore.collection('posts').doc(postId).update({'likes':likes});
  }

    addComment(CommentModel commentModel)async{
    try{
      await _firestore.collection('posts').doc(commentModel.postId).collection('comments').doc(commentModel.commentid).set(commentModel.toMap());
    }catch(e){
      log(e.toString());
    }
  }

  addmsg(ChatModel chatmodel)async{
    try{
      await _firestore.collection('chats').doc(chatmodel.chatId).set(chatmodel.toMap());
    }catch(e){
      log(e.toString());
    }
  }
}