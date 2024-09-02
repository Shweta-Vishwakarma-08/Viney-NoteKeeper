import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/ui/models/note_model.dart';

class NoteService {
  final String notesKey = "NOTES_KEY";

  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesData = prefs.getString(notesKey) ?? '[]';
    List<dynamic> jsonData = json.decode(notesData);
    return jsonData.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(notes.map((note) => note.toJson()).toList());
    await prefs.setString(notesKey, jsonData);
  }
}
