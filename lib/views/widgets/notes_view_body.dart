import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/display_note_cubit/display_note_cubit.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<DisplayNoteCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 16),
      child: Column(
        children: [
          const  SizedBox(
            height: 30,
          ),
          CustomAppBar(title: 'Notes',icon: Icons.search,onPressed: (){},
          ),
          const  SizedBox(
            height: 24,
          ),
          const  Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
