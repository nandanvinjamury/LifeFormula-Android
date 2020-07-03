import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CreditsPage extends StatelessWidget {

  String termsText = """

App Developer: Nandan Vinjamury

Flutter and Firebase Mentor: Dr. Yu Sun

Logomakr.com for the Logo

HeyMonicaB for the Dosha Images

Special Thanks to Manjusha and Sivarama Vinjamury for Ayurvedic Guidance
""";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    "LIFE FORMULA CREDITS",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        termsText,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
