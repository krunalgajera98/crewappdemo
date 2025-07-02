import 'package:appcrewdemo/crewappdemo/core/models/note_model.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/size_helper.dart';
import 'package:appcrewdemo/crewappdemo/core/values/strings/strings.dart';
import 'package:appcrewdemo/crewappdemo/database/firebase_database/fire_store_database.dart';
import 'package:appcrewdemo/crewappdemo/features/home/presentation/controller/home_controller.dart';
import 'package:appcrewdemo/crewappdemo/features/home/presentation/widgets/add_notes.dart'
    show AddNoteDialog;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../database/shared_preferences.dart';
import '../widgets/card_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Messages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(SharedPrefs.getString(key: PrefString.email), style: TextStyle(fontSize: 14)),
            ],
          ),
          actions: [IconButton(onPressed: (){controller.logout();}, icon: Icon(Icons.logout))],
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection(FSDBService.uid).snapshots(includeMetadataChanges: true),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(height: Get.height,child: Center(child: CircularProgressIndicator()));}
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return SizedBox(height: Get.height,child: Center(child: Text(AppString.noData)));
              }
              final docs = snapshot.data!.docs;

              return ListView.builder(
                itemCount: docs.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final NotesModel _model = NotesModel.fromJson(docs[index].data());
                  /// normal view
                  // return ListTile(title: Text(_model.title), subtitle: Text(_model.message));
                  /// create UI
                  return CardView(model: _model);
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => AddNoteDialog(
                    onSave: (title, message) async {
                      await controller.addNotes(title, message);
                    },
                  ),
            );
          },
        ),
      ),
    ).beResponsive;
  }
}
