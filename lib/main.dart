
import 'package:appcrewdemo/crewapp.dart';
import 'package:appcrewdemo/crewappdemo/database/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyA81nxA_zl9KSoGkJj6jFoShY7apPW2WLc',
      appId: '1:98468314075:android:7ed89d33c22d3560f285fe',
      messagingSenderId: '98468314075',
      projectId: 'crewappdemo',
    ),
  );
  await SharedPrefs.initMySharedPreferences();
  runApp(CrewApp());
}