import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/screens/create_note_screen.dart';
import 'package:todo/ui/screens/view_note_screen.dart';
import 'package:todo/ui/widgets/note_widget.dart';
import '../controllers/note_controller.dart';

class NoteListScreen extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.notes),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // I will write filter logic here
            },
          )
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return NoteCard(
              title: note.title,
              description: note.description,
              onTap: () => Get.to(() => ViewNoteScreen(note: note)),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(() => CreateNoteScreen()),
      ),
    );
  }
}
