// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hatch_box/inspect.dart';
import 'package:hatch_box/prof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/search.dart';
import 'package:hatch_box/searchget.dart';
import 'package:hatch_box/table.dart';

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
    ProfP(),
    ProfP(),
    ProfP(),
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

  @override
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


                        /*Container(
                          margin: EdgeInsets.only(left: 20.0,right: 20.0),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          child: TextField(
                            controller: searchcontroller,
                            style: TextStyle(color: Color(0xff4c505b)),
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.search_rounded,
                                  ),
                                  iconSize: 30,
                                  onPressed: (){},
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  iconSize: 30,
                                  onPressed: (){},
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color:Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Color(0xff4c505b)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),*/
                       /* GetBuilder<DataController>(
                          init: DataController(),
                          builder:(val){
                            return IconButton(onPressed:(){val.queryData(searchcontroller.text).then((value){
                              snapshotdata = value;
                              setState(()
                              {
                                isExec = true;
                              });
                            });
                              searchData();
                            },  icon: Icon(
                              Icons.search_rounded,
                            ),);
                          } ,
                        ),
*/
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
                              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return DetP();
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
                                ImgPath: "assets/side_table.png",
                                name: "Table",
                                discount: "5",
                                mrp: "599",
                                your_price: "549",
                                cat: "Furniture",
                                long_description: "High Quality",
                                status: "Avaliable"),
                            Product(
                                ImgPath: "assets/chair.png",
                                name: "Chair",
                                discount: "5",
                                mrp: "599",
                                your_price: "549",
                                cat: "Furniture",
                                long_description: "High Quality",
                                status: "Avaliable"),
                          ],
                        ),
                        Row(
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
                        )


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
                builder: (context) => ShowallDetails(
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
    return DetP();
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
