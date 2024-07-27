import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(24),
      child:  Column(
        children: [
          SizedBox(height: 30,
          ),
          CustomAppBar(),
        ],
      ),
    ) ;
  }
}
