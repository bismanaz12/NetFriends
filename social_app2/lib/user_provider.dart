import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app2/user_model.dart';
import 'package:uuid/uuid.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user;

  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  File? pickedFile;
  FirebaseStorage storage=FirebaseStorage.instance;

  UserModel? get user=>_user;
  UserModel? otherUser;



  updateUserProvider(String imageUrl){
    user!.photoUrl=imageUrl;
    notifyListeners();

  }

  updateUserName(String firstName){
    user!.firstName=firstName;
    notifyListeners();
  }

  updateUserEmail(String email){
    user!.email=email;
    notifyListeners();
  }



  getUserData()async{
    try{
      await _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
        // log(value!.data()!.toString());
        _user=UserModel.fromMap(value.data()!);
        notifyListeners();
      });
    }catch(e){
      log(e.toString());
    }

  }

  pickImage(ImageSource source)async{
    ImagePicker picker=ImagePicker();
    XFile? choosenImage=await picker.pickImage(source: source);

    if(choosenImage!=null){
      pickedFile=File(choosenImage.path);
      notifyListeners();
    }
  }


  Future<String> uploadFileToFirebase(File file,String extension)async{
    String path=Uuid().v4();
    String downloadUrl='';
    await storage.ref(path).child('${path}.$extension').putFile(file).then((p0)async{
      downloadUrl=await p0.ref.getDownloadURL();
    });
    return downloadUrl;
  }

  getUserDataById(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
      await _firestore.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
        _user = UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
        notifyListeners();
      } else {
        print('User with ID $userId does not exist');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  Future<void> getOtherUserDataById(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
      await _firestore.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
        otherUser = UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
        notifyListeners();
      } else {
        print('User with ID $userId does not exist');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }



}