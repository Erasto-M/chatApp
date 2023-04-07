import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
getuserbyusername(String username)async {
 return await FirebaseFirestore.instance.collection("users")
    .where("name", isEqualTo: username).get();
}

getuserbyEmail(String userEmail)async {
  return await FirebaseFirestore.instance.collection("users")
      .where("email", isEqualTo: userEmail).get();
}
uploaduserinfo(userMap){
  FirebaseFirestore.instance
      .collection("users").add(userMap).catchError((e){
    print(e);
  });
}
createChatRoom(docId, chatRoomMap){
  FirebaseFirestore.instance.collection("users").
  doc(docId).set(chatRoomMap).catchError((e){
    print(e.toString());
  });
}
}