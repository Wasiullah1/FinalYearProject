import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String uid;
  String email;
  String name;
  String Contact;
  String image;
  // String role;
  Timestamp createdAt;

  AppUser({this.uid, this.email, this.name, this.createdAt, this.Contact,this.image});

  // receiving data from server
  static AppUser fromMap(Map<String, dynamic> map) {
    return AppUser(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        createdAt: map['created_at'],
        Contact: map['Contact'],
        image: map['image'],
        // role: map['role'],
        );
  }

  // sending data to our server
  static Map<String, dynamic> toMap(AppUser userM) {
    return {
      'uid': userM.uid,
      'email': userM.email,
      'name': userM.name,
      'created_at': Timestamp.now(),
      'Contact': userM.Contact,
      'image': userM.image,
      // 'role': "user",
    };
  }
}
