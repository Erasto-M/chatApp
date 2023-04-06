import 'package:amazon/Screens/database.dart';
import 'package:amazon/Widgets/reusableauth.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  databaseMethods datamethods = databaseMethods();
  final _searchcontroller = TextEditingController();
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
                      //datamethods.getuserbyusername(_searchcontroller.text);
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
            )
          ],
        ),
      ),
    );
  }
}
