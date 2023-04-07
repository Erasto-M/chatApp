import 'package:amazon/Screens/database.dart';
import 'package:amazon/Widgets/reusableauth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods _databaseMethods = DatabaseMethods();
  final _searchcontroller = TextEditingController();
   QuerySnapshot? _querySnapshot;
  initiatesearch(){
    _databaseMethods.getuserbyusername(_searchcontroller.text).then((value){
      setState(() {
        _querySnapshot = value;
      });
    });
  }
  Widget searchList(){
    return _querySnapshot  != null ? ListView.builder(
        itemCount: _querySnapshot!.docs.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index){
          return Listview(
            useremail: _querySnapshot!.docs[index].get('name'),
            username: _querySnapshot!.docs[index].get("email"),
          );
        }): Container();
  }
  @override
  void initState(){
    super.initState();
    initiatesearch();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0x54FFFFFF)
              ),
              child: Row(
                children:  [
                   Expanded(
                      child:
                      TextField(
                        controller: _searchcontroller,
                        style: const TextStyle(color: Colors.white,fontSize: 18),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "search username .....",
                          hintStyle: TextStyle(color: Colors.white54,fontSize: 18),
                        ),
                      )),
                  GestureDetector(
                    onTap: (){
                      initiatesearch();
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(Icons.search,color: Colors.white,size: 30,)),
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}
class Listview extends StatelessWidget {
  String username;
  String useremail;
  Listview({required this.username,required this.useremail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(username, style: const TextStyle(color: Colors.white,fontSize: 25),),
              const SizedBox(height: 5,),
              Text(useremail,style: const TextStyle(color: Colors.white,fontSize: 25), ),
            ],
          ),
          Expanded(child: Container()),
        Container(
          height: 50,
          width: 100,
          decoration:  BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25)
          ),
          padding:const  EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: const Center(
            child:  Text(
              "Message", style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ],
      ),
    );
  }
}

