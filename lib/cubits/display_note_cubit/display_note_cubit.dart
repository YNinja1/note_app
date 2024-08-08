import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'display_note_state.dart';

class DisplayNoteCubit extends Cubit<DisplayNoteState> {
  DisplayNoteCubit() : super(DisplayNoteInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    if (notes != null) {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

         notes = notesBox.values.toList();
         print('zzzzzzzzzzzzzzzz notes = $notes');
    }else if(notes == null)
    {
      emit(DisplayNoteNoNotes());
    }
  }
}
