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

  /// `1. General provisions`
  String get privacy_policy_1 {
    return Intl.message(
      '1. General provisions',
      name: 'privacy_policy_1',
      desc: '',
      args: [],
    );
  }

  /// `1.1. This Privacy Policy is an integral part of the User Agreement (hereinafter referred to as the «Agreement») located at https://delivery.tr.kh.ua/terms-of-use, as well as other Agreements concluded between the Parties. \n\n1.2. By entering into the Personal Agreement, the User freely, of his own free will and in his own interests gives his indefinite written consent to any methods of processing his personal data, including any action (operation) or set of actions (operations) carried out with or without the use of automation tools such funds with personal data, including collection, recording, systematization, accumulation, storage, clarification (updating, changing), extraction, use, transfer (distribution, provision, access), depersonalization, blocking, deletion, destruction of personal data in established the real Policy of goals.\n\n1.3. In this Privacy Policy, the terms and definitions provided for in the User Agreement, as well as in other agreements concluded with the User, are used, unless otherwise provided for in this Policy or does not follow from its essence. In other cases, the term used in the Policy is interpreted in accordance with the current legislation of Ukraine.`
  String get privacy_policy_1_content {
    return Intl.message(
      '1.1. This Privacy Policy is an integral part of the User Agreement (hereinafter referred to as the «Agreement») located at https://delivery.tr.kh.ua/terms-of-use, as well as other Agreements concluded between the Parties. \n\n1.2. By entering into the Personal Agreement, the User freely, of his own free will and in his own interests gives his indefinite written consent to any methods of processing his personal data, including any action (operation) or set of actions (operations) carried out with or without the use of automation tools such funds with personal data, including collection, recording, systematization, accumulation, storage, clarification (updating, changing), extraction, use, transfer (distribution, provision, access), depersonalization, blocking, deletion, destruction of personal data in established the real Policy of goals.\n\n1.3. In this Privacy Policy, the terms and definitions provided for in the User Agreement, as well as in other agreements concluded with the User, are used, unless otherwise provided for in this Policy or does not follow from its essence. In other cases, the term used in the Policy is interpreted in accordance with the current legislation of Ukraine.',
      name: 'privacy_policy_1_content',
      desc: '',
      args: [],
    );
  }

  /// `2. Personal information`
  String get privacy_policy_2 {
    return Intl.message(
      '2. Personal information',
      name: 'privacy_policy_2',
      desc: '',
      args: [],
    );
  }

  /// `2.1. Personal information in this Policy means:\n\n2.1.1. Information that the user provides about himself when registering on the Site, as well as in the process of further use of the Site Services, including the User's personal data. The user provides the following personal data: Surname, First Name, Paternal Name, contact phone number, e-mail address, address for delivery of the Goods.\n\n2.1.2. Data transmitted automatically depending on the settings of the User's software, including, but not limited to: IP address, cookie, data about the software used by the User and equipment for working in the communication network, including the Internet, parameters and settings of the Internet browsers, information transmitted and received using the Site.\n\n2.2. The User is aware of and accepts the possibility of third-party software being placed on the Site pages, as a result of which such persons may receive the depersonalized data specified in clause 2.1.2.\n\nThe specified third-party software may, among other things, include:\n\n• systems from the collection of visit statistics (for example, Google Analytics metrics, etc.); limit the collection of such information by third parties using the standard privacy settings of the Internet browser used by him to work with the Site.\n\n2.4. The Seller has the right to set requirements for the composition of the User's Personal Information, which must be provided for the use of the Site and Services provided by him. If certain information is not marked by the Seller as mandatory, it is provided by the user at his own discretion.\n\n2.5. The Seller does not verify the authenticity of the provided Personal Information, believing that the User acts in good faith and makes all necessary efforts to maintain such information in an up-to-date state.`
  String get privacy_policy_2_content {
    return Intl.message(
      '2.1. Personal information in this Policy means:\n\n2.1.1. Information that the user provides about himself when registering on the Site, as well as in the process of further use of the Site Services, including the User\'s personal data. The user provides the following personal data: Surname, First Name, Paternal Name, contact phone number, e-mail address, address for delivery of the Goods.\n\n2.1.2. Data transmitted automatically depending on the settings of the User\'s software, including, but not limited to: IP address, cookie, data about the software used by the User and equipment for working in the communication network, including the Internet, parameters and settings of the Internet browsers, information transmitted and received using the Site.\n\n2.2. The User is aware of and accepts the possibility of third-party software being placed on the Site pages, as a result of which such persons may receive the depersonalized data specified in clause 2.1.2.\n\nThe specified third-party software may, among other things, include:\n\n• systems from the collection of visit statistics (for example, Google Analytics metrics, etc.); limit the collection of such information by third parties using the standard privacy settings of the Internet browser used by him to work with the Site.\n\n2.4. The Seller has the right to set requirements for the composition of the User\'s Personal Information, which must be provided for the use of the Site and Services provided by him. If certain information is not marked by the Seller as mandatory, it is provided by the user at his own discretion.\n\n2.5. The Seller does not verify the authenticity of the provided Personal Information, believing that the User acts in good faith and makes all necessary efforts to maintain such information in an up-to-date state.',
      name: 'privacy_policy_2_content',
      desc: '',
      args: [],
    );
  }

  /// `3. Purposes of personal information processing`
  String get privacy_policy_3 {
    return Intl.message(
      '3. Purposes of personal information processing',
      name: 'privacy_policy_3',
      desc: '',
      args: [],
    );
  }

  /// `3.1. The Seller processes, including the collection and storage of, only that Personal Information that is necessary for the conclusion and execution of contracts with the User.\n\n3.2. The Seller has the right to use Personal Information in particular for the following purposes:\n\n• Conclusion of contracts for the use of the Site and Site Services;\n\n• Fulfillment of obligations under concluded contracts, including providing the user with access to the Site and its Services;\n \n• Identification of the user within the framework of the fulfillment of obligations under the contracts concluded with him, including the fulfillment of Buyers' Orders; promotions and offers of the Seller, including advertising messages, to the User's e-mail and mobile phone with his consent;\n\n• Informing the User/Buyer about the order and the stages of its processing, including other service messages of the Site that are sent automatically;\n \n• Ensuring communication with the user for the purpose of information service and improving the quality of the Site Service, including in the order of notification with the involvement of third parties;\n\n• Provision of customer support services for users;\n\n• Use of depersonalized data for targeting advertising and/or informational materials by age, gender, other characteristics;\n\n• Conducting marketing, statistical and other research based on depersonalized data.`
  String get privacy_policy_3_content {
    return Intl.message(
      '3.1. The Seller processes, including the collection and storage of, only that Personal Information that is necessary for the conclusion and execution of contracts with the User.\n\n3.2. The Seller has the right to use Personal Information in particular for the following purposes:\n\n• Conclusion of contracts for the use of the Site and Site Services;\n\n• Fulfillment of obligations under concluded contracts, including providing the user with access to the Site and its Services;\n \n• Identification of the user within the framework of the fulfillment of obligations under the contracts concluded with him, including the fulfillment of Buyers\' Orders; promotions and offers of the Seller, including advertising messages, to the User\'s e-mail and mobile phone with his consent;\n\n• Informing the User/Buyer about the order and the stages of its processing, including other service messages of the Site that are sent automatically;\n \n• Ensuring communication with the user for the purpose of information service and improving the quality of the Site Service, including in the order of notification with the involvement of third parties;\n\n• Provision of customer support services for users;\n\n• Use of depersonalized data for targeting advertising and/or informational materials by age, gender, other characteristics;\n\n• Conducting marketing, statistical and other research based on depersonalized data.',
      name: 'privacy_policy_3_content',
      desc: '',
      args: [],
    );
  }

  /// `4. Requirements for the protection of personal information`
  String get privacy_policy_4 {
    return Intl.message(
      '4. Requirements for the protection of personal information',
      name: 'privacy_policy_4',
      desc: '',
      args: [],
    );
  }

  /// `4.1. The Seller stores Personal Information and ensures its protection against unauthorized access and distribution in accordance with internal rules and regulations.\n\n 4.2. As for the User's Personal Information, its confidentiality is maintained, except when the technology of the Site or its Services or the settings of the software used by the User provide for the open exchange of information with any Internet users.\n\n4.3. The Seller has the right to transfer Personal Information to third parties in the following cases:\n\n• The User has expressed his consent to such actions, including cases where the User uses the settings of the software used, which do not limit the provision of certain information;\n\n• The transfer is necessary within the user's use of the functionality of the Site or its Services;\n\n• At the request of a court or other authorized state body within the framework of the procedure established by law;\n\n• To protect the rights and legitimate interests of the Seller in connection with the violation of contracts concluded with the user .`
  String get privacy_policy_4_content {
    return Intl.message(
      '4.1. The Seller stores Personal Information and ensures its protection against unauthorized access and distribution in accordance with internal rules and regulations.\n\n 4.2. As for the User\'s Personal Information, its confidentiality is maintained, except when the technology of the Site or its Services or the settings of the software used by the User provide for the open exchange of information with any Internet users.\n\n4.3. The Seller has the right to transfer Personal Information to third parties in the following cases:\n\n• The User has expressed his consent to such actions, including cases where the User uses the settings of the software used, which do not limit the provision of certain information;\n\n• The transfer is necessary within the user\'s use of the functionality of the Site or its Services;\n\n• At the request of a court or other authorized state body within the framework of the procedure established by law;\n\n• To protect the rights and legitimate interests of the Seller in connection with the violation of contracts concluded with the user .',
      name: 'privacy_policy_4_content',
      desc: '',
      args: [],
    );
  }

  /// `5. Change of Personal Information`
  String get privacy_policy_5 {
    return Intl.message(
      '5. Change of Personal Information',
      name: 'privacy_policy_5',
      desc: '',
      args: [],
    );
  }

  /// `5.1. The user has the right to independently edit the Personal Information provided by him during registration in his Personal account at any time.\n\n5.2. In the event of termination of the concluded contract, the user can exercise the right to withdraw consent to the processing of his personal data and delete the User's Account by sending a request to the Seller to delete his account at the address traktorgastrobar.kh@gmail.com,\n\n5.3. In order to improve the quality of the Site and its Services and to ensure the possibility of legal protection, the Seller has the right to keep log files about the actions taken by the user within the framework of using the Site and its Services, as well as in connection with the conclusion and execution by the User of the Agreement and other contracts with for its part, within 6 (Six) months from the moment of their commission.`
  String get privacy_policy_5_content {
    return Intl.message(
      '5.1. The user has the right to independently edit the Personal Information provided by him during registration in his Personal account at any time.\n\n5.2. In the event of termination of the concluded contract, the user can exercise the right to withdraw consent to the processing of his personal data and delete the User\'s Account by sending a request to the Seller to delete his account at the address traktorgastrobar.kh@gmail.com,\n\n5.3. In order to improve the quality of the Site and its Services and to ensure the possibility of legal protection, the Seller has the right to keep log files about the actions taken by the user within the framework of using the Site and its Services, as well as in connection with the conclusion and execution by the User of the Agreement and other contracts with for its part, within 6 (Six) months from the moment of their commission.',
      name: 'privacy_policy_5_content',
      desc: '',
      args: [],
    );
  }

  /// `6. Change of privacy policy`
  String get privacy_policy_6 {
    return Intl.message(
      '6. Change of privacy policy',
      name: 'privacy_policy_6',
      desc: '',
      args: [],
    );
  }

  /// `6.1. This Policy may be changed by the Seller unilaterally without prior notice to the User. The new version of the Policy enters into force from the moment of its posting on the Seller's Website, unless otherwise provided by the new version of the Policy.`
  String get privacy_policy_6_content {
    return Intl.message(
      '6.1. This Policy may be changed by the Seller unilaterally without prior notice to the User. The new version of the Policy enters into force from the moment of its posting on the Seller\'s Website, unless otherwise provided by the new version of the Policy.',
      name: 'privacy_policy_6_content',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personalInformation {
    return Intl.message(
      'Personal information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Set up notifications`
  String get setUpNotifications {
    return Intl.message(
      'Set up notifications',
      name: 'setUpNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Customize language`
  String get customizeLanguage {
    return Intl.message(
      'Customize language',
      name: 'customizeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Select the application theme`
  String get selectTheApplicationTheme {
    return Intl.message(
      'Select the application theme',
      name: 'selectTheApplicationTheme',
      desc: '',
      args: [],
    );
  }

  /// `Report a bug`
  String get reportABug {
    return Intl.message(
      'Report a bug',
      name: 'reportABug',
      desc: '',
      args: [],
    );
  }

  /// `Write to us if you find a bug`
  String get writeToUsIfYouFindABug {
    return Intl.message(
      'Write to us if you find a bug',
      name: 'writeToUsIfYouFindABug',
      desc: '',
      args: [],
    );
  }

  /// `Write a review`
  String get writeAReview {
    return Intl.message(
      'Write a review',
      name: 'writeAReview',
      desc: '',
      args: [],
    );
  }

  /// `Rate our app and service`
  String get rateOurAppAndService {
    return Intl.message(
      'Rate our app and service',
      name: 'rateOurAppAndService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Read this before using app`
  String get readThisBeforeUsingApp {
    return Intl.message(
      'Read this before using app',
      name: 'readThisBeforeUsingApp',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Frequently asked question`
  String get frequentlyAskedQuestion {
    return Intl.message(
      'Frequently asked question',
      name: 'frequentlyAskedQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Remarks or wishes`
  String get remarksOrWishes {
    return Intl.message(
      'Remarks or wishes',
      name: 'remarksOrWishes',
      desc: '',
      args: [],
    );
  }

  /// `Rate our service`
  String get rateOurService {
    return Intl.message(
      'Rate our service',
      name: 'rateOurService',
      desc: '',
      args: [],
    );
  }

  /// `How to return the product?`
  String get howToReturnTheProduct {
    return Intl.message(
      'How to return the product?',
      name: 'howToReturnTheProduct',
      desc: '',
      args: [],
    );
  }

  /// `Rejection of the product is possible at the time of receipt and if it is of inadequate quality. The transferred funds are returned to your bank account within 5 - 30 working days (the term depends on the Bank that issued your bank card).`
  String get howToReturnTheProductContent {
    return Intl.message(
      'Rejection of the product is possible at the time of receipt and if it is of inadequate quality. The transferred funds are returned to your bank account within 5 - 30 working days (the term depends on the Bank that issued your bank card).',
      name: 'howToReturnTheProductContent',
      desc: '',
      args: [],
    );
  }

  /// `What are the payment methods?`
  String get whatAreThePaymentMethods {
    return Intl.message(
      'What are the payment methods?',
      name: 'whatAreThePaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `To choose to pay for the product using a bank card on the corresponding page, click the button "Pay for the order by bank card". Payment is made through the liqpay system using Bank cards of the Visa and Mastercard payment systems`
  String get whatAreThePaymentMethodsContent {
    return Intl.message(
      'To choose to pay for the product using a bank card on the corresponding page, click the button "Pay for the order by bank card". Payment is made through the liqpay system using Bank cards of the Visa and Mastercard payment systems',
      name: 'whatAreThePaymentMethodsContent',
      desc: '',
      args: [],
    );
  }

  /// `How does delivery work?`
  String get howDoesDeliveryWork {
    return Intl.message(
      'How does delivery work?',
      name: 'howDoesDeliveryWork',
      desc: '',
      args: [],
    );
  }

  /// `Delivery of orders is carried out exclusively by the taxi services of the city of Kharkiv, according to the service tariffs. The minimum order amount for delivery is 300 UAH.\n\nFor orders from 500 UAH within 7 km from the restaurant, the delivery of orders is FREE!\n\nIn the case of orders, the distance of which is more than 7 km from In such cases, the customer pays the delivery cost of UAH 100. For example, the cost of the glass delivery is UAH 100. In this case, the restaurant pays UAH 150. customer.\n\nOrders from UAH 3,000 are delivered in Kharkov for FREE! Estimated preparation time from 15 to 40 minutes depending on the load of the kitchen.\n\nDelivery time depends on the speed of delivery by the taxi service and the speed of delivery by the driver.\n \nThe customer receives all orders at the entrance of his house. There is no delivery to the door!`
  String get howDoesDeliveryWorkContent {
    return Intl.message(
      'Delivery of orders is carried out exclusively by the taxi services of the city of Kharkiv, according to the service tariffs. The minimum order amount for delivery is 300 UAH.\n\nFor orders from 500 UAH within 7 km from the restaurant, the delivery of orders is FREE!\n\nIn the case of orders, the distance of which is more than 7 km from In such cases, the customer pays the delivery cost of UAH 100. For example, the cost of the glass delivery is UAH 100. In this case, the restaurant pays UAH 150. customer.\n\nOrders from UAH 3,000 are delivered in Kharkov for FREE! Estimated preparation time from 15 to 40 minutes depending on the load of the kitchen.\n\nDelivery time depends on the speed of delivery by the taxi service and the speed of delivery by the driver.\n \nThe customer receives all orders at the entrance of his house. There is no delivery to the door!',
      name: 'howDoesDeliveryWorkContent',
      desc: '',
      args: [],
    );
  }

  /// `How to place an order?`
  String get howToPlaceAnOrder {
    return Intl.message(
      'How to place an order?',
      name: 'howToPlaceAnOrder',
      desc: '',
      args: [],
    );
  }

  /// `Orders can be made online in the Traktor Family Gastro Bar application or by calling 073-133-61-87 / 093-676-76-46.\n\nPayment for orders is made online in the Traktor Family Gastro Bar application or by card transfer to the restaurant's account. \n\nOrders are accepted from Monday to Sunday from 11:00 a.m. to 8:45 p.m.`
  String get howToPlaceAnOrderContent {
    return Intl.message(
      'Orders can be made online in the Traktor Family Gastro Bar application or by calling 073-133-61-87 / 093-676-76-46.\n\nPayment for orders is made online in the Traktor Family Gastro Bar application or by card transfer to the restaurant\'s account. \n\nOrders are accepted from Monday to Sunday from 11:00 a.m. to 8:45 p.m.',
      name: 'howToPlaceAnOrderContent',
      desc: '',
      args: [],
    );
  }

  /// `In case of any questions, please call 073-133-61-87.`
  String get inCaseOfAnyQuestionsPleaseCall {
    return Intl.message(
      'In case of any questions, please call 073-133-61-87.',
      name: 'inCaseOfAnyQuestionsPleaseCall',
      desc: '',
      args: [],
    );
  }

  /// `Found an error?`
  String get foundAnError {
    return Intl.message(
      'Found an error?',
      name: 'foundAnError',
      desc: '',
      args: [],
    );
  }

  /// `Notify us of an error in the operation of the application and we will solve it in the near future`
  String get notifyUsOfAnErrorInTheOperationOfApp {
    return Intl.message(
      'Notify us of an error in the operation of the application and we will solve it in the near future',
      name: 'notifyUsOfAnErrorInTheOperationOfApp',
      desc: '',
      args: [],
    );
  }

  /// `Describe the problem`
  String get describeTheProblem {
    return Intl.message(
      'Describe the problem',
      name: 'describeTheProblem',
      desc: '',
      args: [],
    );
  }

  /// `Add a photo`
  String get addAPhoto {
    return Intl.message(
      'Add a photo',
      name: 'addAPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized, so you cannot change personal data`
  String get youAreNotAuthorizedSoYouCannotChangePersonalInfo {
    return Intl.message(
      'You are not authorized, so you cannot change personal data',
      name: 'youAreNotAuthorizedSoYouCannotChangePersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email notification`
  String get emailNotification {
    return Intl.message(
      'Email notification',
      name: 'emailNotification',
      desc: '',
      args: [],
    );
  }

  /// `Delivery notification`
  String get deliveryNotification {
    return Intl.message(
      'Delivery notification',
      name: 'deliveryNotification',
      desc: '',
      args: [],
    );
  }

  /// `Reservation notification`
  String get reservationNotification {
    return Intl.message(
      'Reservation notification',
      name: 'reservationNotification',
      desc: '',
      args: [],
    );
  }

  /// `New dishes notification`
  String get newDishesNotification {
    return Intl.message(
      'New dishes notification',
      name: 'newDishesNotification',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized, so you cannot enable email notifications`
  String get youAreNotAuthorizedNotifications {
    return Intl.message(
      'You are not authorized, so you cannot enable email notifications',
      name: 'youAreNotAuthorizedNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Thank you!`
  String get thankYou {
    return Intl.message(
      'Thank you!',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `We will fix this error as soon as possible`
  String get weWillFixThisErrorAsSoonAsPossible {
    return Intl.message(
      'We will fix this error as soon as possible',
      name: 'weWillFixThisErrorAsSoonAsPossible',
      desc: '',
      args: [],
    );
  }

  /// `Oops, something went wrong`
  String get oopsSomethingWentWrong {
    return Intl.message(
      'Oops, something went wrong',
      name: 'oopsSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `We are already fixing this bug, please try again later`
  String get weAreAlreadyFixingThisBugPleaseTryAgainLater {
    return Intl.message(
      'We are already fixing this bug, please try again later',
      name: 'weAreAlreadyFixingThisBugPleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Tell us what problem you found`
  String get tellMeWhatProblemYouFound {
    return Intl.message(
      'Tell us what problem you found',
      name: 'tellMeWhatProblemYouFound',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBack {
    return Intl.message(
      'Go back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your feedback`
  String get thankYouForYourFeedback {
    return Intl.message(
      'Thank you for your feedback',
      name: 'thankYouForYourFeedback',
      desc: '',
      args: [],
    );
  }

  /// `We try to improve our service every day to see you more often in our restaurant`
  String get weTryToImproveOurServiceEveryDay {
    return Intl.message(
      'We try to improve our service every day to see you more often in our restaurant',
      name: 'weTryToImproveOurServiceEveryDay',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get auto {
    return Intl.message(
      'Auto',
      name: 'auto',
      desc: '',
      args: [],
    );
  }

  /// `Discover our world of tastes!`
  String get discoverOurWorldOfTastes {
    return Intl.message(
      'Discover our world of tastes!',
      name: 'discoverOurWorldOfTastes',
      desc: '',
      args: [],
    );
  }

  /// `Experience unique dishes prepared with love by our chefs. From traditional cuisine to gourmet gastronomic delights.`
  String get experienceUniqueDishes {
    return Intl.message(
      'Experience unique dishes prepared with love by our chefs. From traditional cuisine to gourmet gastronomic delights.',
      name: 'experienceUniqueDishes',
      desc: '',
      args: [],
    );
  }

  /// `Convenient table reservations`
  String get convenientTableReservations {
    return Intl.message(
      'Convenient table reservations',
      name: 'convenientTableReservations',
      desc: '',
      args: [],
    );
  }

  /// `Easily find your favorite dishes in our interactive menu. Just choose what you want and place your order in a few clicks.`
  String get easilyFindYourFavoriteDishes {
    return Intl.message(
      'Easily find your favorite dishes in our interactive menu. Just choose what you want and place your order in a few clicks.',
      name: 'easilyFindYourFavoriteDishes',
      desc: '',
      args: [],
    );
  }

  /// `Fast delivery to your home`
  String get fastDeliveryToYourHome {
    return Intl.message(
      'Fast delivery to your home',
      name: 'fastDeliveryToYourHome',
      desc: '',
      args: [],
    );
  }

  /// `Are you hungry? No problem! Our couriers will deliver your order as quickly as possible and with care for quality.`
  String get areYouHungry {
    return Intl.message(
      'Are you hungry? No problem! Our couriers will deliver your order as quickly as possible and with care for quality.',
      name: 'areYouHungry',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Want to log out?`
  String get wantToLogOut {
    return Intl.message(
      'Want to log out?',
      name: 'wantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out of your account?`
  String get areYouSureYouWantToLog {
    return Intl.message(
      'Are you sure you want to log out of your account?',
      name: 'areYouSureYouWantToLog',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email was sent successfully`
  String get emailWasSentSuccessfully {
    return Intl.message(
      'Email was sent successfully',
      name: 'emailWasSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Please write remarks or wishes`
  String get pleaseWriteRemarksOrWishes {
    return Intl.message(
      'Please write remarks or wishes',
      name: 'pleaseWriteRemarksOrWishes',
      desc: '',
      args: [],
    );
  }

  /// `Make a phone call`
  String get makeAPhoneCall {
    return Intl.message(
      'Make a phone call',
      name: 'makeAPhoneCall',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `This photo will be removed`
  String get thisPhotoWillBeRemoved {
    return Intl.message(
      'This photo will be removed',
      name: 'thisPhotoWillBeRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or log in with`
  String get orLogInWith {
    return Intl.message(
      'Or log in with',
      name: 'orLogInWith',
      desc: '',
      args: [],
    );
  }

  /// `Log In!`
  String get logIn_authScreen {
    return Intl.message(
      'Log In!',
      name: 'logIn_authScreen',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `New member?`
  String get newMember {
    return Intl.message(
      'New member?',
      name: 'newMember',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp_authScreen {
    return Intl.message(
      'Sign Up',
      name: 'signUp_authScreen',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid name`
  String get enterAValidName {
    return Intl.message(
      'Enter a valid name',
      name: 'enterAValidName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get enterAValidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'enterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get enterAValidPhoneNumber {
    return Intl.message(
      'Enter a valid phone number',
      name: 'enterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordMustBeAtLeast6Characters {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordMustBeAtLeast6Characters',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up!`
  String get signUp {
    return Intl.message(
      'Sign Up!',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'Or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use`
  String get emailAlreadyInUse {
    return Intl.message(
      'Email already in use',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email or password`
  String get wrongEmailOrPassword {
    return Intl.message(
      'Wrong email or password',
      name: 'wrongEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Some error occurred`
  String get someErrorOccurred {
    return Intl.message(
      'Some error occurred',
      name: 'someErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Password is not strong enough`
  String get passwordIsNotStrongEnough {
    return Intl.message(
      'Password is not strong enough',
      name: 'passwordIsNotStrongEnough',
      desc: '',
      args: [],
    );
  }

  /// `No data saved`
  String get noDataSaved {
    return Intl.message(
      'No data saved',
      name: 'noDataSaved',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to leave this page without saving your data?`
  String get areYouSureYouWantToLeaveThisPageWithout {
    return Intl.message(
      'Are you sure you want to leave this page without saving your data?',
      name: 'areYouSureYouWantToLeaveThisPageWithout',
      desc: '',
      args: [],
    );
  }

  /// `Phone verification`
  String get phoneVerification {
    return Intl.message(
      'Phone verification',
      name: 'phoneVerification',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `You must be logged in to add this dish to your favorites`
  String get youMustBeLoggedInToAddThisDishTo {
    return Intl.message(
      'You must be logged in to add this dish to your favorites',
      name: 'youMustBeLoggedInToAddThisDishTo',
      desc: '',
      args: [],
    );
  }

  /// `{mealTitle} has been successfully added to favorites`
  String mealTitleAddedToFavorites(Object mealTitle) {
    return Intl.message(
      '$mealTitle has been successfully added to favorites',
      name: 'mealTitleAddedToFavorites',
      desc: '',
      args: [mealTitle],
    );
  }

  /// `You are not authorized`
  String get youAreNotAuthorized {
    return Intl.message(
      'You are not authorized',
      name: 'youAreNotAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `{mealTitle} has been removed from favorites`
  String mealTitleHasBeenRemovedFromFavorites(Object mealTitle) {
    return Intl.message(
      '$mealTitle has been removed from favorites',
      name: 'mealTitleHasBeenRemovedFromFavorites',
      desc: '',
      args: [mealTitle],
    );
  }

  /// `Add the first dish to your favorites and taste our exquisite cuisine`
  String get addTheFirstDishToYourFavorites {
    return Intl.message(
      'Add the first dish to your favorites and taste our exquisite cuisine',
      name: 'addTheFirstDishToYourFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Reserve`
  String get reserve {
    return Intl.message(
      'Reserve',
      name: 'reserve',
      desc: '',
      args: [],
    );
  }

  /// `Deliver`
  String get deliver {
    return Intl.message(
      'Deliver',
      name: 'deliver',
      desc: '',
      args: [],
    );
  }

  /// `Delivery registration`
  String get deliveryRegistration {
    return Intl.message(
      'Delivery registration',
      name: 'deliveryRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Table reservation`
  String get tableReservation {
    return Intl.message(
      'Table reservation',
      name: 'tableReservation',
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