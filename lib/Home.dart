// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/cart.dart';
import 'package:hatch_box/inspect.dart';
import 'package:hatch_box/messages.dart';
import 'package:hatch_box/prof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/search.dart';
import 'package:hatch_box/table.dart';
import 'package:hatch_box/wishlist.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  final user = FirebaseAuth.instance.currentUser!;
  int sindex=0;

  void _navbar(int index){
    setState((){
      sindex = index;
    });
  }
  final List<Widget> screens =[
    HomePP(),
    Messages(),
    Wishlist(),
    Cart(),
    ProfP(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.brown,
        onTap:_navbar,
        elevation: 0,
        backgroundColor:Color.fromRGBO(220, 212, 220, 5),
        currentIndex: sindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message_rounded),label:"Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
        ],
      ),
      body: screens[sindex],
    );
  }
}
class HomePP extends StatefulWidget {
  const HomePP({Key? key}) : super(key: key);

  @override
  State<HomePP> createState() => _HomePPState();
}

class _HomePPState extends State<HomePP> {

  List<String> images=[
    "assets/Banner 3.jpg",
    "assets/Banner 1 .jpg",
     "assets/Banner 2 .jpg",
  ];
  List prod=[];


  @override
  void initState(){
    fetchProducts();
    super.initState();
  }
  Widget build(BuildContext context) {




    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(220, 212, 220, 5),
              child: Center(
                child: Stack(children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.menu,
                                ),
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) {
                                    return ProfP();
                                  }));
                                },
                              ),
                              Text(
                                "hatchBox",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color.fromRGBO(0, 0, 139, 1)),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.search_rounded,
                                    ),
                                    iconSize: 30,
                                    onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                      return Search();
                                    }));},
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.logout,
                                    ),
                                    iconSize: 30,
                                    onPressed: () => FirebaseAuth.instance.signOut(),
                                  ),
                                  /*IconButton(
                                    icon: Icon(
                                      Icons.shop,
                                    ),
                                    iconSize: 30,
                                    onPressed: () =>print(prod) ,
                                  ),*/
                                ],
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: PageView.builder(
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 400,
                                    width: double.infinity,
                                    child: Image.asset(images[index],
                                    fit: BoxFit.cover,),
                                  );
                                }),
                          ),
                        ),



                        SizedBox(height: 30,),
                        Text("Categories",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight:FontWeight.bold),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return TableP();
                              }));},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                elevation: 10.0,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width * .2,
                                  height: 80,
                                  child: Center(
                                    child: Icon(Icons.table_bar_rounded,size: 35,color: Colors.brown),
                                  ),

                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 10.0,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * .2,
                                height: 80,
                                child: Center(
                                  child: Icon(Icons.chair,size: 35,color: Colors.brown,),
                                ),

                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 10.0,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * .2,
                                height: 80,
                                child: Center(
                                  child: Icon(Icons.bed_rounded,size: 35,color: Colors.brown),
                                ),

                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                elevation: 10.0,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width * .2,
                                  height: 80,
                                  child: Center(
                                    child: Icon(Icons.electrical_services_outlined,size: 35,color: Colors.brown),
                                  ),


                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text("Popular Merchandise",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight:FontWeight.bold),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Product(
                                ImgPath: prod[0]["image"].toString(),
                                name: prod[0]["name"].toString(),
                                discount: prod[0]["discount"].toString(),
                                mrp: "550",
                                your_price: prod[0]["your_price"].toString(),
                                cat: "Furniture",
                                long_description: "High Quality",
                                status: "Avaliable"),
                            Product(
                                ImgPath: prod[1]["image"].toString(),
                                name: prod[1]["name"].toString(),
                                discount: prod[1]["discount"].toString(),
                                mrp: "550",
                                your_price: prod[1]["your_price"].toString(),
                                cat: "Furniture",
                                long_description: "High Quality",
                                status: "Avaliable"),
                          ],
                        ),
                        /*Row(
                          children: [
                            Product(
                                ImgPath: "assets/table copy.png",
                                name: "Table",
                                discount: "5",
                                mrp: "599",
                                your_price: "549",
                                cat: "Furniture",
                                long_description: "High Quality",
                                status: "Avaliable"),
                            Product(
                                ImgPath: "assets/sofa1.png",
                                name: "Side Table",
                                discount: "5",
                                mrp: "599",
                                your_price: "549",
                                cat: "Furniture",
                                long_description: "High Quality",
                                status: "Avaliable"),
                          ],
                        )*/


                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
    );
  }
  fetchProducts()async{
    QuerySnapshot qsn= await FirebaseFirestore.instance.collection("items").get();
    setState(() {
      for(int i =0; i< qsn.docs.length;i++){
        prod.add(
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

// ignore: camel_case_types

class Product extends StatelessWidget {
  @override
  String ImgPath, name, cat;

  // ignore: use_key_in_widget_constructors
  Product(
      {

        // ignore: non_constant_identifier_names
        required this.ImgPath,
        required this.name,
        required this.discount,
        required this.mrp,
        required this.your_price,
        required this.cat,
        required this.long_description,
        required this.status});

  String mrp, discount, your_price, status, long_description;

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Stack(children: [
        GestureDetector(
          /*onTap: () {
            *//*
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetP(
                  Img: ImgPath,
                  Name: name,
                  Discount: discount,
                  Mrp: mrp,
                  Your_price: your_price,
                  Status: status,
                  Item_Category: cat,
                  Description: long_description,
                )));*//*
          },*/
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return DetP(ImgPath:ImgPath,name:name ,discount: discount,mrp: mrp,your_price: your_price,);
    }));},
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            elevation: 10.0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * .45,
              height: 180,
              //width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImgPath,
                    fit: BoxFit.fitWidth,
                    width: 160,
                    height: 100,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView(children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                            ])),
                        Row(
                          children: [
                            Text(r"₹"),
                            Text(
                              mrp,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              your_price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
