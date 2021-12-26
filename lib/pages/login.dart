import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_demo/widgets/textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../classfolder/map_data.dart' as map;
import '../generated/l10n.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey;
  FirebaseFirestore databaseReference;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email;
  @override
  void initState() {
    _formKey = GlobalKey();
    databaseReference = FirebaseFirestore.instance;
    emailController.text = 'arpita@gmail.com';
    passwordController.text = 'Pass@1234';
    super.initState();
  }

  @override
  void dispose() {
    _formKey = null;
    databaseReference.disableNetwork();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          child: Image.asset(
            'assets/food11.jpg',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.hardLight,
            color: Colors.black87,
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textWidget(
                  label: S.of(context).Foodie,
                  fontcolor: Colors.amber[700],
                  fontsize: 60.0,
                  weight: FontWeight.bold,
                  font: 'Lobster'),
              textWidget(
                  label: S.of(context).Bites,
                  fontcolor: Colors.amber[700],
                  fontsize: 60.0,
                  weight: FontWeight.bold,
                  font: 'Lobster'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      formFieldWidget(
                          icon: Icons.email,
                          hint: S.of(context).hintMail,
                          label: S.of(context).Email,
                          context: context,
                          controller: emailController,
                          data: S.of(context).Email,
                          pattern:
                              r"^[a-zA-Z0-9][a-zA-Z0-9.a-zA-Z0-9._-]+@[a-zA-Z]+\.[a-zA-Z]+$",
                          hideText: false,
                          error: S.of(context).Enter_Mail_ID,
                          type: true),
                      SizedBox(height: 20.0),
                      formFieldWidget(
                          icon: Icons.lock,
                          hint: S.of(context).Enter_password,
                          label: S.of(context).Password,
                          context: context,
                          data: S.of(context).Password,
                          controller: passwordController,
                          pattern:
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[_@#$]).{8,}$',
                          hideText: true,
                          error: S.of(context).Enter_valid_password,
                          type: true),
                      SizedBox(height: 20.0),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.lightBlue[300],
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(Icons.login_sharp),
                        onPressed: () {
                          _submit();
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textWidget(
                              label: S.of(context).New_member,
                              fontcolor: Colors.green,
                              fontsize: 25.0,
                              weight: FontWeight.bold),
                          // ignore: deprecated_member_use
                          FlatButton.icon(
                              color: Colors.transparent,
                              height: 40.0,
                              minWidth: 35.0,
                              icon: Icon(
                                Icons.login,
                                color: Colors.green,
                              ),
                              label: textWidget(
                                  label: S.of(context).Sign_up,
                                  fontcolor: Colors.green,
                                  fontsize: 30.0,
                                  weight: FontWeight.bold),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/register');
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(S.of(context).An_Error_Occured),
              content: Text(msg),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text(S.of(context).okay),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      var result = await databaseReference
          .collection("users")
          .where("Email", isEqualTo: map.authData['Email'])
          .where("Password", isEqualTo: map.authData['Password'])
          .get();
      _setSP(result.docs);
      if (result.docs.isNotEmpty) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      var errorMessage = S.of(context).Login_Failed;
      _showErrorDialog(errorMessage);
    }
  }

  void _setSP(List data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserName', data[0]['Name']);
    prefs.setString('Email', data[0]['Email']);
  }
}
