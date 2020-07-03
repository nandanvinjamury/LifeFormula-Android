import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signupD.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  String nameError = '';
  String emailError = '';
  String passMatchError = '';
  String passValidError = '';

  void ContinueToNext(String name, String email, String password){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Questionnaire(name, email, password)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen[400],
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Account Information",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: nameController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Name',
                fillColor: Colors.white,
                filled: true,
              )
            ),
            Text(
              nameError,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                //labelStyle: TextStyle(color: Colors.teal[700]),
                fillColor: Colors.white,
                filled: true,
              )
            ),
            Text(
              emailError,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                //labelStyle: TextStyle(color: Colors.teal[700]),
                fillColor: Colors.white,
                filled: true,
              )
            ),
            Text(
              passValidError,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordConfirmController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                //labelStyle: TextStyle(color: Colors.teal[700]),
                fillColor: Colors.white,
                filled: true,
              )
            ),
            Text(
              passMatchError,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),
            CupertinoButton(
              onPressed: (){
                if(nameController.text.length < 1){
                  nameError = 'Please provide a name!';
                  setState(() {});
                } else {
                  nameError = '';
                }
                if(!EmailValidator.validate(emailController.text)){
                  emailError = 'Invalid E-mail. Must be in a user@website format.';
                  setState(() {});
                } else {
                  emailError = '';
                }
                if (passwordController.text.compareTo(passwordConfirmController.text) != 0){
                  passMatchError = 'Passwords don\'t match!';
                  setState(() {});
                } else {
                  passMatchError = '';
                }
                if (passwordController.text.length < 6){
                  passValidError = 'Invalid Password. Must be at least 6 characters long.';
                  setState(() {});
                } else {
                  passValidError = '';
                }
                if (nameController.text.length >=1 && EmailValidator.validate(emailController.text) && passwordController.text.compareTo(passwordConfirmController.text) == 0 && passwordController.text.length >= 6){
                  ContinueToNext(nameController.text, emailController.text, passwordController.text);
                }
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  //color: Colors.teal[700],
                  fontSize: 22
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
