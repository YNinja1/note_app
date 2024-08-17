import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/display_note_cubit/display_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_snack_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:note_app/views/widgets/edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.done,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<DisplayNoteCubit>(context).fetchAllNotes();

                Navigator.pop(context);
                customShowSnackBar(context, message: 'Edit Note Success!');
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextFormField(
                onChanged: (value) {
                  title = value;
                },
                hint: widget.note.title),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),

            const SizedBox(height: 20,
          ),
            EditNoteColorsList(note: widget.note)
          ],
        ),
      ),
    );
  }
}
