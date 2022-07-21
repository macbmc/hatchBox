import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: StreamBuilder(
         stream:FirebaseFirestore.instance.collection("user-cart").doc(FirebaseAuth.instance
         .currentUser!.email).collection("prod").snapshots(),
         builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
           if(snapshot.hasError)
             {
               return Center(child: Text("Ntho Evdyo oru Prashnm"),);
             }
           return ListView.builder(
             itemCount: snapshot.data!.docs.length,
               itemBuilder: (_,index){
               DocumentSnapshot _docsnap= snapshot.data!.docs[index];
               return ListTile(
                 leading: CircleAvatar(
                   backgroundImage: NetworkImage(
                       _docsnap['image'].toString()),
                 ),
                 trailing: Text(_docsnap["mrp"].toString()),
                 title: Text(_docsnap["prod_name"].toString()),
               );
               }
           );
         },
       )
     ),
    );
  }

}
