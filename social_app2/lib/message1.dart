import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app2/chat_screen.dart';
import 'package:social_app2/practice.dart';

import 'home.dart';
import 'home_screen.dart';

class Message1 extends StatelessWidget {
  const Message1({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        //   drawer: SideBar(),
        //   drawerScrimColor: Colors.transparent,
        //   appBar: AppBar(
        //   backgroundColor: Colors.purple.shade800.withOpacity(0.7),
        //   title: Text("hello"),
        //   ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
                 decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                 //   stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors.deepPurpleAccent.shade700.withOpacity(0.9),
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
              padding:  EdgeInsets.only(top: size.height*0.01),
              child:
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         height: size.height*0.065,
                    //         width: size.width*0.6,
                    //         child: TextField(
                    //           decoration: InputDecoration(
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 color: Color(0xFF635A8F).withOpacity(0.7),
                    //               ),
                    //               borderRadius: BorderRadius.circular(25),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(25),
                    //             ),
                    //             fillColor: Color(0xFF635A8F).withOpacity(0.7),
                    //             filled: true,
                    //             prefixIcon: Icon(Icons.search,size: 25,color: Colors.white.withOpacity(0.9)),
                    //             hintText: "Search",
                    //             hintStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight:FontWeight.w500,fontSize: 17),
                    //           ),
                    //         ),
                    //       ),
                    //
                    //       Icon(Icons.person_3_rounded,size: 30,color: Colors.white.withOpacity(0.7)),
                    //     ],
                    //   ),
                    // ),

                    SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(right: size.width*0.03,left:size.width*0.05 ,top: size.height*0.02,bottom:size.height*0.02 ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: size.width*0.03),
                    child: Column(
                      children: [
                        Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.purple.shade800.withOpacity(0.2), width: 3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.2),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage:AssetImage("assets/images/10.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text("You",style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 12),),
                      ],
                    ),
                  ),


                  StatusCont(name: "Edein", img:("assets/images/b.png"), ),
                  StatusCont(name: "Edein", img:("assets/images/c.png"), ),
                  StatusCont(name: "Edein", img:("assets/images/d.png"), ),
                  StatusCont(name: "Sumei", img: ("assets/images/a.png"),),
                  StatusCont(name: "Edein", img:("assets/images/b.png"), ),
                  StatusCont(name: "Edein", img:("assets/images/c.png"), ),


                ],
              ),
                    ),

                     ),

                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                              indent: 30,
                              endIndent: 20,
                              height: 30,
                              color: Colors.white54,
                            )),
                      ],
                    ),

                    Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.height*0.038,vertical: size.width*0.02),
                    child: Column(
                    children: [

                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            otherUserChatCont(name: "Esha",   msg: "Hello! what..", img: "assets/images/b.png", time: "7:00",),
                            otherUserChatCont(name: "Kashaf", msg: "Have a nice..", img: "assets/images/c.png", time: "7:00"),
                            otherUserChatCont(name: "Zainab ",msg: "Wao! good....", img: "assets/images/b.png", time: "7:00"),
                            otherUserChatCont(name: "Sawera ",msg: "Plz come ....", img: "assets/images/d.png", time: "7:00"),
                            otherUserChatCont(name: "Nimra ", msg: "Don't do ....", img: "assets/images/c.png", time: "7:00"),



                          ],
                        )
                        // child:
                        // StreamBuilder(
                        //   stream:FirebaseFirestore.instance.collection("users")
                        //   .where('uid',isNotEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
                        //   builder: (context,snapshot) {
                        //        if(snapshot.hasData) {
                        //          return ListView.builder(
                        //              itemCount: snapshot.data!.docs.length,
                        //              itemBuilder: (context, index) {
                        //                var data = snapshot.data!.docs[index]
                        //                    .data();
                        //                return InkWell(
                        //                    onTap: () {
                        //                      Navigator.push(context,
                        //                          MaterialPageRoute(
                        //                            builder: (context) =>
                        //                                ChatScreen(
                        //                                    receiverUser: data),));
                        //                    },
                        //                    child: otherUserChatCont(
                        //                        name:  data['firstName'],
                        //                        msg: "Hello! what...",
                        //                        img: "assets/images/a.png",
                        //                        time: "7:00",
                        //                    userId:  data['uid'],));
                        //              }
                        //          );
                        //        }else{
                        //          return Center(child: CircularProgressIndicator(),);
                        //        }
                        //   }
                        // ),



                      ),
                ],
              ),
                    ),




                  ]),

              // Padding(
              //   padding:  EdgeInsets.symmetric(vertical: size.height*0.0,horizontal:size.width*0.07),
              //   child: Container(
              //     height: size.height*0.064,
              //     width: size.width*0.85,
              //     child: TextField(
              //       decoration: InputDecoration(
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Color(0xFF635A8F).withOpacity(0.7),
              //           ),
              //           borderRadius: BorderRadius.circular(40),
              //             // borderRadius.circular(30)
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(40),
              //         ),
              //         fillColor: Color(0xFF635A8F).withOpacity(0.7),
              //         filled: true,
              //         prefixIcon: Icon(Icons.search,size: 25,color: Colors.white.withOpacity(0.9)),
              //         hintText: "Search",
              //         hintStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight:FontWeight.w500,fontSize: 17),
              //       ),
              //     ),
              //    ),
              //  ),
              // ),
                  ),
            ],
          ),
        ));
  }
}
class otherUserChatCont extends StatelessWidget {
   otherUserChatCont({super.key, required this.name, required this.msg, required this.img, required this.time,});

  final String name;
  final String msg;
  final String img;
  final String time;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding:  EdgeInsets.only(bottom:size.height*0.02 ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage:AssetImage(img),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(color: Colors.white),),
                Text(msg,style: TextStyle(color: Colors.white54),),
              ],
            ),
            SizedBox(width: 80,),
            Text(time,style: TextStyle(color: Colors.white54),),
            // Icon(Icons.more_vert,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
