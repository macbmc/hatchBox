import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:hatch_box/update.dart';
class DetP extends StatefulWidget {
  const DetP({Key? key}) : super(key: key);

  @override
  State<DetP> createState() => _DetPState();
}

class _DetPState extends State<DetP> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return HomeP();
                    }));},
                      icon:Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                      iconSize: 25,
                      color: Colors.brown,),

                    IconButton(onPressed:(){},color: Colors.brown, icon:Icon(Icons.person,size: 25,),)
                  ],
                ),
                Container(
                  //color: Color.fromRGBO(220, 212, 220, 5),
                  height: MediaQuery.of(context).size.height/2.5,
                ),
                Container(

                 // height: MediaQuery.of(context).size.height/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                    ),
                    color: Color.fromRGBO(220, 212, 220, 5),
                    borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                  ),

                ),
              ],
            )
        )
    );
  }
}