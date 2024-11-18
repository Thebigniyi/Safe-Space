import 'package:stacked/stacked.dart';

import '../ui/views/home/home_viewmodel.dart';

class DiaryService with ListenableServiceMixin {
  List<DiaryEntry> _entries = [];
  List<DiaryEntry> get entries => _entries;
  List<DiaryEntry> _entriesArchieve = [];
  List<DiaryEntry> get entriesArchieve => _entriesArchieve;

  void addToArchieve(DiaryEntry entry) {
    _entriesArchieve.add(entry);
    _entries.remove(entry);
    notifyListeners();
  }

  void deleteFromList(DiaryEntry entry) {
    _entries.remove(entry);
    notifyListeners();
  }

  void addToList(DiaryEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void toggleFavorite(DiaryEntry entry) {
    for (var i in _entries) {
      if (i.title == entry.title) {
        i.isfavorite = !i.isfavorite;
        notifyListeners();
      }
    }
  }

  void editEntry(DiaryEntry entry) {
    for (var i in _entries) {
      if (i.title == entry.title) {
        i.content = entry.content;
        notifyListeners();
      }
    }
  }
}
