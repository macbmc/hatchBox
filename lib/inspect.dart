import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/update.dart';
class DetP extends StatefulWidget {
  const DetP({Key? key,required this.ImgPath,
    required this.name,
    required this.discount,
    required this.mrp,
    required this.your_price, required this.ls}) : super(key: key);
  final String ImgPath, name,discount,mrp,your_price,ls;
  @override
  State<DetP> createState() => _DetPState();
}

class _DetPState extends State<DetP> {
  final user = FirebaseAuth.instance.currentUser!;
  Future addtoCart()async{
    var currentuser = FirebaseAuth.instance.currentUser;
    CollectionReference _collectionref = FirebaseFirestore.instance.collection("user-cart");
    return _collectionref.doc(currentuser!.email).collection("prod").doc()
        .set({
      "prod_name":widget.name,
      "price":widget.your_price,
      "image":widget.ImgPath,
      "discount":widget.discount,
      "mrp":widget.mrp
    }).then((value) => print("Added to cart "));
  }
  Future addtoWishlist()async{
    var currentuser = FirebaseAuth.instance.currentUser;
    CollectionReference _collectionref = FirebaseFirestore.instance.collection("user-wishlist");
    return _collectionref.doc(currentuser!.email).collection("item").doc()
        .set({
      "prod_name":widget.name,
      "price":widget.your_price,
      "image":widget.ImgPath,
      "discount":widget.discount,
      "mrp":widget.mrp
    }).then((value) => print("Added to wishlist"));
  }
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
                      IconButton(onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return HomeP();
                      }));},
                        icon:Icon(
                          Icons.arrow_back_ios_outlined,
                        ),
                        iconSize: 25,
                        color: Colors.brown,),

                     IconButton(onPressed: ()=>addtoCart(), icon: Icon(Icons.shopping_cart)),
                      IconButton(onPressed: ()=>addtoWishlist(), icon: Icon(Icons.favorite_border_sharp)),
                    ],
                  ),
                  Container(
                    //color: Color.fromRGBO(220, 212, 220, 5),
                    height: MediaQuery.of(context).size.height/3.5,
                    width: MediaQuery.of(context).size.width/1.2,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      widget.ImgPath,
                      fit: BoxFit.fitWidth,
                      width: 200,
                      height: 95,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //color: Color.fromRGBO(220, 212, 220, 5),
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                    ),
                   child: Text("${widget.ls}"),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,right: 40),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height/9.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.your_price}",style: TextStyle(fontSize: 20),),
                        ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                    color: Colors.teal,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed:(){}, child: Text("Checkout",style: TextStyle(fontSize: 20),)),
                      ],
                    ),
                  )


                ],
              ),
            )
        )
    );
  }
}

/*
Container(
padding: EdgeInsets.all(8.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("Rs24.5",style: TextStyle(fontSize: 20),),
ElevatedButton(onPressed:(){}, child: Text("Checkout")),
ElevatedButton(onPressed:(){}, child: Icon(Icons.shopping_cart)),

],
),
),*/
