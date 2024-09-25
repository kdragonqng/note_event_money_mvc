import 'package:note_event_money/models/home_model.dart';

class HomeController {
  final List<HomeModel> _notes = [];

  List<HomeModel> get notes => _notes;

  void addNote(String title) {
    _notes.add(HomeModel(title: title));
  }

  void toggleNoteStatus(int index) {
    if (index >= 0 && index < _notes.length) {
      _notes[index].isDone = !_notes[index].isDone;
    }
  }

  void removeNote(int index) {
    if (index >= 0 && index < _notes.length) {
      _notes.removeAt(index);
    }
  }
}
