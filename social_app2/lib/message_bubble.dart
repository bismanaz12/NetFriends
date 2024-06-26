import 'package:cached_video_player_plus/cached_video_player_plus.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'chat_model.dart';

class MsBubble extends StatelessWidget {
   MsBubble({super.key, required this.sender, required this.msg, required this.isMe});

  final String sender;
  final String msg;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return
      Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.02),
      child: Container(
        alignment: isMe? Alignment.centerRight : Alignment.centerLeft,

        child: Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                color:Colors.deepPurple.shade300.withOpacity(0.8),
                borderRadius:isMe?


                BorderRadius.only(
                  topLeft: Radius.circular(35),
                  // bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ) :
                BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  // bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),

                border:Border.all(color: Colors.transparent,width: 2)
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: size.height*0.03,vertical: size.width*0.03),
                  child: Text(msg,style: TextStyle(color:Colors.white),),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 24,bottom: 8,right: 8),
                //   child: Text("time" ,style: TextStyle(color:  Colors.black),),
                // ),
              ],
            )),
      ),
    )
    ;
  }
}


class MsgBubble extends StatelessWidget {

  const MsgBubble({super.key, required this.msg, required this.isMe, required this.sender, required this.time});

  final String sender;
  final String msg;
  final bool isMe;
  final String time;
  // final MessageType chatType;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        alignment: isMe? Alignment.centerRight : Alignment.centerLeft,

        child: Container(
            margin: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                color: isMe ? Colors.teal.shade200:Colors.grey[600],
                borderRadius: isMe?
                BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ) :
                BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                border: isMe? Border.all(color: Colors.transparent,width: 2) : Border.all(color: Colors.transparent,width: 2)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 5,left: 20,right: 20),
                  child: Text(msg,style: TextStyle(color:isMe? Colors.black : Colors.white,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24,bottom: 8,right: 8),
                  child: Text(time ,style: TextStyle(color: isMe? Colors.black : Colors.white,fontSize: 16),),
                ),
              ],
            )),
      ),
    );
  }
}

class ImgBubble extends StatelessWidget {
  ImgBubble({super.key, required this.msg, required this.isMe, required this.sender, required this.time});

  final String sender;
  final String msg;
  final bool isMe;
  final String time;

  // final MessageType chatType;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        alignment: isMe? Alignment.centerRight : Alignment.centerLeft,

        child:   Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height*0.23,
              child: Container(
                  width:200,
                  height: 200,
                  child: Image.network(msg)),),
            Text(time,style: TextStyle(color: isMe? Colors.teal[900] : Colors.grey[700],fontSize: 16),),
          ],
        ),
      ),
    );
  }
}


class VidBubble extends StatelessWidget {
  VidBubble({super.key, required this.msg, required this.isMe, required this.sender, required this.time});

  final String sender;
  final String msg;
  final bool isMe;
  final String time;
  // String videoFile ;

  // final MessageType chatType;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        alignment: isMe? Alignment.centerRight : Alignment.centerLeft,

        child:   Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height*0.23,
              child: Container(
                  width:200,
                  height: 200,
                  // child: CachedVideoPlayerPlus(CachedVideoPlayerPlusController.networkUrl(Uri.parse(msg)))),),
                  child: CachedVideoPlayerPlus(CachedVideoPlayerPlusController.networkUrl(Uri.parse(msg)))),),

            Text(time,style: TextStyle(color: isMe? Colors.teal[900] : Colors.grey[700],fontSize: 16),),
          ],
        ),
      ),
    );
  }
}


//
// class VideoBubble extends StatefulWidget {
//   VideoBubble({super.key, required this.msg, required this.isMe, required this.sender, required this.time,required this.videoFile});
//
//   final String sender;
//   final String msg;
//   final bool isMe;
//   final String time;
//   String videoFile ;
//
//   @override
//   State<VideoBubble> createState() => _VideoBubbleState();
// }
//
// class _VideoBubbleState extends State<VideoBubble> {
//   late CachedVideoPlayerPlusController videoController;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       videoController = CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.videoFile));
//     });
//     videoController.initialize();
//     videoController.play();
//     videoController.setLooping(true);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Container(
//         alignment: isMe? Alignment.centerRight : Alignment.centerLeft,
//
//         child:   Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width*0.4,
//               height: MediaQuery.of(context).size.height*0.23,
//               child: Column(
//                 children: [
//                   Container(
//                       width:200,
//                       height: 200,
//                       child: CachedVideoPlayerPlus(),),
//                   Text(time,style: TextStyle(color: isMe? Colors.teal[900] : Colors.grey[700],fontSize: 16),),
//
//                 ],
//               ),
//             ) ],
//         ),
//       ),
//     );
//   }
// }
//
