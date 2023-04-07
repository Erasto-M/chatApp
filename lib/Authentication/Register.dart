import 'package:amazon/Authentication/Login.dart';
import 'package:amazon/Authentication/auth.dart';
import 'package:amazon/Screens/database.dart';
import 'package:amazon/Widgets/reusableauth.dart';
import 'package:amazon/Widgets/sharedpreferences.dart';
import 'package:flutter/material.dart';

import '../Screens/chatroom.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthMethods authMethods = AuthMethods();
  DatabaseMethods datamethods =DatabaseMethods();
  final _signupformkey = GlobalKey<FormState>();
  FocusNode _emailfocusnode = FocusNode();
  FocusNode _passwordfocusnode = FocusNode();
  late  TextEditingController _emailcontroller = TextEditingController(text: '') ;
  late  TextEditingController _passwordcontroller = TextEditingController(text: '');
  late  TextEditingController _usernamecontroller = TextEditingController(text: '');
  bool _obsecuretext = true;
  bool _isloading = false;
  @override
  void dispose(){
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _emailfocusnode.dispose();
    _passwordfocusnode.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
  }
  void _submitformonSignup(){
    final isvalid = _signupformkey.currentState!.validate();
    if(isvalid){
      //SharedPreferencesHelper.saveUserEmailintoHharedpref(_emailcontroller.text);
     // SharedPreferencesHelper.saveUserNametoHharedpref(_usernamecontroller.text);
      setState(() {
        _isloading = true;
      });
      authMethods.signUpWithEmailAndPassoword(
        _usernamecontroller.text,
        _emailcontroller.text,
        _passwordcontroller.text.toString(),
      ).then((value) {
        SharedPreferencesHelper.saveUserLoggedintoHharedpref(true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Home()));
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Account created successfully"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body:  _isloading ? Center(
        child: Container(
          child: const CircularProgressIndicator()
        ),
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
                  key: _signupformkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your username";
                          }else{
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          FocusScope.of(context).requestFocus(_emailfocusnode);
                        },
                        controller: _usernamecontroller,
                        keyboardType: TextInputType.name,
                        style: textStyle(),
                        decoration: fieldinputdecoration('Username',Icons.person,Colors.green),
                      ),
                      const  SizedBox(height: 10,),
                      TextFormField(
                        focusNode: _emailfocusnode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          FocusScope.of(context).requestFocus(_passwordfocusnode);
                        },
                        validator: (value){
                          if(value!.isEmpty||value.length<8){
                            return "please enter  email address";
                          }else if(!value.contains("@")){
                            return "please enter a valid email address";
                          }else{
                            return null;
                          }
                        },
                        controller: _emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        style: textStyle(),
                        decoration: fieldinputdecoration('Email',Icons.email,Colors.green),
                      ),
                      const  SizedBox(height: 10,),
                      TextFormField(
                        focusNode: _passwordfocusnode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          _submitformonSignup();
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "please enter your password";
                          }else if(!RegExp(r'^[A-Z]').hasMatch(value)){
                            return "The password should start with a capital letter";
                          } else if (value.length<8){
                            return "please enter a strong password";
                          } else{
                            return null;
                          }
                        },
                        controller: _passwordcontroller,
                        obscureText: _obsecuretext,
                        keyboardType: TextInputType.visiblePassword,
                        style: textStyle(),
                        decoration:  InputDecoration(
                          hintText: "Passowrd",
                          hintStyle:  const TextStyle(
                            color: Colors.white70,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              _obsecuretext = !_obsecuretext;
                            },
                              child: Icon(_obsecuretext ? Icons.visibility :Icons.visibility_off )),
                          prefixIcon:const Icon(Icons.lock,size: 20,color: Colors.green,),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
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
                  onTap: ()async{
                    _submitformonSignup();
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
                    child: const Center(child: Text("SignUp",style: TextStyle(color: Colors.white, fontSize: 18),)),
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
                    child: const Center(child: Text("Sign Up with Google",style: TextStyle(color: Colors.black, fontSize: 18),)),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Alredy have an account?",style: TextStyle(color: Colors.white,fontSize: 18),),
                    const SizedBox(width: 3,),
                    TextButton(
                      onPressed: (){
                       Navigator.of(context).pop();
                      },
                      child: const Text("Login Now",style: TextStyle(
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
