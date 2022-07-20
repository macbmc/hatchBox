import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List wishitem=[];
  @override
  void initState(){
    fetchWishlistProducts();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold();
  }
  fetchWishlistProducts()async{
    QuerySnapshot qsn= await FirebaseFirestore.instance.collection("user-cart")
        .doc(FirebaseAuth.instance.currentUser!.email).collection("prod").get();
    setState(() {
      for(int i =0; i< qsn.docs.length;i++){
        wishitem.add(
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
