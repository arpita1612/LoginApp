import 'package:flutter/material.dart';
import '../classfolder/map_data.dart';

Widget formFieldWidget(
    {IconData icon,
    String hint,
    String label,
    bool hideText,
    Pattern pattern,
    TextEditingController controller,
    BuildContext context,
    String data,
    String error,
    bool type}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white54,
      ),
      hintText: hint,
      labelText: label,
      hintStyle: TextStyle(color: Colors.lightBlue[700], fontSize: 15.0),
      labelStyle: TextStyle(color: Colors.lightBlue[200], fontSize: 25.0),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: Colors.white30,
          width: 50.0,
        ),
      ),
    ),
    obscureText: hideText,
    validator: (value) =>
        (value.isEmpty || !validateMyInput(value, pattern)) ? error : null,
    onChanged: (val) {
      type ? authData[data] = val : registerData[data] = val;
    },
  );
}

bool validateMyInput(String value, Pattern pattern) {
  return !RegExp(pattern).hasMatch(value) ? false : true;
}

Widget textWidget(
    {String label,
    double fontsize,
    Color fontcolor,
    String font,
    FontWeight weight}) {
  return Text(
    label,
    style: TextStyle(
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: weight,
        fontFamily: font),
  );
}
