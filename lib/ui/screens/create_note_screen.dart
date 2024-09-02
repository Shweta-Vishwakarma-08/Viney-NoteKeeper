import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todo/ui/models/note_model.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/custom_text_field.dart';
import '../controllers/note_controller.dart';

class CreateNoteScreen extends StatelessWidget {
  final NoteController noteController = Get.find();
  final Note? note;

  CreateNoteScreen({super.key, this.note});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedCategories = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      titleController.text = note!.title;
      descriptionController.text = note!.description;
      selectedCategories.assignAll(note!.categories);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? AppString.createNote:AppString.editNote),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(controller: titleController, hintText: AppString.title),
              Gap(10),
              CustomTextField(
                controller: descriptionController,
                hintText: AppString.description,
                maxLine: 10,
              ),
              Gap(16)
              Text(AppString.categories),
              Obx(() {
                return Wrap(
                  children:
                      ['Work', 'Personal', 'Ideas', 'Others'].map((category) {
                    return CheckboxListTile(
                      title: Text(category),
                      value: selectedCategories.contains(category),
                      onChanged: (selected) {
                        if (selected == true) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                      },
                    );
                  }).toList(),
                );
              }),
              Gap(10),
              CustomButton(
                text: AppString.save,
                onPressed: () {
                  final newNote = Note(
                    title: titleController.text,
                    description: descriptionController.text,
                    categories: selectedCategories,
                  );
                  noteController.addOrUpdateNote(newNote);
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
