import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traktor_family_gastro_bar/features/data/services/notifications_service.dart';
import 'package:traktor_family_gastro_bar/firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.init();
  final prefs = await SharedPreferences.getInstance();
  final hasOnBoardingShown = prefs.getBool('hasOnBoardingShown') ?? false;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App(hasOnBoardingShown: hasOnBoardingShown));
}
