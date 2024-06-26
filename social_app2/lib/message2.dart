import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app2/home.dart';

class Message2 extends StatelessWidget {
   Message2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height*0.09,
        leading:Padding(
          padding:  EdgeInsets.only(left: size.height*0.016),
          child: Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.white,),
        ),
        leadingWidth: 20,

        backgroundColor: Colors.deepPurple.withOpacity(0.8) ,
        title:

        Row(
        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// Image.asset("assets/images/b.png"),

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
                Text("Edein Vindard",style: TextStyle(color: Colors.white,fontSize: 20),),
                Text("acive now",style: TextStyle(color: Colors.white,fontSize: 14),),
              ],
            ),
          //   SizedBox(width: 10,),
          //
          //   Icon(Icons.more_vert,color: Colors.white,),
          ],
        ),
        actions: [

          Icon(Icons.more_vert,color: Colors.white,),
        ],




      ),
      body:
      // SvgPicture.asset("assets/images/background.svg",width: 29,),
     Image.asset("bg_jpg.jpg"),
    //   Stack(
    //     children: <Widget>[
    //       Image.asset('assets/images/bg.png'),
    //   // alignment: Alignment.center,
    //   //       width: MediaQuery.of(context).size.width,
    //   //       height: MediaQuery.of(context).size.height,
    //   //     ),
    //       Container(
    //         child: Column(
    //           children: [
    //             Text("hi"),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    );
  }
}
