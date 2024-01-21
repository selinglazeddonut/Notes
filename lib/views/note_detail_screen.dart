import 'package:basit_projem/service/NoteService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  final String noteTitle;

  NoteDetailScreen({required this.noteTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Note Title: $noteTitle',
              style: TextStyle(
                color: Colors.black, // Siyah renk
                fontSize: 18.0,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Notu silme işlemini gerçekleştir
                await NoteService.deleteNote(noteTitle);

                // Notu sildikten sonra geri dön
                Navigator.pop(context);
              },
              child: Text('Delete Note'),
            ),
          ],
        ),
      ),
    );
  }
}

