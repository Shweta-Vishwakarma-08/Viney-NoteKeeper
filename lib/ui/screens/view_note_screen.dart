import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/models/note_model.dart';
import 'package:todo/ui/screens/create_note_screen.dart';
import '../controllers/note_controller.dart';

class ViewNoteScreen extends StatelessWidget {
  final Note note;

  ViewNoteScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.viewNote),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Get.to(() => CreateNoteScreen(note: note)),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              noteController.deleteNote(note);
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Gap(16),
            Text(
              note.description,
              style: TextStyle(fontSize: 16),
            ),
            Gap(16),
            Text(
              'Categories: ${note.categories.join(', ')}',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
