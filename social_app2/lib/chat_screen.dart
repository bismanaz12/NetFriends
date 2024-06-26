import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/chat_model.dart';
import 'package:social_app2/message1.dart';
import 'package:social_app2/message_bubble.dart';
import 'package:social_app2/user_model.dart';
import 'package:social_app2/user_provider.dart';
import 'package:uuid/uuid.dart';

import 'home_screen_controller.dart';

class ChatScreen extends StatefulWidget {
   ChatScreen({super.key, this.receiverUser});

  final receiverUser;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController textController = TextEditingController();
  final TextEditingController msgController=TextEditingController();

  var user1Uid = FirebaseAuth.instance.currentUser!.uid;

  getConversationId(String receiverId) =>
      user1Uid.hashCode <= receiverId.hashCode ?
      '${user1Uid}_$receiverId' : '${receiverId}_$user1Uid';

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context,listen: false).user;


    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height*0.09,
          leading:Padding(
            padding:  EdgeInsets.only(left: size.height*0.016),
            child:
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:
                Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.white,)
                )

          ),
          leadingWidth: 20,

          backgroundColor: Colors.deepPurple.shade400.withOpacity(0.8),
          title:

          Row(
            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding:  EdgeInsets.all(size.height*0.02),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage:AssetImage("assets/images/b.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kashaf",style: TextStyle(color: Colors.white,fontSize: 20),),
                  Text("last seen today at 12:00 pm",style: TextStyle(color: Colors.white,fontSize: 12),),
                ],
              ),
              //   SizedBox(width: 10,),
              //   Icon(Icons.more_vert,color: Colors.white,),
            ],
          ),
          actions: [

            Padding(
              padding:  EdgeInsets.only(right: 20),
              child: Icon(Icons.more_vert,color: Colors.white,),
            ),
          ],


        ),
        body:
        // SvgPicture.asset("assets/images/svg-bg.svg"),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: size.width*0.999,
            height: size.height*0.999,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
               // border: Border.all(width: 10,color: Colors.red),
            ),
              // width: size.width,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.height*0.01,vertical: size.width*0.03),
                child: Column(
                  children: [
                    // MsgBubble(msg: "Hi", isMe: true, sender: "sender", time: "time")
                    Container(
                      height: size.height*0.7,
                      child: Column(
                        children: [
                          //
                          // StreamBuilder(
                          //     stream: FirebaseFirestore.instance.collection(
                          //         'chats').doc(
                          //         getConversationId(widget.receiverUser['uid']))
                          //         .collection('messages').orderBy(
                          //       'time', descending: false,)
                          //         .snapshots(),
                          //     builder: (context, snapshot) {
                          //       if (snapshot.hasData) {
                          //         if (snapshot.data!.docs.isEmpty) {
                          //           return Text("Let's Chat", style: TextStyle(
                          //               color: Colors.teal[700],
                          //               fontSize: 25,
                          //               fontFamily: "FontMain",
                          //               fontWeight: FontWeight.w800),);
                          //         }
                          //         return
                          //           MsBubble(msg: , isMe: isMe, sender: sender, time: time);
                          //       }
                          //       )
                          //    }
                          //  ),




                          // Padding(
                          //   padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.02),
                          //   child: Container(
                          //     alignment:  Alignment.centerLeft,
                          //
                          //     child: Container(
                          //         margin: EdgeInsets.symmetric(vertical: 6),
                          //         decoration: BoxDecoration(
                          //             color:Colors.deepPurple.shade300.withOpacity(0.8),
                          //             borderRadius:
                          //             BorderRadius.only(
                          //               topLeft: Radius.circular(35),
                          //               // bottomLeft: Radius.circular(35),
                          //               bottomRight: Radius.circular(35),
                          //               topRight: Radius.circular(35),
                          //             ) ,
                          //
                          //             border:Border.all(color: Colors.transparent,width: 2)
                          //         ),
                          //         child: Column(
                          //           children: [
                          //             Padding(
                          //               padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.03),
                          //               child: Text("Hello Have a Great day",style: TextStyle(color:Colors.white),),
                          //             ),
                          //             // Padding(
                          //             //   padding: const EdgeInsets.only(left: 24,bottom: 8,right: 8),
                          //             //   child: Text("time" ,style: TextStyle(color:  Colors.black),),
                          //             // ),
                          //           ],
                          //         )),
                          //   ),
                          // ),
                          //
                          // Padding(
                          //   padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.02),
                          //       child: Container(
                          //               alignment:  Alignment.centerRight,
                          //               child: Container(
                          // margin: EdgeInsets.symmetric(vertical: 6),
                          // decoration: BoxDecoration(
                          //     color:Colors.deepPurple.shade300.withOpacity(0.8),
                          //     borderRadius:
                          //     BorderRadius.only(
                          //       topLeft: Radius.circular(35),
                          //       bottomLeft: Radius.circular(35),
                          //       // bottomRight: Radius.circular(35),
                          //       topRight: Radius.circular(35),
                          //     ) ,
                          //
                          //     border:Border.all(color: Colors.transparent,width: 2)
                          // ),
                          // child: Column(
                          //   children: [
                          //     Padding(
                          //       padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.03),
                          //       child: Text("Thank you bro!",style: TextStyle(color:Colors.white),),
                          //     ),
                          //   ],
                          // ),
                          //               ),
                          //       ),
                          //     ),
                          //
                          // Padding(
                          //   padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.02),
                          //   child: Container(
                          //     alignment:  Alignment.centerLeft,
                          //
                          //     child: Container(
                          //         margin: EdgeInsets.symmetric(vertical: 6),
                          //         decoration: BoxDecoration(
                          //             color:Colors.deepPurple.shade300.withOpacity(0.8),
                          //             borderRadius:
                          //             BorderRadius.only(
                          //               topLeft: Radius.circular(35),
                          //               // bottomLeft: Radius.circular(35),
                          //               bottomRight: Radius.circular(35),
                          //               topRight: Radius.circular(35),
                          //             ) ,
                          //
                          //             border:Border.all(color: Colors.transparent,width: 2)
                          //         ),
                          //         child: Column(
                          //           children: [
                          //             Padding(
                          //               padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.03),
                          //               child: Text("I had a dream",style: TextStyle(color:Colors.white),),
                          //             ),
                          //             // Padding(
                          //             //   padding: const EdgeInsets.only(left: 24,bottom: 8,right: 8),
                          //             //   child: Text("time" ,style: TextStyle(color:  Colors.black),),
                          //             // ),
                          //           ],
                          //         )),
                          //   ),
                          // ),
                          //
                          // Padding(
                          //   padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.02),
                          //   child: Container(
                          //     alignment:  Alignment.centerRight,
                          //
                          //     child: Container(
                          //         margin: EdgeInsets.symmetric(vertical: 6),
                          //         decoration: BoxDecoration(
                          //             color:Colors.deepPurple.shade300.withOpacity(0.8),
                          //             borderRadius:
                          //             BorderRadius.only(
                          //               topLeft: Radius.circular(35),
                          //               bottomLeft: Radius.circular(35),
                          //               // bottomRight: Radius.circular(35),
                          //               topRight: Radius.circular(35),
                          //             ) ,
                          //
                          //             border:Border.all(color: Colors.transparent,width: 2)
                          //         ),
                          //         child: Column(
                          //           children: [
                          //             Padding(
                          //               padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.03),
                          //               child: Text("Oh really! tell me more",style: TextStyle(color:Colors.white),),
                          //             ),
                          //             // Padding(
                          //             //   padding: const EdgeInsets.only(left: 24,bottom: 8,right: 8),
                          //             //   child: Text("time" ,style: TextStyle(color:  Colors.black),),
                          //             // ),
                          //           ],
                          //         )
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.02),
                            child: Container(
                              alignment:  Alignment.centerLeft,

                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                      color:Colors.deepPurple.shade300.withOpacity(0.8),
                                      borderRadius:
                                      BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        // bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                      ) ,

                                      border:Border.all(color: Colors.transparent,width: 2)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.03),
                                        child: Text("I had a dream",style: TextStyle(color:Colors.white),),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 24,bottom: 8,right: 8),
                                      //   child: Text("time" ,style: TextStyle(color:  Colors.black),),
                                      // ),
                                    ],
                                  )),
                            ),
                          ),

                          StreamBuilder(
                              stream: FirebaseFirestore.instance.collection("chats").snapshots(),
                            builder: (context,snapshot) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                itemBuilder: (context,index) {
                                  ChatModel chat = ChatModel.fromMap(snapshot.data!.docs[index].data());
                                  return MsBubble(msg: chat.message, isMe: true, sender: user1Uid,);
                                }
                              );
                            }
                          ),

                        ],
                      ),
                    ),




                    Container(
                      height: size.height*0.07,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade300.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/icons/category.svg"),
                          SvgPicture.asset("assets/icons/gallery-add.svg"),
                          SvgPicture.asset("assets/icons/microphone-2.svg"),
                          Container(
                            width: 210,
                            height: 30,
                            child: TextFormField(
                              controller: msgController,
                              // keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 15),
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.5),
                                hintText: "  Message",
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
                          InkWell(
                                onTap: (){
                                  if(msgController.text.isNotEmpty){
                                    HomeScreenController controller = HomeScreenController();
                                    var chatId = Uuid().v4();
                                    ChatModel chatmodel = ChatModel(chatId:chatId , photoUrl: "", senderId: user1Uid, receiverId: "", message: msgController.text, time: DateTime.now(), type: MessageType.text);
                                    controller.addmsg(chatmodel);
                                    msgController.clear();
                                }
                              }
                              ,
                              child: SvgPicture.asset("assets/icons/send.svg",)),

                        ],
                      ),
                    ),


                  ],
                ),
              )
          ),
        ),

    );
  }
}

