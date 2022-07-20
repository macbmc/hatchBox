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
  List cartitem=[];

  @override
  void initState(){
    fetchCartProducts();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
  fetchCartProducts()async{
    QuerySnapshot qsn= await FirebaseFirestore.instance.collection("user-cart")
    .doc(FirebaseAuth.instance.currentUser!.email).collection("prod").get();
    setState(() {
      for(int i =0; i< qsn.docs.length;i++){
        cartitem.add(
            {
              "name":qsn.docs[i]["name"],
              "imagepath":qsn.docs[i]["image"],
              "mrp":qsn.docs[i]["mrp"],
              "discount":qsn.docs[i]["discount"],
              "your_price":qsn.docs[i]["your_price"],
              "category":qsn.docs[i]["category"]
            }
        );
      }
    });
  }
}
