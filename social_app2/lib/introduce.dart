import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app2/signin.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/3.png"),
        fit: BoxFit.cover,
       ),
       ),
          child: Padding(
            padding:  EdgeInsets.only(top: size.height*0.7),
            child: Container(
              height: size.height*0.3,
              width: size.width*1,
              decoration: BoxDecoration(
                color:  Colors.purple.shade200.withOpacity(0.9),
                borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius:9,
                    offset: Offset(5, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(right: 105,top:30),
                    child: Text("Welcome !",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,
                      shadows:[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black54,
                        ),
                      ],
                    ),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: size.width*0.13,top: size.height*0.001),
                    child: Text("Experience a wonderful ",style: TextStyle(color: Colors.white,fontSize: 18,
                      shadows:[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          color: Colors.black54,
                        ),
                      ],
                    ),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.16,bottom: 5),
                    child: Row(
                      children: [
                        Text("moment  with ",style: TextStyle(color: Colors.white,fontSize: 18,
                          shadows:[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              color: Colors.black54,
                            ),
                          ],
                        ),),
                        Container(
                          height: 40,width: 70,
                            child: Image.asset("assets/images/ciao.png"))
                      ],
                    ),
                  ),

                   ElevatedButton(
                     onPressed: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) =>  SignIn(),));

                     },
                     style: ElevatedButton.styleFrom(
                       foregroundColor: Colors.purple.shade800,
                       backgroundColor: Colors.indigo.shade300.withOpacity(0.5),
                       // maximumSize: Size(size.width*0.9, size.height*0.8),
                       minimumSize: Size(size.width*0.75, size.height*0.06),

                       shadowColor: Colors.black, //specify the button's elevation color
                       elevation: 4.0, //buttons Material shadow
                     ),
                     child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                   ),
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}

