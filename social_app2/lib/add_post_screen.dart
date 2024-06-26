import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/add_post_controller.dart';
import 'package:social_app2/bottombar.dart';
import 'package:social_app2/note_model.dart';
import 'package:social_app2/post_provider.dart';
import 'package:social_app2/user_provider.dart';
import 'package:uuid/uuid.dart';

import 'home.dart';

class AddPost extends StatelessWidget {
   AddPost({super.key});

  TextEditingController captionController=TextEditingController();
  // TextEditingController tagsController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<UserProvider>(context,listen: false).user;
    var size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
               decoration: BoxDecoration(
               gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //   stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.deepPurpleAccent.shade700.withOpacity(0.9),
                  Colors.purple.shade800.withOpacity(0.7),
                  Colors.purple.shade800.withOpacity(0.6),
                  Colors.purple.shade800.withOpacity(0.6),
                  Colors.purple.shade200.withOpacity(0.9),
                  Colors.purple.shade100.withOpacity(0.9),
                ],
              ),),
            child:
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: size.height*0.1,right: size.height*0.03 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => BottomBar(),));
                            },
                          child: Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20,),)
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(right:  size.height*0.16,top: size.height*0.02  ),
                  child: Text("Add Caption",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 27,),),
                ),
                Padding(
                    padding:  EdgeInsets.only(top:  size.height*0.05,),
                    child: Container(
                    width: 280,
                    height: 50,
                    child: TextFormField(
                          controller: captionController,
                          // keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "  Add Caption",
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.white,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.white,width: 2),
                         ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(right:  size.height*0.03,top: size.height*0.05),
                  child: Text("Upload Image/Video",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 27,),),
                ),
                // Padding(
                //   padding:  EdgeInsets.only(top:  size.height*0.03, ),
                //    child: Container(
                //     width: 280,
                //     height: 50,
                //     child: TextFormField(
                //           controller: tagsController,
                //           keyboardType: TextInputType.visiblePassword,
                //           style: TextStyle(color: Colors.white),
                //           decoration: InputDecoration(
                //           fillColor: Colors.white,
                //           hintText: " Add Tags",
                //           hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
                //           focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(25),
                //           borderSide: BorderSide(color: Colors.white,width: 2),
                //           ),
                //           enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(25),
                //           borderSide: BorderSide(color: Colors.white,width: 2),
                //           ),
                //           // labelText: 'title',
                //           // labelStyle: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                      padding:  EdgeInsets.only(top: size.height*0.06),
                  child: InkWell(
                    onTap: (){
                      Provider.of<PostProvider>(context,listen: false).pickImage(ImageSource.gallery);
                    },
                    child: Consumer<PostProvider>(
                        builder: (context,postPro,_) {
                            return Container(
                            child: postPro.pickedFile==null? Image.asset ( "assets/images/postPic.png",width: 280,):Image.file(postPro.pickedFile!,width: 200,),
                          );
                          }
                        ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: size.height*0.08),
                  child: Consumer<PostProvider>(
                      builder: (context,postPro,_) {
                      return ElevatedButton(
                        onPressed: ()async {
                          FirebaseAuth auth=FirebaseAuth.instance;
                          FirebaseFirestore firestore=FirebaseFirestore.instance;

                          AddPostController postController = AddPostController();
                          String noteId=Uuid().v4();

                          String noteUrl=await
                          postPro.uploadFileToFirebase(postPro.pickedFile!,'png');

                          NoteModel post=NoteModel(noteId: noteId, username: userProvider!.firstName, photoUrl: userProvider.photoUrl, title: captionController.text, userUid: auth.currentUser!.uid, tagPeople: [], likes: [], userToken: '', noteUrl: noteUrl, publishedDate: DateTime.now(), comments: [], isPinned: false, hashtags: []);
                          postController.createPost(post);
                          // _firestore.collection('posts').doc(post.noteId).set(post.toMap());
                          postPro.pickedFileToNull();
                          captionController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue.shade800,
                          backgroundColor: Colors.lightBlue.withOpacity(0.3),
                          // maximumSize: Size(size.width*0.9, size.height*0.8),
                          minimumSize: Size( size.width*0.3, size.height*0.06),
                          shadowColor: Colors.black,
                          elevation: 4.0,
                        ),
                        child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      );
                    }
                  ),
                ),
              ],
            ),


          ),
        ));
  }
}
