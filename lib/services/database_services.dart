import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DatabaseServices {
  static Future<String> uploadImage(String userId, File image) async {
    try {
      TaskSnapshot task = await FirebaseStorage.instance
          .ref(
              'images/${userId.toString() + '_' + Timestamp.now().toString()}.png')
          .putFile(image);
      String url = await task.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: 'Error ${e.code}: ${e.message}');
      return null;
    }
  }
}
