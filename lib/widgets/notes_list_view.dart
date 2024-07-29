import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final List<Color> colorsData = const [
    Color(0xffFFCD79),
    Color(0xffE7E895),
    kPrimaryColor,
    Color(0xffD59DDC),
    Color(0xffE78FB1),
    Color(0xa6e64845),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
        index = index % 6;
          return  Padding(
            padding: const EdgeInsets.only(bottom:16),
            child:  NoteItem(color: colorsData[index],
            ),
          );
        });
  }
}
