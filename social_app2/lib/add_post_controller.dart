import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'note_model.dart';

class AddPostController{
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  createPost(NoteModel post)async{

    try{
      await _firestore.collection('posts').doc(post.noteId).set(post.toMap());
    }catch(e){
      log(e.toString());
    }

  }
}