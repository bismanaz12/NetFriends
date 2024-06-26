import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'note_model.dart';

class PostProvider with ChangeNotifier{
  File? pickedFile;
  FirebaseStorage storage=FirebaseStorage.instance;
  List<NoteModel> _allPosts =[];
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  List<NoteModel> get allPosts=>_allPosts;


  pickImage(ImageSource source)async{
    ImagePicker picker=ImagePicker();
    XFile? choosenImage=await picker.pickImage(source: source);

    if(choosenImage!=null){
      pickedFile=File(choosenImage.path);
      notifyListeners();
    }
  }
  // setImageNull(File? image1) {
  //   pickedFile = image1;
  //   notifyListeners();
  // }

  pickedFileToNull(){
    pickedFile=null;
    notifyListeners();
  }

  Future<String> uploadFileToFirebase(File file,String extension)async{
    String path=Uuid().v4();
    String downloadUrl='';
    await storage.ref(path).child('${path}.$extension').putFile(file).then((p0)async{
      downloadUrl=await p0.ref.getDownloadURL();
    });
    return downloadUrl;
  }
  getAllPosts()async{
    await _firestore.collection('posts').get().then((value){
      _allPosts=value.docs.map((e) => NoteModel.fromMap(e.data())).toList();
      notifyListeners();

    });
  }
  getUserPosts(String userId) async {
    await _firestore.collection('posts').where('userUid', isEqualTo: userId).get().then((value) {
      _allPosts = value.docs.map((e) => NoteModel.fromMap(e.data())).toList();
      notifyListeners();
    });
  }
}