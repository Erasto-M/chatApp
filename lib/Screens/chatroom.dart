import 'package:amazon/Authentication/Authenticate.dart';
import 'package:amazon/Authentication/Login.dart';
import 'package:amazon/Authentication/auth.dart';
import 'package:amazon/Screens/search.dart';
import 'package:amazon/Widgets/reusableauth.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const  Text("ChatRoom", style: TextStyle(color: Colors.white, fontSize: 30),),
        actions:  [
           GestureDetector(
             onTap: (){
               _authMethods.signOut();
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Authenticate()));
             },
             child: Container(
               padding:const  EdgeInsets.symmetric(horizontal: 18),
                 child: const Icon(Icons.exit_to_app, color: Colors.white,size: 30)),
           ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(child: Text("Welcome",style: TextStyle(color: Colors.white),)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
        },
      ),
    );
  }
}
