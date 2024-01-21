// lib/screens/new_note_screen.dart
import 'package:basit_projem/service/NoteService.dart';
import 'package:flutter/material.dart';
class NewNoteScreen extends StatelessWidget {
  final TextEditingController _noteTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ekran içeriği ve yeni not eklemek için gerekli bileşenler'),
            TextField(
              controller: _noteTitleController,
              onChanged: (value) {
                // Not başlığını güncelle
                // Bu değeri daha sonra kullanarak not ekleyebilirsiniz
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // Not ekleme işlemini gerçekleştir
                String noteTitle = _noteTitleController.text; // TextField'dan gelen değeri al
                if (noteTitle.trim().isNotEmpty) {
                  // Not başlığı boş mu kontrol et
                  await NoteService.addNote(noteTitle);

                  // Not ekledikten sonra geri dön
                  Navigator.pop(context);
                } else {
                  // Not başlığı boşsa kullanıcıyı uyar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Not başlığı boş olamaz.'),
                    ),
                  );
                }
              },
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
