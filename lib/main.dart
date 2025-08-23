
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
}/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: DemoPage()));
}

List<QuestionModel> questions = [
  QuestionModel(text: "Is the sky blue?", answer: true),
  QuestionModel(text: "Is 2 + 2 = 5?", answer: false),
  QuestionModel(text: "Is water wet?", answer: true),
  QuestionModel(text: "Does the sun rise in the west?", answer: false),
  QuestionModel(text: "Is Earth a planet?", answer: true),
  QuestionModel(text: "Do cats bark?", answer: false),
  QuestionModel(text: "Is fire cold?", answer: false),
  QuestionModel(text: "Is ice hot?", answer: false),
  QuestionModel(text: "Is Flutter used for mobile apps?", answer: true),
  QuestionModel(text: "Is 10 > 5?", answer: true),
];

class QuestionModel {
  String text;
  bool answer;
  RxnBool userAnswer;

  QuestionModel({required this.answer, required this.text}) : userAnswer = RxnBool();
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: ListView.builder(
        itemCount: questions.length,
        padding: const EdgeInsets.all(16),

        itemBuilder: (ctx, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Q.${index + 1} ${questions[index].text}"
                  ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),

                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CButton('True', true, index),
                      SizedBox(width: 15),
                      CButton('False', false, index),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget CButton(lable, value, index) {
    return Expanded(
      child: Obx(
          ()=> GestureDetector(
          onTap:
              questions[index].userAnswer.value == null
                  ? () {
                    questions[index].userAnswer.value = value;
                  }
                  : null,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color:
                  questions[index].userAnswer.value == null ||
                          questions[index].userAnswer.value != value
                      ? Colors.grey.shade200
                      : questions[index].userAnswer.value ==
                          questions[index].answer ? Colors.green : Colors.red,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(lable)),
          ),
        ),
      ),
    );
  }
}
*/