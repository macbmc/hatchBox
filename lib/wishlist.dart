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
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
            stream:FirebaseFirestore.instance.collection("user-wishlist").doc(FirebaseAuth.instance
                .currentUser!.email).collection("item").snapshots(),
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
