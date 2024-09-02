import 'package:get/get.dart';
import 'package:todo/services/note_Service.dart';
import 'package:todo/ui/models/note_model.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  final NoteService _noteService = NoteService();
  ///on init method
  @override
  void onInit() {
    loadNotes();
    super.onInit();
  }
  ///loadNotes method
  void loadNotes() async {
    notes.value = await _noteService.loadNotes();
  }

  ///addOrUpdateNote method
  void addOrUpdateNote(Note note) {
    int index = notes.indexWhere((n) => n.title == note.title);
    if (index == -1) {
      notes.add(note);
    } else {
      notes[index] = note;
    }
    _noteService.saveNotes(notes);
  }

  ///deleteNote method
  void deleteNote(Note note) {
    notes.remove(note);
    _noteService.saveNotes(notes);
  }

  ///filterNotes method
  List<Note> filterNotes(List<String> selectedCategories) {
    if (selectedCategories.isEmpty) return notes;
    return notes
        .where((note) => note.categories
            .any((category) => selectedCategories.contains(category)))
        .toList();
  }
}
