import 'package:flutter/material.dart';
import 'package:hatch_box/prof.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  final user =FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.power_settings_new,
            ),
            iconSize: 30,
            color: Colors.red,
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            iconSize: 30,
            color: Colors.red,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return ProfP();
            }));},
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(user.email!),
        ),
      ),
    );
  }
}
