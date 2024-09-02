import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/screens/note_list_screen.dart';

void main() {
  runApp(NoteTakingApp());
}

class NoteTakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      showCheckModeBanner:false
      title: AppString.noteKeeper,
      theme: ThemeData.dark(),
      home: NoteListScreen(),
    );
  }
}
