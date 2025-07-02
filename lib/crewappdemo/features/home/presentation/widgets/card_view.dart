import 'package:flutter/material.dart';
import '../../../../core/models/note_model.dart';

class CardView extends StatelessWidget {
  NotesModel model;

  CardView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        title: Text(
          model.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[800]),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(model.message, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
        ),
      ),
    );
  }
}
