import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
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
            padding:  EdgeInsets.symmetric(horizontal: size.height*0.035,vertical: size.width*0.02),
            child: Column(
              children: [
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage:AssetImage("assets/images/b.png"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("College",style: TextStyle(color: Colors.white),),
                        Text("Hello! what...",style: TextStyle(color: Colors.white54),),
                      ],
                    ),
                    SizedBox(width: 80,),
                    Text("7:00",style: TextStyle(color: Colors.white54),),
                    // Icon(Icons.more_vert,color: Colors.white,),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage:AssetImage("assets/images/d.png"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("School",style: TextStyle(color: Colors.white),),
                        Text("Hello! what...",style: TextStyle(color: Colors.white54),),
                      ],
                    ),
                    SizedBox(width: 80,),
                    Text("7:00",style: TextStyle(color: Colors.white54),),
                    // Icon(Icons.more_vert,color: Colors.white,),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage:AssetImage("assets/images/c.png"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Home",style: TextStyle(color: Colors.white),),
                        Text("Hello! what...",style: TextStyle(color: Colors.white54),),
                      ],
                    ),
                    SizedBox(width: 80,),
                    Text("7:00",style: TextStyle(color: Colors.white54),),
                    // Icon(Icons.more_vert,color: Colors.white,),
                  ],
                ),



              ],
            ),
          ),

        ],
      ),
    ));
  }
}
