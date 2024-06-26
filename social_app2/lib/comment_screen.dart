import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/comment_controller.dart';
import 'package:social_app2/comments_model.dart';
import 'package:social_app2/home_screen_controller.dart';
import 'package:social_app2/post_provider.dart';
import 'package:social_app2/user_model.dart';
import 'package:social_app2/user_provider.dart';
import 'package:uuid/uuid.dart';

import 'home.dart';
import 'note_model.dart';
class Comment extends StatefulWidget {
   Comment({super.key, required this.postId,});
  final String postId;
   // final NoteModel post;


   @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final TextEditingController commentController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userPro = Provider.of<UserProvider>(context,listen: false).user;
    var postpro=Provider.of<PostProvider>(context,listen: false);



    var size = MediaQuery.of(context).size;
    return
       Padding(
         padding:  EdgeInsets.symmetric(vertical: size.height*0.03),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             // Padding(
             //   padding:  EdgeInsets.symmetric(horizontal: size.height*0.02,vertical: size.height*0.01),
             //   child:
             //   Row(
             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
             //     children: [
             //       Padding(
             //         padding:  EdgeInsets.all(1.2),
             //         child:
             //         CircleAvatar(
             //           radius: 28,
             //           backgroundImage:NetworkImage("assets/images/b.png"),
             //         ),
             //       ),
             //       Column(
             //         crossAxisAlignment: CrossAxisAlignment.start,
             //         children: [
             //           Text("Edein Vindain",style: TextStyle(color: Colors.white),),
             //           Text("5 min ago",style: TextStyle(color: Colors.white),),
             //         ],
             //       ),
             //       SizedBox(width: 80,),
             //
             //       Icon(Icons.more_vert,color: Colors.white,),
             //     ],
             //   ),
             // ),

             Expanded(
               // flex: 2,
               // height: size.height*0.5,
               child: StreamBuilder(
                 stream: FirebaseFirestore.instance.collection("posts").doc(widget.postId).collection("comments").snapshots(),
                 builder: (context,snapshot) {
                 if(snapshot.hasData){
                   List<CommentModel> comment = snapshot.data!.docs.map((e) => CommentModel.fromMap(e.data())).toList();
                  comment.sort((a,b)=>b.likes.length.compareTo(a.likes.length));
                   return ListView.builder(
                       itemCount: snapshot.data!.docs.length,
                       shrinkWrap: true,
                       itemBuilder: (context,index) {
                         // CommentModel comment = CommentModel.fromMap(snapshot.data!.docs[index].data());
                         return CommentCont(comment: comment[index],);
                       }
                   );
                 }else{
                   return Text("");
                 }
                 }
               ),
             ),
             // TextFormField()
             Container(
               height: size.height*0.07,
               width: size.width,
               decoration: BoxDecoration(
                   color: Colors.deepPurple.shade300.withOpacity(0.3),
                   borderRadius: BorderRadius.circular(30)
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   // SvgPicture.asset("assets/icons/category.svg"),
                   // SvgPicture.asset("assets/icons/gallery-add.svg"),
                   // SvgPicture.asset("assets/icons/microphone-2.svg"),
                   Container(
                     width: 260,
                     height: 30,
                     child: TextFormField(
                       controller: commentController,
                       // keyboardType: TextInputType.visiblePassword,
                       style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 15),
                       decoration: InputDecoration(
                         fillColor: Colors.white.withOpacity(0.5),
                         hintText: "  Comment",
                         hintStyle: TextStyle(color: Colors.white.withOpacity(0.6),fontWeight: FontWeight.w400,fontSize: 12,),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25),
                           borderSide: BorderSide(color: Colors.white.withOpacity(0.6),width: 2),
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25),
                           borderSide: BorderSide(color: Colors.white.withOpacity(0.7),width: 2),
                         ),
                         // labelText: 'title',
                         // labelStyle: TextStyle(color: Colors.white)
                       ),
                     ),
                   ),
                   SizedBox(width: 20,),
                   InkWell(
                     onTap: (){
                   if(commentController.text.isNotEmpty){
                     HomeScreenController controller = HomeScreenController();
                     var commentId = Uuid().v4();
                     CommentModel commentModel = CommentModel(commentid: commentId, comment: commentController.text, time: DateTime.now(), userId: userPro!.uid, postId: widget.postId, likes: []);
                     controller.addComment(commentModel);
                     commentController.clear();
                    }

                     },
                       child: SvgPicture.asset("assets/icons/send.svg",)),

                 ],
               ),
             ),

           ],
         ),
       );
  }
}
class CommentCont extends StatefulWidget {

   CommentCont({super.key,required this.comment});

   final CommentModel comment;

  @override
  State<CommentCont> createState() => _CommentContState();
}

class _CommentContState extends State<CommentCont> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userPro = Provider.of<UserProvider>(context,listen: false).user;


    return  Container(
      padding: EdgeInsets.all(16.0),
      child:
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.01),
            child: StreamBuilder(
              stream:  FirebaseFirestore.instance.collection('users').doc(widget.comment.userId).snapshots(),
          builder: (context,snapshots) {
                if(snapshots.hasData){
                  var data = snapshots.data!.data();
                  UserModel model = UserModel.fromMap(data!);
                  return CircleAvatar(
                    radius: 24,
                    backgroundImage: model.photoUrl.isEmpty? NetworkImage(""): NetworkImage(model.photoUrl),
                  );
                }else{
                 return Text("");
                };

              }
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.01,right: size.height*0.02),
            child: Container(
              height: size.height*0.11,
              width:  size.width*0.7,
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder(

                            stream:  FirebaseFirestore.instance.collection('users').doc(widget.comment.userId).snapshots(),
                            builder: (context,snapshots) {
                             if(snapshots.hasData){
                               var data = snapshots.data!.data();
                               UserModel model = UserModel.fromMap(data!);
                               return
                                 Text(model.firstName,style: TextStyle(color: Color(0xff6D4ACD),fontWeight: FontWeight.w900),
                                 );
                             }else{
                               return Text("");
                             }
                          }
                        ),
                        Container(
                          width: size.width*0.1,
                          child: Row(
                            children: [
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance.collection('posts').doc(widget.comment.postId).collection("comments").doc(widget.comment.commentid).snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        "${snapshot.data!.data()!['likes'].length}",
                                        style: TextStyle(
                                          color: Color(0xff6D4ACD),fontSize: 12,fontWeight: FontWeight.bold),
                                      );
                                    } else {
                                      return Text('');
                                    }
                                  }),
                              InkWell(
                                  onTap: (){
                                 CommentController().commentLike(widget.comment.likes, widget.comment.postId, widget.comment.commentid,userPro!.uid );
                                  },
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('posts').doc(widget.comment.postId).collection('comments').doc(widget.comment.commentid).snapshots(),
                                    builder: (context,snapshots) {
                                     if(snapshots.hasData){
                                       CommentModel comment = CommentModel.fromMap(snapshots.data!.data()!);
                                       return
                                         comment.likes.contains(userPro!.uid)?
                                         SvgPicture.asset("assets/images/heart.svg",width: 19,)
                                             : Icon(Icons.favorite_border_rounded,color: Colors.white,size: 19,);
                                       }else{
                                       return Text("");
                                     }
                                    }
                                  )
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                     Text(
                       widget.comment.comment,
                       style: TextStyle(
                           color: Color(0xff6D4ACD),fontWeight: FontWeight.w500
                       ),
                     ),
                    Row(
                      children: [
                        Text(DateFormat('hh:ss').format(widget.comment.time),style: TextStyle(color: Color(0xff6D4ACD)),),
                        SizedBox(width: 10,),
                        // Text("like",style: TextStyle(color: Colors.white54),),
                        // SizedBox(width: 10),
                        Text("Reply",style: TextStyle(color:Color(0xff6D4ACD),fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                 ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// // Image.asset("assets/images/b.png"),
//
// Padding(
// padding:  EdgeInsets.all(1.2),
// child: CircleAvatar(
// radius: 28,
// backgroundImage:AssetImage("assets/images/b.png"),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Edein Vindard",style: TextStyle(color: Colors.white),),
// Text("5 min",style: TextStyle(color: Colors.white),),
// ],
// ),
// SizedBox(width: 80,),
//
// Icon(Icons.more_vert,color: Colors.white,),
// ],
// ),




