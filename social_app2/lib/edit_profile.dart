import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/signup.dart';
import 'package:social_app2/user_provider.dart';

class EditPro extends StatefulWidget {
  const EditPro({super.key});

  @override
  State<EditPro> createState() => _EditProState();
}

class _EditProState extends State<EditPro> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProv = Provider.of<UserProvider>(context, listen: false).user;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //   stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.deepPurpleAccent.shade700.withOpacity(0.9),
                Colors.purple.shade800.withOpacity(0.7),
                Colors.purple.shade700.withOpacity(0.6),
                // Colors.purple.shade800.withOpacity(0.6),
                Colors.purple.shade200.withOpacity(0.9),
                Colors.purple.shade100.withOpacity(0.9),
              ],
            ),),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.shade700.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(190),
                    bottomLeft: Radius.circular(190),
                  ),
                ),
                height: size.height*0.4,
                child: Column(
                  children: [
                    Text("",style: TextStyle(fontSize: 20,color: Colors.white70),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<UserProvider>(
                            builder: (context,userPro,_) {
                              return InkWell(
                                onTap: ()async{

                                  Provider.of<UserProvider>(context,listen: false).pickImage(ImageSource.gallery);
                                  String url=await   Provider.of<UserProvider>(context,listen: false).uploadFileToFirebase(userPro.pickedFile!, 'jpg');
                                  Provider.of<UserProvider>(context,listen: false).updateUserProvider(url);
                                  await    FirebaseFirestore.instance.collection('users').doc(userPro.user!.uid).update({
                                    'photoUrl':url
                                  });

                                },
                                child: Consumer<UserProvider>(

                                    builder: (context,userPro,_) {
                                      return CircleAvatar(
                                        radius: 80,
                                        backgroundImage:userPro.user!.photoUrl.isNotEmpty?NetworkImage(userPro.user!.photoUrl) : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgpPwM5mR5lNHGg9vxaoUgcnAIBOJumsoJrg&s'),
                                      );
                                    }
                                ),
                              );
                            }
                        ),

                      ],
                    ),
                    Text(userProv!.firstName,style:  TextStyle(fontSize: 28,fontFamily: "FontMain",color: Colors.white),),
                    Text(userProv.email,style: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 18,),),

                  ],
                ),
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                            indent: 30,
                            endIndent: 20,
                            height: 70,
                            color: Colors.white,
                          )),
                      Text("Edit Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 23,),),
                      Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 30,
                            height: 70,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: Text("Your Name",style:  TextStyle(color: Colors.deepPurpleAccent.shade700,fontWeight: FontWeight.w700,fontSize: 18,),)
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Container(
                      margin: EdgeInsets.only(bottom: 10,top: 10),
                      width: 310,
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white,fontSize: 18),
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(bottom: 60),
                            fillColor: Color(0xFF20E2D7),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:  Colors.white),
                            ),
                            suffixIcon:
                            PopupMenuButton(
                              icon: Icon(Icons.edit,color: Colors.deepPurpleAccent.shade700),
                              color:Colors.white,
                              // iconColor:  Colors.teal[900],
                              onSelected: (value){
                                if(value=='Edit'){
                                  showDialog(context: context, builder: (context) {
                                    nameController.text= userProv.firstName;
                                    return
                                      AlertDialog(content:
                                      TextFormField(controller: nameController,),actions: [
                                        StreamBuilder(
                                          stream:  FirebaseFirestore.instance.collection('users').doc(userProv.uid).snapshots(),
                                          builder: (context,index) {
                                            return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.deepPurpleAccent.shade700.withOpacity(0.6),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                onPressed: (){
                                                  Provider.of<UserProvider>(context,listen: false).updateUserName(nameController.text);
                                                  FirebaseFirestore.instance.collection('users').doc(userProv.uid).update({
                                                    'firstName':nameController.text,
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child:Text("Edit",style: TextStyle(color: Colors.white),));
                                          }
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.deepPurpleAccent.shade700.withOpacity(0.6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            child:Text("Cancel",style: TextStyle(color: Colors.white),)),
                                      ],);
                                  });
                                }else {
                                  Navigator.pop(context);
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(child: Row(
                                    children: [
                                      // Icon(Icons.edit,color: Colors.white,size: 17,),
                                      SizedBox(width: 5,),
                                      Text("Rename",style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontSize: 18),),
                                    ],
                                  ),value: "Edit",),
                                ];
                              },),
                            hintText: userProv.firstName,
                            hintStyle: TextStyle(
                                color: Colors.white,  fontWeight: FontWeight.w500,fontFamily: "BreeSerif",fontSize: 19)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: Text("Your Email",style:  TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.deepPurpleAccent.shade700),),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 25,top: 15),
                    width: 310,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(bottom: 60),
                          fillColor: Color(0xFF20E2D7),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Colors.white),
                          ),
                          suffixIcon:
                          PopupMenuButton(
                            icon: Icon(Icons.edit,color: Colors.deepPurpleAccent.shade700),
                            color: Colors.grey[200],
                            // iconColor:  Colors.teal[900],
                            onSelected: (value){
                              if(value=='Edit'){
                                showDialog(context: context, builder: (context) {
                                  emailController.text=userProv.email;
                                  return
                                    AlertDialog(content: TextFormField(controller: emailController,),actions: [
                                      StreamBuilder(
                                          stream:  FirebaseFirestore.instance.collection('users').doc(userProv.uid).snapshots(),
                                          builder: (context,index) {
                                          return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.deepPurpleAccent.shade700.withOpacity(0.6),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: (){
                                                Provider.of<UserProvider>(context,listen: false).updateUserEmail(emailController.text);
                                                FirebaseFirestore.instance.collection('users').doc(userProv.uid).update({
                                                  'email':emailController.text,
                                                });
                                                Navigator.pop(context);
                                              },
                                              child:Text("Edit",style: TextStyle(color: Colors.white),));
                                        }
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepPurpleAccent.shade700.withOpacity(0.6),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child:Text("Cancel",style: TextStyle(color: Colors.white),)),
                                    ],);
                                });
                              }else {
                                Navigator.pop(context);
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(child: Row(
                                  children: [
                                    // Icon(Icons.edit,color: Colors.white,size: 17,),
                                    SizedBox(width: 5,),
                                    Text("Rename",style: TextStyle(color: Colors.deepPurpleAccent.shade700,fontSize: 18),),
                                  ],
                                ),value: "Edit",),
                              ];
                            },),


                          hintText: userProv.email,
                          hintStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500,fontSize: 19)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 3, right: 3),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.deepPurpleAccent.shade700.withOpacity(0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await auth.signOut();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp(),));
                        },
                        child:
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text("Log Out",
                            style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "FontMain"),),
                        )),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

