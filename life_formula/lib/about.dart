import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {

  String termsText = """

Life Formula was designed with the idea of ancient Indian medicine, or Ayurveda, in mind.

Backed by many scientific studies, people are categorized based on their many physiological and mental functions. From these different 
functions, a profile is constructed. Based on this profile, the best suggestions catered to you are offered such that you can find your
own path to success.

This theory developed in ancient India was later extrapolated upon by the late Carl Gustav Jung, a famous psychologist recognized for 
founding analytical psychology. These studies were expanded even further, leading to Myers' Briggs personality classification. It is
important to note that all of these studies were made possible by the origin of observing properties centuries past. We hope this
understanding will help you accept and learn to grow too. 
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
                    "ABOUT LIFE FORMULA",
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
