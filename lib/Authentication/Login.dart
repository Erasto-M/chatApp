import 'package:amazon/Authentication/Register.dart';
import 'package:amazon/Authentication/auth.dart';
import 'package:amazon/Screens/chatroom.dart';
import 'package:amazon/Screens/database.dart';
import 'package:amazon/Widgets/reusableauth.dart';
import 'package:amazon/Widgets/sharedpreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthMethods _authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();
  final _loginformkey = GlobalKey<FormState>();
  FocusNode _passwordfocusnode = FocusNode();
  late  TextEditingController _emailcontroller = TextEditingController(text: '') ;
  late  TextEditingController _passwordcontroller = TextEditingController(text: '');
  bool _isloading = false;
  @override
  void dispose(){
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _passwordfocusnode.dispose();
    super.dispose();
  }
  void _submitformonlogin() async {
    final isvalid = _loginformkey.currentState!.validate();
    if (isvalid) {
      setState(() {
        _isloading = true;
      });
      // await databaseMethods.getuserbyEmail(_emailcontroller.text).then((value) {
      //   querySnapshot = value;
      //   SharedPreferencesHelper.saveUserEmailintoHharedpref(querySnapshot!.docs[1].get("name"));
      // });
     await _authMethods.signInWithEmailAndPassword(
        _emailcontroller.text,
        _passwordcontroller.text,
      ).then((value)async {
        if (value != null) {
          QuerySnapshot _querySnapshot = await databaseMethods.getuserbyEmail(_emailcontroller.text);
          SharedPreferencesHelper.saveUserLoggedintoHharedpref(true);
          SharedPreferencesHelper.saveUserNametoHharedpref(_querySnapshot.docs[0].get("email"));
          SharedPreferencesHelper.saveUserEmailintoHharedpref(_querySnapshot.docs[0].get("name"));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home())).then((value) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Login Succesfully"),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                );
              },
            );
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: _isloading ? Center(
        child: Container(
          child:const  CircularProgressIndicator()),
      ):
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-50,
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:const  EdgeInsets.symmetric(horizontal: 15,vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  Form(
                    key: _loginformkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "enter your email adress";
                            } else if(!value.contains("@")){
                              return "enter a valid email address";
                            }else{
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: (){
                            FocusScope.of(context).requestFocus(_passwordfocusnode);
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: textStyle(),
                        decoration: fieldinputdecoration('Email',Icons.email,Colors.green),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          focusNode: _passwordfocusnode,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: (){
                            _submitformonlogin();
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter your password";
                            }
                          },
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: textStyle(),
                          decoration: fieldinputdecoration('Password', Icons.lock,Colors.green),
                        ),
                      ],
                    ),
                  ),
                 const  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      child: const Text("Forgot Password?",
                          style: TextStyle(color: Colors.white,
                              fontSize: 18,)),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  GestureDetector(
                    onTap: (){
                      _submitformonlogin();
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient:const  LinearGradient(
                          colors: [
                            Color(0xff007EF4),
                            Color(0xff2A75bc)
                          ],
                        ),
                      ),
                      child: const Center(child: Text("SignIn",style: TextStyle(color: Colors.white, fontSize: 18),)),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: const Center(child: Text("Sign In with Google",style: TextStyle(color: Colors.black, fontSize: 18),)),
                    ),
                  ),
                 const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don\'t have an account?",style: TextStyle(color: Colors.white,fontSize: 18),),
                      const SizedBox(width: 3,),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp()));
                          },
                          child: const Text("Register Now",style: TextStyle(
                            color: Colors.white, fontSize: 18, decoration: TextDecoration.underline,
                          ),),)
                    ],
                  ),
                 const  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
      ),
    );
  }
}
