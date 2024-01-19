// lib/screens/new_note_screen.dart
import 'package:basit_projem/service/NoteService.dart';
import 'package:flutter/material.dart';
class NewNoteScreen extends StatelessWidget {
  // Controller'ı not başlığını takip etmek için kullanabiliriz
  final TextEditingController _noteTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Yeni not eklemek için aşağıdaki alanı doldurun:'),

            // Not başlığı için TextField
            TextField(
              controller: _noteTitleController,
              decoration: InputDecoration(
                labelText: 'Not Başlığı',
              ),
            ),

            SizedBox(height: 16), // Biraz boşluk ekleyelim

            // Yeni notu eklemek için ElevatedButton
            ElevatedButton(
              onPressed: () {
                // Notu eklemek için fonksiyonu çağır
                _addNoteButtonPressed(context);
              },
              child: Text('Notu Ekle'),
            ),
          ],
        ),
      ),
    );
  }

  // Yeni notu eklemek için fonksiyon
  void _addNoteButtonPressed(BuildContext context) {
    String noteTitle = _noteTitleController.text;

    // Not başlığı boş mu kontrol et
    if (noteTitle.trim().isNotEmpty) {
      // Notu eklemek için servisi kullan
      NoteService.addNote(noteTitle);

      // Geri dön
      Navigator.pop(context);
    } else {
      // Not başlığı boşsa kullanıcıyı uyar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Not başlığı boş olamaz.'),
        ),
      );
    }
  }
}
