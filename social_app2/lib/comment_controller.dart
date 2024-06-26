
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CommentController{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  commentLike(List likes ,String postId, String commentId,String userID)async{
 try {
   if(!likes.contains(userID)){
     likes.add(userID);
   }else{
     likes.remove(userID);
   }

   await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).update(
       {'likes':likes}
   );

 }catch(e){
   log(e.toString());
    }
  }
}