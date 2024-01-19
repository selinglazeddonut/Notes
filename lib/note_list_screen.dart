import 'package:basit_projem/service/NoteService.dart';
import 'package:flutter/material.dart';
import 'note_detail_screen.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
      ),
      body: FutureBuilder<List<String>>(
        future: NoteService.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> notes = snapshot.data ?? [];

            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteDetailScreen(noteTitle: notes[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewNoteScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewNoteScreen extends StatelessWidget {
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
              onChanged: (value) {
                // Not başlığını güncelle
                // Bu değeri daha sonra kullanarak not ekleyebilirsiniz
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // Not ekleme işlemini gerçekleştir
                String noteTitle = ""; // TextField'dan gelen değeri alın
                await NoteService.addNote(noteTitle);

                // Not ekledikten sonra geri dön
                Navigator.pop(context);
              },
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
