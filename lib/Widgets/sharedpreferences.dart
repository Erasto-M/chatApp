import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper{
   static String userLoggedInshared = "USERLOGGEDIN";
   static String userNameshared = "USERNAMEKEY";
   static String userEmailshared = "USEREMAILKEY";

   /// saving userLoggedin  details to shared preferences
    static Future<bool> saveUserLoggedintoHharedpref(bool isuserloggedin)async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return await preferences.setBool(userLoggedInshared,isuserloggedin );
    }
   static Future<bool> saveUserNametoHharedpref(String userName)async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return await preferences.setString(userNameshared,userName );
   }
   static Future<bool> saveUserEmailintoHharedpref(String userEmail)async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return await preferences.setString(userEmailshared,userEmail );
   }
   /// getting Userdetails from sharedpreferences
   static Future<bool?> getUserLoggedInSharedPreference()async{
      SharedPreferences prefs =await SharedPreferences.getInstance();
      return await prefs.getBool(userLoggedInshared);
   }
   static Future<String?> getUserNameSharedPreferences()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.getString(userNameshared);
   }
   static Future<String?> getUserEmailSharedPreferences()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.getString(userEmailshared);
   }
}