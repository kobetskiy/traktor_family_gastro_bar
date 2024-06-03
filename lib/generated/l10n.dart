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

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `European cuisine`
  String get europeanCuisine {
    return Intl.message(
      'European cuisine',
      name: 'europeanCuisine',
      desc: '',
      args: [],
    );
  }

  /// `Barbecue menu`
  String get barbecueMenu {
    return Intl.message(
      'Barbecue menu',
      name: 'barbecueMenu',
      desc: '',
      args: [],
    );
  }

  /// `Bar`
  String get bar {
    return Intl.message(
      'Bar',
      name: 'bar',
      desc: '',
      args: [],
    );
  }

  /// `Hookah`
  String get hookah {
    return Intl.message(
      'Hookah',
      name: 'hookah',
      desc: '',
      args: [],
    );
  }

  /// `uah`
  String get uah {
    return Intl.message(
      'uah',
      name: 'uah',
      desc: '',
      args: [],
    );
  }

  /// `g`
  String get gramsSymbol {
    return Intl.message(
      'g',
      name: 'gramsSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get pleaseTryAgainLater {
    return Intl.message(
      'Please try again later',
      name: 'pleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No internet`
  String get noInternet {
    return Intl.message(
      'No internet',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection found.\nCheck your connection to Wi-Fi or mobile network.`
  String get chechYourConnection {
    return Intl.message(
      'No internet connection found.\nCheck your connection to Wi-Fi or mobile network.',
      name: 'chechYourConnection',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Nothing found`
  String get nothingFound {
    return Intl.message(
      'Nothing found',
      name: 'nothingFound',
      desc: '',
      args: [],
    );
  }

  /// `Check the request is correct and try again`
  String get checkTheRequest {
    return Intl.message(
      'Check the request is correct and try again',
      name: 'checkTheRequest',
      desc: '',
      args: [],
    );
  }

  /// `Japanese cuisine`
  String get japaneseCuisine {
    return Intl.message(
      'Japanese cuisine',
      name: 'japaneseCuisine',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Write on Instagram`
  String get writeOnInstagram {
    return Intl.message(
      'Write on Instagram',
      name: 'writeOnInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Write on Email`
  String get writeOnEmail {
    return Intl.message(
      'Write on Email',
      name: 'writeOnEmail',
      desc: '',
      args: [],
    );
  }

  /// `Write on Facebook`
  String get writeOnFacebook {
    return Intl.message(
      'Write on Facebook',
      name: 'writeOnFacebook',
      desc: '',
      args: [],
    );
  }

  /// `It looks like the link is out of date. We are already fixing it`
  String get wrongLinkDialogText {
    return Intl.message(
      'It looks like the link is out of date. We are already fixing it',
      name: 'wrongLinkDialogText',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Have a question? Contact us!`
  String get haveAQuestionContactUs {
    return Intl.message(
      'Have a question? Contact us!',
      name: 'haveAQuestionContactUs',
      desc: '',
      args: [],
    );
  }

  /// `From 10am to 9pm free in Ukraine`
  String get from10amTo9pmFreeInUkraine {
    return Intl.message(
      'From 10am to 9pm free in Ukraine',
      name: 'from10amTo9pmFreeInUkraine',
      desc: '',
      args: [],
    );
  }

  /// `Novelty`
  String get novelty {
    return Intl.message(
      'Novelty',
      name: 'novelty',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `The picture is temporarily unavailable`
  String get thePictureIsTemporarilyUnavailable {
    return Intl.message(
      'The picture is temporarily unavailable',
      name: 'thePictureIsTemporarilyUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `We are already working on a solution to this problem`
  String get weAreAlreadyWorkingOnASolutionToThisProblem {
    return Intl.message(
      'We are already working on a solution to this problem',
      name: 'weAreAlreadyWorkingOnASolutionToThisProblem',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
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
      Locale.fromSubtags(languageCode: 'uk'),
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