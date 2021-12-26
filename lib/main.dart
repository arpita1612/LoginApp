import 'package:flutter/material.dart';
import 'package:login_demo/generated/l10n.dart';
import 'package:login_demo/pages/home.dart';
import 'package:login_demo/pages/login.dart';
import 'classfolder/route_generator.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences prefs;
  bool check = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      check = prefs.getString('UserName') == null ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Login App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: check ? Home() : Login(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
