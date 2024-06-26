// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:social_app/post_provider.dart';
// import 'package:social_app/user_provider.dart';
//
// import 'comment_screen.dart';
// import 'home_screen_controller.dart';
// import 'note_model.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<Home> {
//   @override
//
//
//   @override
//   void initState() {
//     Provider.of<UserProvider>(context,listen: false).getUserData();
//     Provider.of<PostProvider>(context, listen: false).getAlLPosts();
//     super.initState();
//   }
//
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body:
//         Container(
//         width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height,
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     // stops: [0.1, 0.5, 0.7, 0.9],
//     colors: [
//     Colors.deepPurpleAccent.shade700.withOpacity(0.9),
//     Colors.purple.shade800.withOpacity(0.7),
//     Colors.purple.shade800.withOpacity(0.6),
//     Colors.purple.shade800.withOpacity(0.6),
//     Colors.purple.shade200.withOpacity(0.9),
//     Colors.purple.shade100.withOpacity(0.9),
//     ],
//     ),),
//     child: SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//     Padding(
//     padding:EdgeInsets.only(top: size.height*0.08),
//     child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//     Container(
//     height: size.height*0.074,
//     width: size.width*0.75,
//     child: TextField(
//     decoration: InputDecoration(
//     enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(
//     color: Color(0xFF635A8F).withOpacity(0.7),
//     ),
//     borderRadius: BorderRadius.circular(25),
//     ),
//     focusedBorder: OutlineInputBorder(
//     borderRadius: BorderRadius.circular(25),
//     ),
//     fillColor: Color(0xFF635A8F).withOpacity(0.7),
//     filled: true,
//     prefixIcon: Icon(Icons.search,size: 25,color: Colors.white.withOpacity(0.9)),
//     hintText: "Explore",
//     hintStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight:FontWeight.w500,fontSize: 17),
//     ),
//     ),
//     ),
//
//     Icon(Icons.notifications,size: 38,color: Colors.white.withOpacity(0.7)),
//     ],
//     ),
//     ),
//     SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     padding: EdgeInsets.only(right: size.width*0.03,left:size.width*0.05 ,top: size.height*0.02,bottom:size.height*0.0 ),
//
//     child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//     Padding(
//     padding:  EdgeInsets.only(right: size.width*0.03),
//     child: Column(
//     children: [
//     Container(
//     decoration:BoxDecoration(
//     borderRadius: BorderRadius.circular(80),
//     border: Border.all(color: Colors.purple.shade800.withOpacity(0.2), width: 3),
//     ),
//     child: Padding(
//     padding: const EdgeInsets.all(1.2),
//     child: CircleAvatar(
//     radius: 28,
//     backgroundImage: AssetImage("assets/images/my.jpg")
//     ),
//     ),
//     ),
//     SizedBox(height: 3,),
//     Text("You",style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 12),),
//     ],
//     ),
//     ),
//
//       StatusCont(name: "Edein", img:("assets/images/b.png"), ),
//       StatusCont(name: "Sumie", img:("assets/images/c.png"), ),
//       StatusCont(name: "Edein", img:("assets/images/d.png"), ),
//       StatusCont(name: "Sumie", img:("assets/images/a.png"), ),
//       StatusCont(name: "Edein", img:("assets/images/b.png"), ),
//       StatusCont(name: "Edein", img:("assets/images/c.png"), ),
//
//
//     ],
//     ),
//     ),
//
//       Column(
//         children: [
//
//           Consumer<PostProvider>(
//             builder: (context, postPro, _) {
//               if(postPro.allPosts.isNotEmpty){
//                 return
//                   ListView.builder(
//
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: postPro.allPosts.length,
//                     itemBuilder: (context, index) =>
//                         PostCont(post: postPro.allPosts[index],
//                         ),
//                   );
//               }else{
//                 return CircularProgressIndicator();
//               }
//
//             },
//           ),
//           // PostCont(name:" Edein Vindain", description: "This is a beautiful sky i took last week.\nit's great,right?:)", img: "assets/images/postPic.png",Proimg: "assets/images/b.png",)
//         ],
//       ),
//
//
//     ]
//     ),
//     ),
//         ),
//     );
//   }
// }
// class StatusCont extends StatelessWidget {
//   StatusCont({super.key, required this.name, required this.img, });
//
//   final String name;
//   final String img;
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return  Padding(
//       padding:  EdgeInsets.only(right: size.width*0.025,),
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(80),
//               border: Border.all(color: Colors.purple.shade800.withOpacity(0.2), width: 3),
//             ),
//             child: CircleAvatar(
//               radius: 28,
//               backgroundImage:AssetImage(img),
//             ),
//           ),
//           SizedBox(height: 3,),
//           Text(name,style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 11),),
//         ],
//       ),
//     );
//   }
// }
// class PostCont extends StatefulWidget {
//   PostCont({super.key, required this.post,});
//
//   final NoteModel post;
//
//   @override
//   State<PostCont> createState() => _PostContState();
// }
//
// class _PostContState extends State<PostCont> {
//   @override
//   Widget build(BuildContext context) {
//     var provider=Provider.of<UserProvider>(context,listen: false).user;
//     var size = MediaQuery.of(context).size;
//     return  Padding(
//       padding:  EdgeInsets.symmetric(vertical: size.height*0.03,horizontal: size.height*0.02),
//       child: Container(
//         height: size.height*0.57,
//         width: size.width*0.8,
//         decoration: BoxDecoration(
//           color: Color(0x806D4ACD).withOpacity(0.25),
//           borderRadius: BorderRadius.circular(36),
//         ),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding:  EdgeInsets.only(left: size.width*0.07,top: size.width*0.04,right: size.width*0.04,bottom: size.width*0.03),
//               child: Container(
//                 width: size.width*0.9,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding:  EdgeInsets.only(right:size.width*0.01),
//                           child: StreamBuilder(
//                               stream:  FirebaseFirestore.instance.collection('posts').doc(widget.post.userUid).snapshots(),
//                               builder: (context,snapshots) {
//                                 if(snapshots.hasData){
//                                   return CircleAvatar(
//                                     radius: 28,
//                                     backgroundImage:NetworkImage(widget.post.photoUrl),
//                                   );
//                                 }else{
//                                   return  Text("");}
//
//                               }
//                           ),
//                         ),
//                         SizedBox(width: 10,),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             StreamBuilder(
//                                 stream:  FirebaseFirestore.instance.collection('posts').doc(widget.post.userUid).snapshots(),
//                                 builder: (context,snapshots) {
//                                   if (snapshots.hasData) {
//                                     return Text(widget.post.username,
//                                       style: TextStyle(color: Colors.white),);
//                                   } else {
//                                     return Text("");
//                                   }
//                                 }
//                             ),
//                             // Text("5 min",style: TextStyle(color: Colors.white),),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Icon(Icons.more_vert,color: Colors.white,),
//                   ],
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding:  EdgeInsets.only(right: size.width*0.45),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(widget.post.title,style: TextStyle(color: Colors.white),),
//                   Text("#Beauty_nature ",style: TextStyle(color: Colors.white70),),
//                   Text("#Cloud",style: TextStyle(color: Colors.white70),),
//                 ],
//               ),
//             ),
//
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: size.height*0.01,vertical: size.height*0.02),
//               child:
//               Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(widget.post.noteUrl),fit: BoxFit.cover
//                     )
//                 ),
//                 height: size.height*0.27,
//                 width: size.width*0.75,
//                 // child: Image.network
//               ),
//             ),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   InkWell(
//                       onTap: (){
//                         HomeScreenController().addLike(widget.post.likes, widget.post.noteId);
//                       },
//                       child: StreamBuilder(
//                           stream: FirebaseFirestore.instance
//                               .collection('posts')
//                               .doc(widget.post.noteId)
//                               .snapshots(),
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               FirebaseAuth auth = FirebaseAuth.instance;
//                               NoteModel post = NoteModel.fromMap(snapshot.data!.data()!);
//                               return post.likes.contains(auth.currentUser!.uid) ?
//                               SvgPicture.asset("assets/images/heart.svg",width: 34,)
//                                   : Icon(Icons.favorite_border_rounded,color: Colors.white,size: 34,);
//                             } else {
//                               return Text('');
//                             }
//                           })
//
//                   ),
//                   StreamBuilder(
//                       stream: FirebaseFirestore.instance.collection('posts').doc(widget.post.noteId).snapshots(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return Text(
//                             "${snapshot.data!.data()!['likes'].length}",
//                             style: TextStyle(
//                               color: Colors.white,),
//                           );
//                         } else {
//                           return Text('');
//                         }
//                       }),
//
//                   SizedBox(
//                     child: InkWell(
//                         onTap:(){
//                           showBottomSheet(context: context,backgroundColor:Color(0xff635A8F).withOpacity(0.9),
//                             // isScrollControlled: true,
//                             // scrollControlDisabledMaxHeightRatio: ,
//                             constraints: BoxConstraints(maxHeight: 550),showDragHandle: true,
//                             // isDismissible: true,
//                             // useSafeArea: true,
//                             enableDrag: true,
//                             builder: (BuildContext context){
//                               return
//                                 Comment(postId: widget.post.noteId,);
//                             },
//                           );
//                         },
//                         child: SvgPicture.asset("assets/images/message.svg",width: 33,)
//                     ),
//                   ),
//                   SizedBox(width: size.width*0.4),
//
//                   SvgPicture.asset("assets/images/send.svg",width: 29),
//
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
