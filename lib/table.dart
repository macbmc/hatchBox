import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/Home.dart';
import 'package:hatch_box/prof.dart';
class TableP extends StatefulWidget {
  const TableP({Key? key}) : super(key: key);

  @override
  State<TableP> createState() => _TablePState();
}

class _TablePState extends State<TableP> {

  final user = FirebaseAuth.instance.currentUser!;
  int sindex=0;

  void _navbar(int index){
    setState((){
      sindex = index;
    });
  }
  final List<Widget> screens =[
    TablePP(),
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

class TablePP extends StatefulWidget {
  const TablePP({Key? key}) : super(key: key);

  @override
  State<TablePP> createState() => _TablePPState();
}

class _TablePPState extends State<TablePP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Color.fromRGBO(220, 212, 220, 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text("Products",style: TextStyle(fontSize: 23,),),
              IconButton(onPressed:(){},color: Colors.brown, icon:Icon(Icons.power_settings_new,size: 25,),)
            ],
          ),
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
          ]
          ),
        )
      ),
    );
  }
}





// ignore: camel_case_types

/*
class TableProd extends StatelessWidget {
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
          onTap: () {
            */
/*
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

          },
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
}*/
