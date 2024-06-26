import 'dart:developer';

import 'package:chip_list/chip_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app2/home.dart';
import 'package:social_app2/signin.dart';
import 'package:social_app2/user_model.dart';

import 'bottombar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  // DateTime? dateController;
  final List<String> _gender = ['Male', 'Female', 'Other'];
  bool? onchanged = false;
  int initialIndex = 0;
  final _sigInFormKey = GlobalKey<FormState>();

  String selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body:
        Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Padding(
        padding:  EdgeInsets.only(right: 180,top: 30,bottom: 10),
        child: Text("Sign up",style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,),
        ),
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 140,
            height: 50,
            child: TextFormField(
                  controller: firstNameController,
                  // keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "  First name",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white,width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white,width: 2),
                  ),
                 // labelText: 'title',
                 // labelStyle: TextStyle(color: Colors.white)
              ),
            ),
          ),
          Container(
            width: 140,
            height: 50,
            child: TextFormField(
                  controller:lastNameController,
                  // keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "  Last name",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white,width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white,width: 2),
                  ),
                  // labelText: 'title',
                  // labelStyle: TextStyle(color: Colors.white)
              ),
            ),
          ),
        ],
        ),
        Container(
        width: 300,
        height: 50,
        child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
          //   validator: (value) {
          //   if (value!.isEmpty) {
          //     return 'This is a required field';
          //   // } else if (!(value.contains('@'))) {
          //   //   return 'Email is not valid';
          //   // } else if (!(value.contains(".com"))) {
          //   //   return 'Email is not valid';
          //   } else {
          //     return null;
          //   }
          // },
          // autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "  Email/phone number",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
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
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (val) {
              //   if (val!.isEmpty) {
              //     return 'This is a required field';
              //   }
              //   // if (val.length != 8) {
              //   //   return 'enter 8 digits';
              //   // }
              //   return null;
              // },
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.white.withOpacity(0.5),size: 23,),
              hintText: "  Password",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
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
        Container(
              width: 300,
              height: 50,
              child: TextFormField(
               controller: confirmPassController,
                keyboardType: TextInputType.visiblePassword,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (val) {
                //   if (val!.isEmpty) {
                //     return 'This is a required field';
                //   } else if (val != passController.text) {
                //     return 'Enter same password';
                //   // } else if (val.length != 8) {
                //   //   return "enter 8 digits";
                //   } else {
                //     return null;
                //   }
                // },
              // keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.white.withOpacity(0.5),size: 23,),
              hintText: "  Confirm Password",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
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

        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: size.width*0.51,bottom: size.height*0.016),
              child: Text("Birth of Date",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w400,fontSize: 18,),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 150,
                    height: 50,
                    child: TextFormField(
                      controller: dobController,

                      // keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "  Date/month",
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                      // labelText: 'title',
                      // labelStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                Container(
                        width: 110,
                        height: 50,
                        child: TextFormField(
                        // controller: passwordController,
                        // keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "  Year",
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 16,),
                        focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white,width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white,width: 2),
                      ),
                      // labelText: 'title',
                      // labelStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ],
            ),
              Padding(
                padding:  EdgeInsets.only(right: size.width*0.62,bottom: size.height*0.016,top:size.height*0.015 ),
                child: Text("Gender",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w400,fontSize: 18,),),
              ),
             ChipList(
                  listOfChipNames: _gender,
                  activeBgColorList: [Colors.purple.withOpacity(0.4)],
                  borderRadiiList: [30],
                  activeBorderColorList: [ Colors.white],
                  inactiveBgColorList: [Colors.purple.withOpacity(0.4)],
                  activeTextColorList: [ Colors.deepPurpleAccent.shade700],
                  checkmarkColor:   Colors.deepPurpleAccent.shade700,
                  inactiveBorderColorList: [Colors.white],
                  showCheckmark: false,
                  inactiveTextColorList: [Colors.white70],
                  listOfChipIndicesCurrentlySeclected: [initialIndex],
                  extraOnToggle: (value) {
                  setState(() {
                  selectedGender = _gender[value];
                  initialIndex = value;
                  log('Selected Gender $selectedGender');
                });
              },
            ),

            Padding(
              padding:  EdgeInsets.only(top: size.height*0.01),
              child: Row(
                children: [
                  SizedBox(width: 32,),
                  CheckBoxExp(),
                  Text("I Agree with",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w400,fontSize: 16,),),
                  Text(" privacy",style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontWeight: FontWeight.w500,fontSize: 18,),),
                  Text(" and",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w400,fontSize: 16,),),
                  Text(" policy",style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontWeight: FontWeight.w500,fontSize: 18,),),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: size.height*0.01),

              child: ElevatedButton(
                child: Text("Sign up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                   onPressed: ()
                    async {
                    try {
                    if (firstNameController.text.isNotEmpty &&
                    lastNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passController.text.isNotEmpty &&
                     confirmPassController.text.isNotEmpty) {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      FirebaseFirestore firestore = FirebaseFirestore.instance;

                      UserCredential credential =
                      await auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text);

                        UserModel usermodel = UserModel(
                            uid: credential.user!.uid,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            password: passController.text,
                            email: emailController.text,
                            dob: dobController.text,
                            photoUrl: '',
                            gender: selectedGender,
                            followings: [],
                            followers: []);
                        await firestore.collection("users").doc(
                            credential.user!.uid).set(usermodel.toMap());
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => BottomBar(),));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please input all fields",style: TextStyle(color: Colors.white,),),));
                      // }
                    }
                     }catch(e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),)));
                    }
                     },
                  style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple.shade800,
                  backgroundColor: Colors.indigo.shade300.withOpacity(0.5),
                  minimumSize: Size(size.width*0.75, size.height*0.06),
                  shadowColor: Colors.black,
                  elevation: 4.0,

                ),
              ),
            ),
            SizedBox(height: 15,),
          ],
         ),
        ),
         Padding(
          padding:  EdgeInsets.only(bottom: 16),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               SizedBox(width: 2),
               Text("Already have an account ?",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w500,fontSize: 16,),),
               InkWell(
                   onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn(),));
                   },
                   child: Text("Sign in",style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontWeight: FontWeight.w600,fontSize: 17,),)
               ),
               SizedBox(width: 2),
            ],
           ),
          ),
         ]
        ),
        ),

    );
  }
}

