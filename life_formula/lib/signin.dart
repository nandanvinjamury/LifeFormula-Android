import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeformula/home.dart';
import 'package:lifeformula/loading.dart';
import 'package:lifeformula/signupA.dart';

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
           Expanded(
              flex: 90,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 85.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 40,
                      child: Image(
                        image: AssetImage('assets/lifeformula_blue_small.png'),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Welcome!',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: TextField(
                              controller: emailController,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                //labelStyle: TextStyle(color: Colors.teal[700]),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                //labelStyle: TextStyle(color: Colors.teal[700]),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          Text('$error', style: TextStyle(color: Colors.red)),
                          Expanded(
                            flex: 30,
                            child: CupertinoButton(
                              disabledColor: Colors.grey,
                              onPressed: () {
                                loading = true;
                                setState(() {});
                                auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((authResult) {
                                  print('Success! $authResult');
                                  error='';
                                  String uidString = authResult.user.uid;
                                  print(uidString);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(uidString)));
                                }).catchError((e) {
                                  print('The error is: $e');
                                  loading = false;
                                  setState(() {});
                                  error='Incorrect E-mail or Password';
                                });
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(fontSize: 22.0, //color: Colors.teal[700]
                                  ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CupertinoButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
                        },
                        child: Text(
                          'New? Sign Up!',
                          textAlign: TextAlign.right,
                        ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      )
    );
  }
}
