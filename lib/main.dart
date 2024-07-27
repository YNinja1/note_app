import 'package:flutter/material.dart';
import 'package:note_app/views/notes_view.dart';

void main() {
  runApp(const Notes_App());
}
class Notes_App extends StatelessWidget {
  const Notes_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      useMaterial3: false ,
        brightness: Brightness.dark
      ),
      home: const NotesView(),
    );
  }
}
