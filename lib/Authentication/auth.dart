import 'package:amazon/Screens/database.dart';
import 'package:amazon/Widgets/sharedpreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  User? _userFromFirebase(UserCredential userCredential) {
    return userCredential.user != null ? User(userId: userCredential.user!.uid) : null;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    DatabaseMethods databaseMethods = DatabaseMethods();
    QuerySnapshot? querySnapshot;
    try {
       UserCredential result =
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(result);
    } catch (e) {
      print(e.toString());
    }
  }
  Future signUpWithEmailAndPassoword(String username, String email, String password)async{
    try{
      UserCredential result = await _firebaseAuth.
      createUserWithEmailAndPassword(email: email, password: password);
      if(result!=null){
        await FirebaseFirestore.instance.collection("users").doc(_firebaseAuth.currentUser!.uid).set({
          "name": username,
          "email": email,
        });
        SharedPreferencesHelper.saveUserEmailintoHharedpref(username);
        SharedPreferencesHelper.saveUserEmailintoHharedpref(email);
        //SharedPreferencesHelper.saveUserLoggedintoHharedpref(true);
      }
      return _userFromFirebase(result);

    }catch(e){
      print(e.toString());
    }
  }
  Future resetpass(String email)async{
    try{
      return await _firebaseAuth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }
  Future signOut()async{
    try{
      return await _firebaseAuth.signOut();
    }catch(e){
     print(e.toString());
    }
  }
}

class User {
  String userId;
  User({required this.userId});
}
