import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/display_note_cubit/display_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNoteCubit, DisplayNoteState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplayNoteCubit>(context).notes ?? [];
        return state is DisplayNoteInitial
            ? Center(child: noNotesText())
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NoteItem(
                      note: notes[index],

                    ),
                  );
                });
      },
    );
  }

  Text noNotesText() => const Text(
        'Add ur first Note 😊',
        style: TextStyle(fontSize: 32, color: kPrimaryColor),
      );
}
