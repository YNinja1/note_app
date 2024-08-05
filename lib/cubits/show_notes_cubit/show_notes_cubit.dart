import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'show_notes_state.dart';

class ShowNotesCubit extends Cubit<ShowNotesState> {
  ShowNotesCubit() : super(ShowNotesInitial());

  fetchAllNotes() {
    try{
     var notesBox = Hive.box<NoteModel>(kNotesBox);
     
    List<NoteModel> notes = notesBox.values.toList();
    emit(ShowNotesSuccess(notes));
    }catch(e)
    {
      emit(ShowNotesFailure(e.toString()));
    }
  }
}
