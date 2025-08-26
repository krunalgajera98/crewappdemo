import 'dart:developer';

import 'package:appcrewdemo/crewappdemo/features/sqf_entities/sqf_db.dart';
import 'package:flutter/material.dart';

class SqfView extends StatelessWidget {
  SqfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomPopupExample(
                onPressed: (temMode? model) {
                  print('00====> ${model?.mail}/${model?.name}');
                },
              );
            },
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.center,
        children: [
          ElevatedButton(
            onPressed: () {
              User_table _obj = User_table(name: 'krunal Gajera', userId: "56");
              _obj.upsert();
            },
            child: Text('save data'),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              List<User_table> _objList = await User_table().select().toList();
              List<User> _objList1 = await User().select().toList();
              for (var e in _objList) {
                log('model: ${e.toJson()}');
              }
            },
            child: Text('save data'),
          ),
        ],
      ),
    );
  }
}

class CustomPopupExample extends StatelessWidget {
  void Function(temMode?)? onPressed;

  CustomPopupExample({this.onPressed});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text("Enter Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Name", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // close dialog
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            String name = _nameController.text;
            String email = _emailController.text;
            onPressed?.call(temMode(name: name, mail: email));
            Navigator.pop(context); // close dialog
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Saved: $name, $email")));
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}

class temMode {
  String name;
  String mail;

  temMode({required this.name, required this.mail});
}
