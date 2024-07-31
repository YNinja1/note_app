import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if(state is AddNoteFailure){
              print('failed ${state.errMessage}');
            }

            if(state is AddNoteSuccess){
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return  ModalProgressHUD(inAsyncCall: state is AddNoteLoading ? true : false ,
            child: const AddNoteForm());
          },
        ),
      ),
    );
  }
}
