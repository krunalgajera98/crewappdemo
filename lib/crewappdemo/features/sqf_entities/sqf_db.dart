import 'dart:convert';

import 'package:appcrewdemo/crewappdemo/features/sqf_entities/tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
part 'sqf_db.g.dart';

const seqIdentity = SqfEntitySequence(sequenceName: 'identity');
@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'MyDbModel',
  databaseName: 'my_database.db',
  dbVersion: 1,
  databaseTables: [user, userTable],
  sequences: [seqIdentity],
  bundledDatabasePath: null,
);

// class BundledDbModel extends SqfEntityModelProvider {}
//
// Future<String> createModelFromDatabaseSample() async {
//   final bundledDbModel = await convertDatabaseToModelBase(
//     BundledDbModel()
//       ..databaseName = 'my_database.db'
//       ..bundledDatabasePath = 'assets/chinook.sqlite',
//   );
//   final String modelConstString = SqfEntityConverter(bundledDbModel).createConstDatabase();
//   await Clipboard.setData(ClipboardData(text: modelConstString));
//   return modelConstString;
// }
