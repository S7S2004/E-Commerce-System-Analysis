import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  String get login;
  String get email;
  String get password;
  String get emailval;
  String get paswwordval;
  String get dontHaveAccount;
  String get createAccount;
  String get name;
  String get nameval;
  String get alreadyHaveAccount;
  String get todoList;
  String get editTask;
  String get taskTitle;
  String get titleval;
  String get taskDescription;
  String get descriptionval;
  String get date;
  String get saveChanges;
  String get taskEdited;
  String get somethingError;
  String get settings;
  String get state;
  String get language;
  String get logout;
  String get addTask;
  String get submit;
  String get taskAdded;
  String get delte;
  String get taskdeleted;
  String get isDone;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue on GitHub with a '
    'reproducible test case.'
  );
}

class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn() : super('en');

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get emailval => 'Please enter a valid email';

  @override
  String get paswwordval => 'Please enter a password';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get createAccount => 'Create Account';

  @override
  String get name => 'Name';

  @override
  String get nameval => 'Please enter your name';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get todoList => 'Todo List';

  @override
  String get editTask => 'Edit Task';

  @override
  String get taskTitle => 'Task Title';

  @override
  String get titleval => 'Please enter a title';

  @override
  String get taskDescription => 'Task Description';

  @override
  String get descriptionval => 'Please enter a description';

  @override
  String get date => 'Date';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get taskEdited => 'Task edited successfully';

  @override
  String get somethingError => 'Something went wrong';

  @override
  String get settings => 'Settings';

  @override
  String get state => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get logout => 'Logout';

  @override
  String get addTask => 'Add Task';

  @override
  String get submit => 'Submit';

  @override
  String get taskAdded => 'Task added successfully';

  @override
  String get delte => 'Delete';

  @override
  String get taskdeleted => 'Task deleted successfully';

  @override
  String get isDone => 'Done';
}