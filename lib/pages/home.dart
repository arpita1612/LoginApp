import 'package:flutter/material.dart';
import 'package:login_demo/widgets/textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String stringValue;

  @override
  void initState() {
    stringValue = '';
    _getSP();
    super.initState();
  }

  @override
  void dispose() {
    stringValue = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Container(
          child: Image.asset(
            'assets/food1.jpg',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.hardLight,
            color: Colors.black54,
          ),
        ),
        Container(
          color: Colors.transparent,
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 150.0,
            actions: [
              MaterialButton(
                height: 30.0,
                minWidth: 40.0,
                color: Colors.transparent,
                splashColor: Colors.teal,
                textColor: Colors.cyan[800],
                child: Row(
                  children: [
                    textWidget(
                      label: S.of(context).Logout,
                      fontcolor: Colors.cyan[800],
                      fontsize: 20,
                    ),
                    Icon(Icons.login_sharp),
                  ],
                ),
                onPressed: () async {
                  removeSP();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textWidget(
                label: S.of(context).Welcome,
                fontcolor: Colors.cyan[700],
                fontsize: 70,
                weight: FontWeight.bold,
                font: 'Lobster'),
            textWidget(
                label: S.of(context).Foodie,
                fontcolor: Colors.cyan[700],
                fontsize: 60,
                weight: FontWeight.bold,
                font: 'Lobster'),
          ],
        ),
      ]),
    );
  }

  Future<String> _getSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      stringValue = prefs.getString('UserName');
    });
    return stringValue;
  }

  void removeSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
