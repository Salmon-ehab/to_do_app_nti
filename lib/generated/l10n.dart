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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To  Do It !`
  String get welcomeText1 {
    return Intl.message(
      'Welcome To  Do It !',
      name: 'welcomeText1',
      desc: '',
      args: [],
    );
  }

  /// `Ready to conquer your tasks? Let's Do It together.`
  String get welcomeText2 {
    return Intl.message(
      'Ready to conquer your tasks? Let\'s Do It together.',
      name: 'welcomeText2',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start`
  String get LetButton {
    return Intl.message('Let’s Start', name: 'LetButton', desc: '', args: []);
  }

  /// `Username`
  String get Username {
    return Intl.message('Username', name: 'Username', desc: '', args: []);
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  /// `Already Have An Account?`
  String get q1 {
    return Intl.message(
      'Already Have An Account?',
      name: 'q1',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Don’t Have An Account?`
  String get q2 {
    return Intl.message(
      'Don’t Have An Account?',
      name: 'q2',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get hello {
    return Intl.message('Hello!', name: 'hello', desc: '', args: []);
  }

  /// `Ahmed Saber`
  String get AhmedSaber {
    return Intl.message('Ahmed Saber', name: 'AhmedSaber', desc: '', args: []);
  }

  /// `There are no tasks yet, Press the button To add New Task`
  String get noTasks {
    return Intl.message(
      'There are no tasks yet, Press the button To add New Task',
      name: 'noTasks',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateprofile {
    return Intl.message(
      'Update Profile',
      name: 'updateprofile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Update`
  String get Update {
    return Intl.message('Update', name: 'Update', desc: '', args: []);
  }

  /// `Old Password`
  String get OldPassword {
    return Intl.message(
      'Old Password',
      name: 'OldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Tasks`
  String get tasks {
    return Intl.message('Tasks', name: 'tasks', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Add Task`
  String get AddTask {
    return Intl.message('Add Task', name: 'AddTask', desc: '', args: []);
  }

  /// `Title`
  String get Title {
    return Intl.message('Title', name: 'Title', desc: '', args: []);
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `Please Enter user name!`
  String get validateName {
    return Intl.message(
      'Please Enter user name!',
      name: 'validateName',
      desc: '',
      args: [],
    );
  }

  /// `User name must be at least 4 characters.`
  String get validateName2 {
    return Intl.message(
      'User name must be at least 4 characters.',
      name: 'validateName2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter password!`
  String get validatePassword {
    return Intl.message(
      'Please Enter password!',
      name: 'validatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 5 characters.`
  String get validatePassword2 {
    return Intl.message(
      'Password must be at least 5 characters.',
      name: 'validatePassword2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter confirm password!`
  String get validateConfirmPassword {
    return Intl.message(
      'Please Enter confirm password!',
      name: 'validateConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password must be at least 5 characters.`
  String get validateConfirmPawword2 {
    return Intl.message(
      'Confirm Password must be at least 5 characters.',
      name: 'validateConfirmPawword2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Title!`
  String get validateTitle {
    return Intl.message(
      'Please Enter Title!',
      name: 'validateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Title must be at least 5 characters.`
  String get validateTitle2 {
    return Intl.message(
      'Title must be at least 5 characters.',
      name: 'validateTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Description!`
  String get ValidateDesc {
    return Intl.message(
      'Please Enter Description!',
      name: 'ValidateDesc',
      desc: '',
      args: [],
    );
  }

  /// `Description must be at least 5 characters.`
  String get ValidateDesc2 {
    return Intl.message(
      'Description must be at least 5 characters.',
      name: 'ValidateDesc2',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
