import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeformula/signupC.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {

  String termsText = """
Your privacy is important to us. It is Life Formula's policy to respect your privacy regarding any information we may collect from you through our app, Life Formula.

We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.

We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.

We don’t share any personally identifying information publicly or with third-parties, except when required to by law.

Our app may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.

You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.

Your continued use of our app will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.

This policy is effective as of 20 June 2020.



Privacy Policy created with GetTerms.

""";

  void ContinueToNext(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen[400],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "LIFE FORMULA PRIVACY POLICY",
                  style: TextStyle(
                      fontSize: 18,
                      //color: Colors.teal[700]
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  //color: Colors.lightGreen[400],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      termsText,
                      style: TextStyle(
                          fontSize: 14,
                          //color: Colors.teal[700]
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                CupertinoButton(
                  onPressed: ContinueToNext,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 22
                        //color: Colors.teal[700]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
