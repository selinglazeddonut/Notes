import 'package:shared_preferences/shared_preferences.dart';

class NoteService {
  static const _key = 'notes';

  // Notları getir
  static Future<List<String>> getNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  // Not ekle
  static Future<void> addNote(String noteTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = prefs.getStringList(_key) ?? [];
    notes.add(noteTitle);
    await prefs.setStringList(_key, notes);
  }

  // Notu sil
  static Future<void> deleteNote(String noteTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = prefs.getStringList(_key) ?? [];
    notes.remove(noteTitle);
    await prefs.setStringList(_key, notes);
  }
}
