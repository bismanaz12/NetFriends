import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app2/home.dart';
import 'package:social_app2/signup.dart';

import 'bottombar.dart';


class SignIn extends StatelessWidget {
   SignIn({super.key});

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height*0.12),
               width: 290,
                child: Image.asset("assets/images/ciao.png"),
            ),
            Container(
              height: 264 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 180,top: 2),
                    child: Text("Sign in",style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 29,),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "  Email/phone number",
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w300,fontSize: 14,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                        // labelText: 'title',
                        // labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.white.withOpacity(0.5),size: 23,),
                        fillColor: Colors.white,
                        hintText: "  Password",
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w300,fontSize: 14,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                      ),
                    ),
                  ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       CheckBoxExp(),
                       Text("Remember me",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                       SizedBox(width: 18),
                       Text("Forgot password",style: TextStyle(color:Colors.deepPurpleAccent.shade700,fontSize: 16,fontWeight: FontWeight.w400)),
                     ],
                   ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: size.height*0.01),
              child: ElevatedButton(
                onPressed: ()async {
                 try{
                   if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
                     FirebaseAuth auth =FirebaseAuth.instance;
                     FirebaseFirestore firestore = FirebaseFirestore.instance;
                     UserCredential user= await auth.signInWithEmailAndPassword(
                     email: emailController.text, password: passController.text);
                     if(user.user!=null){
                      await firestore.collection('users').doc(user.user!.uid).get();

                     }
                     Navigator.pushReplacement(context, MaterialPageRoute(
                         builder:  (context) =>  BottomBar(),));
                      }else{

                   }
                 }catch(e) {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),)));
                 }

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple.shade800,
                  backgroundColor: Colors.indigo.shade300.withOpacity(0.5),
                  // maximumSize: Size(size.width*0.9, size.height*0.8),
                  minimumSize: Size(size.width*0.75, size.height*0.06),

                  shadowColor: Colors.black, //specify the button's elevation color
                  elevation: 4.0, //buttons Material shadow
                ),
                child: Text("Sign in",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: size.height*0.03),
              child: Text("Or sign in with",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: size.height*0.03,horizontal: size.height*0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                   height: 30,width: 30,
                   decoration: BoxDecoration(
                     color: Colors.blue.shade800,
                     borderRadius: BorderRadius.circular(4),
                   ),
                     child: Icon(Icons.facebook,color: Colors.white,)
                 ),
                 Container(
                   height: 30,width: 30,
                   decoration: BoxDecoration(
                     color: Colors.blue.shade600,
                     borderRadius: BorderRadius.circular(4),
                   ),
                     child: Padding(
                       padding:  EdgeInsets.only(top: 5,left: 5),
                       child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 20,),
                     )
                 ),
                  Container(
                   height: 30,width: 30,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(4),
                   ),
                     child: Image.asset("assets/icons/google.png"),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 2),
                  Text("Don't have an account ?",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w400,fontSize: 15,),),
                  InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp(),));},
                      child: Text("Sign up",style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontWeight: FontWeight.w400,fontSize: 16,),)),
                  SizedBox(width: 2),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}

class CheckBoxExp extends StatefulWidget {
  const CheckBoxExp({super.key});

  @override
  State<CheckBoxExp> createState() => _CheckBoxExpState();
}

class _CheckBoxExpState extends State<CheckBoxExp> {
  bool? onChanged = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
          value: onChanged,checkColor: Colors.deepPurpleAccent.shade700,fillColor: MaterialStateProperty.all(Colors.white),
          activeColor: Colors.white,shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(2)
      ),
          onChanged: (value){
            setState(() {
              onChanged = value;
            });
          }),
    );
  }
}



