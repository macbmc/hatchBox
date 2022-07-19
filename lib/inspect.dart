import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor:Color.fromRGBO(220, 212, 220, 5),
        body: SafeArea(
            child: SingleChildScrollView(
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

                      TextButton(onPressed:(){}, child: Container(decoration: BoxDecoration(
                        color: Colors.white,
                        //color: Color.fromRGBO(220, 212, 220, 5),
                        borderRadius:  BorderRadius.all(Radius.circular(40)),
                      ),height:30,width: 100,child: Center(child: Text("Add to Wishlist",style: TextStyle(color: Colors.purple),))))
                    ],
                  ),
                  Container(
                    //color: Color.fromRGBO(220, 212, 220, 5),
                    height: MediaQuery.of(context).size.height/3.5,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Image.asset("assets/hlogo.jpeg"),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/2.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //color: Color.fromRGBO(220, 212, 220, 5),
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                    ),

                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      //color: Color.fromRGBO(220, 212, 220, 5),
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(10),topLeft:Radius.circular(10) ),
                    ),
                      height: 80,
                      width:MediaQuery.of(context).size.width,

                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rs24.5",style: TextStyle(fontSize: 20),),
                            ElevatedButton(onPressed:(){}, child: Text("Checkout")),
                            ElevatedButton(onPressed:(){}, child: Icon(Icons.shopping_cart)),

                          ],
                        ),
                      ),
                    ),

                ],
              ),
            )
        )
    );
  }
}