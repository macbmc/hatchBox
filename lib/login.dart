// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:hatch_box/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return HomeP();
            }
            else {
              return LoginPP();
            }
          },
        )
      ),
    );
  }
}
class LoginPP extends StatefulWidget {
  const LoginPP({Key? key}) : super(key: key);

  @override
  State<LoginPP> createState() => _LoginPPState();
}

class _LoginPPState extends State<LoginPP> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final snackBar = SnackBar(content: Text('Long time no see..Welcome back'));
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(),
          Container(
            padding: EdgeInsets.only(left: 35, top: 100),
            child: Text(
              'Welcome\nBack...',
              style: TextStyle(color: Colors.blue, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            /*fillColor: Colors.grey.shade100,
                                filled: true,*/
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          style: TextStyle(),
                          obscureText: true,
                          controller: passController,
                          decoration: InputDecoration(
                            //fillColor: Colors.grey.shade100,
                            //filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.w700),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: signIn,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return MyRegister();
                              }));},
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18),
                              ),
                              style: ButtonStyle(),
                            ),
                            /*TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                )),*/
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future signIn() async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password:passController.text.trim(),
    );
  }


}

