// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter valid Email ID`
  String get Enter_Mail_ID {
    return Intl.message(
      'Enter valid Email ID',
      name: 'Enter_Mail_ID',
      desc: '',
      args: [],
    );
  }

  /// `Foodie`
  String get Foodie {
    return Intl.message(
      'Foodie',
      name: 'Foodie',
      desc: '',
      args: [],
    );
  }

  /// `/login`
  String get Login_Route {
    return Intl.message(
      '/login',
      name: 'Login_Route',
      desc: '',
      args: [],
    );
  }

  /// `/home`
  String get Home_Route {
    return Intl.message(
      '/home',
      name: 'Home_Route',
      desc: '',
      args: [],
    );
  }

  /// `/register`
  String get Register_Route {
    return Intl.message(
      '/register',
      name: 'Register_Route',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Sign_up {
    return Intl.message(
      'Sign up',
      name: 'Sign_up',
      desc: '',
      args: [],
    );
  }

  /// `New member ?`
  String get New_member {
    return Intl.message(
      'New member ?',
      name: 'New_member',
      desc: '',
      args: [],
    );
  }

  /// `Bites`
  String get Bites {
    return Intl.message(
      'Bites',
      name: 'Bites',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain upper, lower case, digit, special character.`
  String get Enter_valid_password {
    return Intl.message(
      'Password must contain upper, lower case, digit, special character.',
      name: 'Enter_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get Enter_password {
    return Intl.message(
      'Enter password',
      name: 'Enter_password',
      desc: '',
      args: [],
    );
  }

  /// `xyz@gmail.com`
  String get hintMail {
    return Intl.message(
      'xyz@gmail.com',
      name: 'hintMail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Here.`
  String get Here {
    return Intl.message(
      'Here.',
      name: 'Here',
      desc: '',
      args: [],
    );
  }

  /// `Firstname Middlename Lastname`
  String get hintname {
    return Intl.message(
      'Firstname Middlename Lastname',
      name: 'hintname',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `10 digit Contact No.`
  String get Contact_No {
    return Intl.message(
      '10 digit Contact No.',
      name: 'Contact_No',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Name.`
  String get NameError {
    return Intl.message(
      'Enter valid Name.',
      name: 'NameError',
      desc: '',
      args: [],
    );
  }

  /// ` Enter valid Contact `
  String get valid_contact {
    return Intl.message(
      ' Enter valid Contact ',
      name: 'valid_contact',
      desc: '',
      args: [],
    );
  }

  /// `An Error Occured`
  String get An_Error_Occured {
    return Intl.message(
      'An Error Occured',
      name: 'An_Error_Occured',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed. Please try again later.`
  String get Login_Failed {
    return Intl.message(
      'Login Failed. Please try again later.',
      name: 'Login_Failed',
      desc: '',
      args: [],
    );
  }

  /// `Registration Failed. Please try again later.`
  String get Registration_Failed {
    return Intl.message(
      'Registration Failed. Please try again later.',
      name: 'Registration_Failed',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}