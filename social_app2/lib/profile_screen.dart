import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/edit_profile.dart';
import 'package:social_app2/post_provider.dart';
import 'package:social_app2/user_provider.dart';

import 'note_model.dart';

class UserProfile extends StatefulWidget {
   UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {



  @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).getUserData();
    Provider.of<PostProvider>(context, listen: false).getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context).user;
    var userPro = Provider.of<UserProvider>(context,listen: false).user;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height*0.92,
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
          child: Column(
            children: [
              // SvgPicture.asset("assets/images/pro.svg",),
              // Icon(Icons.add),
              Stack(
                children: [
                  Container(
                    width: size.width*1,
                      height: size.height*0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/pro.png"),
                          fit: BoxFit.cover,
                        )
                      ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: size.width*0.8,bottom: size.width*0.4 ),
                      child: Icon(Icons.menu,color: Colors.white,size: 28,),
                    ),
                  ),
                  Positioned(
                    top: size.height*0.21,
                    left: size.height*0.19,
                    child:
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(provider!.photoUrl),
                    ),
                    // StreamBuilder(
                    // stream: FirebaseFirestore.instance.collection('posts').doc().snapshots();
                    // builder: (context, snapshot) {
                    //   return
                 //    Consumer<UserProvider>(
                 //      builder: (context,userPro,_) {
                 //        return InkWell(
                 //          onTap: ()async{
                 //
                 //            Provider.of<UserProvider>(context,listen: false).pickImage(ImageSource.gallery);
                 // String url=await   Provider.of<UserProvider>(context,listen: false).uploadFileToFirebase(userPro.pickedFile!, 'jpg');
                 //            Provider.of<UserProvider>(context,listen: false).updateUserProvider(url);
                 //        await    FirebaseFirestore.instance.collection('users').doc(userPro.user!.uid).update({
                 //              'photoUrl':url
                 //            });
                 //          },
                 //          child: Consumer<UserProvider>(
                 //
                 //              builder: (context,userPro,_) {
                 //                return CircleAvatar(
                 //                  radius: 35,
                 //                  backgroundImage:userPro.user!.photoUrl.isNotEmpty?NetworkImage(userPro.user!.photoUrl) : NetworkImage('https://cdn.pixabay.com/photo/2015/03/30/20/33/heart-700141_1280.jpg'),
                 //                );
                 //              }
                 //            ),
                 //        );
                 //      }
                 //    ),
                  ),
                ],
              ),

              Padding(
                padding:  EdgeInsets.only(top: size.height*0.01,left:  size.height*0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(provider.firstName,style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontWeight: FontWeight.w700,fontSize: 25,),),
                   SizedBox(width: 6,),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditPro(),));
                    }, icon: Icon(Icons.edit_outlined,size: 25,color: Colors.deepPurpleAccent.shade400,),)

                  ],
                ),
              ),
              Text(provider.email,style: TextStyle(color: Colors.deepPurpleAccent.shade700.withOpacity(0.8),fontWeight: FontWeight.w500,fontSize: 20,),),
              Padding(
                padding:  EdgeInsets.only(top: size.height*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("  2",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20,),),
                        Text("  Followers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20,),),
                      ],
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left: size.height*0.04,right:size.height*0.03 ),
                      child: Container(
                        height: size.height*0.08,
                        width: size.width*0.005,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text("  1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20,),),
                        Text("  Following",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20,),),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: size.height*0.01),
                    child: ElevatedButton(
                      onPressed: ()async {
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple.shade800,
                        backgroundColor: Colors.indigo.shade300.withOpacity(0.5),
                        // maximumSize: Size(size.width*0.9, size.height*0.8),
                        minimumSize: Size(size.width*0.35, size.height*0.06),
                        shadowColor: Colors.black,
                        elevation: 4.0,
                      ),
                      child: Text("Followers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Padding(
                    padding:  EdgeInsets.only(top: size.height*0.01),
                    child: ElevatedButton(
                      onPressed: ()async {

                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple.shade800,
                        backgroundColor: Colors.white.withOpacity(0.8),
                        // maximumSize: Size(size.width*0.9, size.height*0.8),
                        minimumSize: Size(size.width*0.35, size.height*0.06),
                        shadowColor: Colors.black,
                        elevation: 4.0,
                      ),
                      child: Text("Message",style: TextStyle(color: Colors.indigo.shade400.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                ],
              ),
               // GridView.builder(
               //     gridDelegate: , itemBuilder: itemBuilder)
              // Container(
              //   child: Column(
              //     children: [
              //       ListView.builder(itemBuilder: )
              //     ],
              //   ),
              // )
      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .where('userUid', isEqualTo: userPro!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No posts available'));
          }

          final posts = snapshot.data!.docs.map((doc) => NoteModel.fromMap(doc.data() as Map<String, dynamic>)).toList();

          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    // Handle post click
                  },
                  child: GridTile(
                    child: Image.network(
                      post.noteUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),



            ],
          ),
      ),
    );
  }}
