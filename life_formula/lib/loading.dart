import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Loading Profile',
            style: TextStyle(
              fontSize: 22,
              //fontWeight: FontWeight.bold,
              color: CupertinoColors.activeBlue
            ),
          ),
          SizedBox(height: 20),
          SpinKitThreeBounce(
            color: CupertinoColors.activeBlue,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}

