import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeformula/credits.dart';
import 'package:lifeformula/privacypolicy.dart';
import 'package:lifeformula/termsofservice.dart';

import 'about.dart';

class HomePage extends StatefulWidget {

  String uidString;

  HomePage(String uidString){
    this.uidString = uidString;
    print('Got the uid string: ' + this.uidString);
  }

  @override
  _HomePageState createState() => _HomePageState(uidString);
}

class _HomePageState extends State<HomePage> {

  String vataNature = '''
  changeability. A vata mind is fueled towards constant movement and is on the go. Vata individuals are generally creative and enthusiastic, but can also suffer from restlessness and anxiety.
  ''';

  String pittaNature = '''
  focus. A pitta mind pushes towards a goal in a driven manner, burning with passion. Pitta individuals maintain good concentration, but can get irritable or frustrated.
  ''';

  String kaphaNature = '''
  consistency. A kapha mind follows the saying "slow and steady wins the race". Kapha individuals are protectively enclosed and stable, but can be sluggish or depressed as well.
  ''';

  String vataDiet = '''
   - Dairy, fats, and oils are good
   
   - Eat sweet/filling fruits and 
   
   - Rice and wheat are the best grains
   
   - Refrain from raw foods and beans
   
   - Eat fewer dry fruits
  ''';

  String pittaDiet = '''
   - Consume a lot of dairy
   
   - Avoid spicy foods and hot peppers
   
   - Rice, wheat, barley, and oats are all 
   
   - Reduce intake of sour fruits
   
   - Try not to eat onions and garlic
  ''';

  String kaphaDiet = '''
   - Try a liquid fast once a week
   
   - Reduce dairy intake
   
   - Avoid sweeteners
   
   - Drink hot ginger tea with meals
   
   - Eat beans/veggies/light fruits
  ''';

  String vataLife = '''
   - Stay warm and wear warm clothing
   
   - Do light, flexible exercises
   
   - Keep bowel movements regular
   
   - Listen to soothing or calming music
   
   - Experience sweet/warm senses
  ''';

  String pittaLife = '''
   - Balance activity with rest
   
   - Make sure not to skip meals
   
   - Frequently spend time in nature
   
   - Laugh every day if you can
   
   - Favor cool colors and aromas
  ''';

  String kaphaLife = '''
   - Seek daily stimulation
   
   - Follow a routine lifestyle
   
   - Stay warm and avoid damp weather
   
   - Clean out accumulating junk
   
   - Get frequent exercise
  ''';

  String vataImage = 'vata.png';
  String pittaImage = 'pitta.png';
  String kaphaImage = 'kapha.png';


  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  String name = '';
  String dosha = '';

  _HomePageState(String uidString){
    database.reference().child('users/user@' + uidString + '/name').once().then((snap) {
      print(snap.value);
      name = snap.value;
    }).catchError((e){
      print(e);
    });
    database.reference().child('users/user@' + uidString + '/dosha').once().then((snap) {
      print(snap.value);
      dosha = snap.value;
      setState((){});
    }).catchError((e){
      print(e);
    });
  }

  String doshaNature(String inputDosha){
    if(inputDosha.contains('V')){
      return vataNature;
    } else if(inputDosha.contains('P')){
      return pittaNature;
    } else{
      return kaphaNature;
    }
  }

  String doshaDiet(String inputDosha){
    if(inputDosha.contains('V')){
      return vataDiet;
    } else if(inputDosha.contains('P')){
      return pittaDiet;
    } else{
      return kaphaDiet;
    }
  }

  String doshaLifestyle(String inputDosha){
    if(inputDosha.contains('V')){
      return vataLife;
    } else if(inputDosha.contains('P')){
      return pittaLife;
    } else{
      return kaphaLife;
    }
  }

  String doshaImage(String inputDosha){
    if(inputDosha.contains('V')){
      return vataImage;
    } else if(inputDosha.contains('P')){
      return pittaImage;
    } else{
      return kaphaImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children: [
              new Container(
                color: Colors.grey[200],
                child: MainPage(),
              ),
              new Container(
                color: Colors.grey[200],
                child: TipsPage(),
              ),
              /*new Container(
                color: Colors.grey[200],
                child: NotesPage(),
              ),
              new Container(
                color: Colors.grey[200],
                child: SchedulePage(),
              ),*/
              new Container(
                color: Colors.grey[200],
                child: SettingsPage(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Container(
              height: 80,
              child: Tab(
                icon: Icon(Icons.home),
              ),
            ),
            Container(
              height: 80,
              child: Tab(
                icon: Icon(Icons.help_outline),
              ),
            ),
            /*Container(
              height: 80,
              child: Tab(
                icon: Icon(Icons.edit),
              ),
            ),*/
            /*Container(
              height: 80,
              child: Tab(
                icon: Icon(Icons.access_time),
              ),
            ),*/
            Container(
              height: 80,
              child: Tab(
                icon: Icon(Icons.settings),
              ),
            ),
          ],
          labelColor: CupertinoColors.activeBlue,
          unselectedLabelColor: CupertinoColors.darkBackgroundGray,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: CupertinoColors.activeBlue,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget TipsPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tips',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'Diet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Expanded(
          flex: 35,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              doshaDiet(dosha),
              style: TextStyle(
                  fontSize: 18,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'Lifestyle',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Expanded(
          flex: 35,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              doshaLifestyle(dosha),
              style: TextStyle(
                  fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /*Widget NotesPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Notes',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 50,
          child: Container(
            color: Colors.grey[400],
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Note ${index+1}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Description/Information',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Title',
                  fillColor: Colors.white,
                  filled: true,
                )
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Content',
                  fillColor: Colors.white,
                  filled: true,
                )
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Add Note',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              IconButton(
                  onPressed: (){
                  },
                  icon: Icon(Icons.add_circle),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget SchedulePage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 20,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 0, 50),
            child: Text(
              'Schedule',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Expanded(
          flex: 40,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'Top Three Priorities',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Expanded(
          flex: 40,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'Upcoming Deadlines',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }*/

  Widget MainPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome, $name!',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 20, 0, 0),
            child: Text(
              'Your Main Dosha is $dosha.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Expanded(
          flex: 35,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/' + doshaImage(dosha)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 30, 0),
            child: Text(
              'User Profile\n\n',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Expanded(
          flex: 35,
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 0, 30, 0),
            child: Text(
                  'Doshas are the states of nature in which all humans fall under.'
                  ' $dosha, your dosha, represents' + doshaNature(dosha),
              style: TextStyle(
                fontSize: 18,
                //letterSpacing: 0.8,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget SettingsPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CupertinoButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                },
                child: Text(
                  'About Life Formula',
                  style: TextStyle(
                      fontSize: 20,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
                },
                child: Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPage()));
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreditsPage()));
                },
                child: Text(
                  'Credits',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
