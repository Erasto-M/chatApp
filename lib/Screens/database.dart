import 'package:cloud_firestore/cloud_firestore.dart';

class databaseMethods{
getuserbyusername(String username){
FirebaseFirestore.instance.collection("users")
    .where("name", isEqualTo: username).get();
}
uploaduserinfo(userMap){
  FirebaseFirestore.instance
      .collection("users").add(userMap).catchError((e){
    print(e);
  });
}
}