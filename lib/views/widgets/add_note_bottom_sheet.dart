import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/display_note_cubit/display_note_cubit.dart';
import 'package:note_app/views/widgets/add_note_form.dart';
import 'package:note_app/views/widgets/custom_snack_bar.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print(' failed ${state.errMessage}');
            customShowSnackBar(context, message: 'Failed!');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<DisplayNoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            customShowSnackBar(context, message: 'Add Note Success!');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}

