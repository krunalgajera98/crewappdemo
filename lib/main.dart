
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
/// Git setup

// Upload project to git
// - create repo in Github
// - open terminal and follow below command
// - git init
// - git remote add origin "enter git repo link"
// - git add .
// - git commit -m "commit message"
// - git push
//
// Remove git from project
// - project files > remove git folder
// - Android studio setting(preference) > version control  > remove from Directory Mappings


/// FireBase Project SetUp
/// //in not install :npm install -g firebase-tools
// curl -sL https://firebase.tools | bash
// firebase login
// dart pub global activate flutterfire_cli
// export PATH="$PATH":"$HOME/.pub-cache/bin"
// flutterfire configure --project=fir-da115
// if already login first
// firebase logout
// firebase login add:krunalgajera98@gmail.com
