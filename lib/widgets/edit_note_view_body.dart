import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child:  Padding(
        padding:  EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 16),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(title: 'Edit Note',
            icon: Icons.done,
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextFormField(hint: 'Title'),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(hint: 'Content',maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
