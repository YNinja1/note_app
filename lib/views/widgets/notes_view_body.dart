import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 16),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(title: 'Notes',icon: Icons.search,
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
