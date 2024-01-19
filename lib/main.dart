import 'package:flutter/material.dart';

// lib/main.dart
import 'package:flutter/material.dart';
import 'note_list_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      home: NoteListScreen(),
    );
  }
}
