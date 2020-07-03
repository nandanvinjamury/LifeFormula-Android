import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeformula/home.dart';
import 'package:lifeformula/loading.dart';

class Questionnaire extends StatefulWidget {
  String name;
  String email;
  String password;

  Questionnaire(this.name, this.email, this.password);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {

  var questionList = [
    {
      'question' : '1. What best resembles your frame?',
      'op1' : 'Thin, delicate build with prominent joints',
      'op2' : 'Medium build with healthy muscles',
      'op3' : 'Large, stocky, or round build'
    },
    {
      'question' : '2. What best resembles your skin?',
      'op1' : 'Rough, Dry',
      'op2' : 'Irritable, Warm',
      'op3' : 'Smooth, Moist'
    },
    {
      'question' : '3. What best resembles your hair?',
      'op1' : 'Brittle, Thin',
      'op2' : 'Smooth, Oily',
      'op3' : 'Luscious, Thick'
    },
    {
      'question' : '4. What best resembles your teeth?',
      'op1' : 'Small, Crooked',
      'op2' : 'Medium, Yellowish',
      'op3' : 'Large, White'
    },
    {
      'question' : '5. What best resembles your veins?',
      'op1' : 'Prominent',
      'op2' : 'Just Visible',
      'op3' : 'Not Visible'
    },
    {
      'question' : '6. What best describes your digestive nature?',
      'op1' : 'Irregular appetite and digestion',
      'op2' : 'Strong appetite and fast digestion',
      'op3' : 'Poor appetite and slow digestion'
    },
    {
      'question' : '7. How are your bowel movements generally?',
      'op1' : 'Hard, Irregular',
      'op2' : 'Semisolid, Frequent',
      'op3' : 'Smooth, Regular'
    },
    {
      'question' : '8. How are your sleep patterns best described?',
      'op1' : 'Disturbed, Light',
      'op2' : 'Sound, Short',
      'op3' : 'Deep, Long'
    },
    {
      'question' : '9. What best resembles the condition of your daily activity?',
      'op1' : 'Quick, Short',
      'op2' : 'Moderate, Long',
      'op3' : 'Slow, Short'
    },
    {
      'question' : '10. What best resembles the way you talk?',
      'op1' : 'Fast, Talkative',
      'op2' : 'Precise, Sharp',
      'op3' : 'Slow, Silent'
    },
    {
      'question' : '11. What best describes your endurance level?',
      'op1' : 'Low',
      'op2' : 'Moderate',
      'op3' : 'High'
    },
    {
      'question' : '12. What best describes your favorite temperature?',
      'op1' : 'I get cold easily, and prefer the warmth',
      'op2' : 'I am usually warm, and prefer the cold',
      'op3' : 'I am adaptable, but do not like cold, wet days'
    },
    {
      'question' : '13. What best describes your temperament?',
      'op1' : 'I am lively and like to change',
      'op2' : 'I am purposeful and like to convince',
      'op3' : 'I am easy-going and like to support'
    },
    {
      'question' : '14. How are most friendships in your life?',
      'op1' : 'Superficial but many friends',
      'op2' : 'Good and moderate friends',
      'op3' : 'Few but long-lasting friends'
    },
    {
      'question' : '15. What best describes your stress response?',
      'op1' : 'Fearful, Anxious',
      'op2' : 'Angry, Enraged',
      'op3' : 'Withdrawn, Reclusive'
    },
    {
      'question' : '16. What best explains your mind function?',
      'op1' : 'Erratic, Variable, Quick, Forgetful',
      'op2' : 'Determined, Strong, Sharp, Focused',
      'op3' : 'Steady, Consistent, Slow, Memorious'
    },
  ];

  var acceptValue = [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45];
  int vata = 0;
  int pitta = 0;
  int kapha = 0;
  String dosha = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  bool loading = false;

  void CalculatePoints(){
    for(int i=0; i<acceptValue.length; i++){
      if(acceptValue[i] % 3 == 0){
        vata++;
      } else if(acceptValue[i] % 3 == 1){
        pitta++;
      } else{
        kapha++;
      }
    }
    if(vata > pitta && vata > kapha){
      dosha='Vata';
    }
    else if(pitta > vata && pitta > kapha){
      dosha='Pitta';
    }
    else if(kapha > vata && kapha > pitta){
      dosha='Kapha';
    }
    else{
      dosha='Vata-Pitta-Kapha';//not possible with 16 but just in case
    }

  }

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
                  child: Text(
                    'Please answer the following 16 questions to the best of your ability based on the patterns that have been true for most of your life, not just now.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: questionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '${questionList[index]['question']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0+index*3,
                                        groupValue: acceptValue[index],
                                        onChanged: (val) => setState(() {acceptValue[index] = val;}),
                                      ),
                                      Text(
                                        '${questionList[index]['op1']}',
                                        style: TextStyle(
                                            fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1+index*3,
                                        groupValue: acceptValue[index],
                                        onChanged: (val) => setState(() {acceptValue[index] = val;}),
                                      ),
                                      Text(
                                        '${questionList[index]['op2']}',
                                        style: TextStyle(
                                            fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2+index*3,
                                        groupValue: acceptValue[index],
                                        onChanged: (val) => setState(() {acceptValue[index] = val;}),
                                      ),
                                      Text(
                                        '${questionList[index]['op3']}',
                                        style: TextStyle(
                                            fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: CupertinoButton(
                    onPressed: (){
                      CalculatePoints();
                      loading = true;
                      setState((){});
                      auth.createUserWithEmailAndPassword(email: widget.email, password: widget.password).then((authResult) {

                        var UserProfile = {
                          'name' : widget.name,
                          'email' : widget.email,
                          'dosha' : dosha,
                        };

                        database.reference().child('users/user@' + authResult.user.uid).set(UserProfile).then((value){
                          print("Success for database save");
                          String uidString = authResult.user.uid;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(uidString)));
                        }).catchError((e) {
                          print("Error" + e.toString());
                        });
                      }).catchError((e) {
                        print('The error is: $e');
                        loading = false;
                        setState(() {});
                      });
                    },
                    child: Text(
                      'Create Profile',
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
