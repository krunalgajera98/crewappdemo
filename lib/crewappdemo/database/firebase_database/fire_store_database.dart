import 'package:appcrewdemo/crewappdemo/core/models/note_model.dart';
import 'package:appcrewdemo/crewappdemo/database/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FSDBService {
  static final databaseReference = FirebaseFirestore.instance;
  static final collectionNotes = 'AppCrewNotes';
  static final uid = SharedPrefs.getString(key: PrefString.uid);

  /// insert && update && delete
  static Future<void> insertData(NotesModel data) async {
    await databaseReference
        .collection(uid)
        .doc(data.id.toString())
        .set(data.toJson())
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> updateData(NotesModel data) async {
    await databaseReference.collection(collectionNotes).doc(uid).update(data.toJson());
  }

  static Future deleteData(String userId) async {
    await FirebaseFirestore.instance.collection(collectionNotes).doc(userId).delete();
  }

  static Future<void> getUserBaseData() async {
    await databaseReference.collection(collectionNotes).doc(uid).get().then((value) {
      print('getUser: ${value.data().toString()}');
    });
  }

  /// stream for get data with any changes

  static Future<void> streamForGetUserBaseData() async {
    Stream documentStream =
        FirebaseFirestore.instance.collection(collectionNotes).doc(uid).snapshots();
    documentStream.listen((event) {
      print('Data event: ${event.data().toString()}');
    });
  }
}
