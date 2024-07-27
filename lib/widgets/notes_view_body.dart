import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(),
          SizedBox(
            height: 24,
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
