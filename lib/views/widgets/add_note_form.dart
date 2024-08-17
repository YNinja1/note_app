import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/color_list_view.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });


  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
   NoteModel? noteModel;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 30,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: customButtonLogic(state, context));
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  CustomButton customButtonLogic(AddNoteState state, BuildContext context) {
    return CustomButton(
        isLoading: state is AddNoteLoading ? true : false,
        onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            var noteModel = NoteModel(
                title: title!,
                subTitle: subTitle!,
                date: customDateTime(),
                color: BlocProvider.of<AddNoteCubit>(context).color.value
            );
            BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
          } else {
            autoValidateMode = AutovalidateMode.always;
            setState(() {});
          }
        });
  }
}

String customDateTime() {
  DateTime currentDate = DateTime.now();
  String formattedDate = DateFormat.yMMMMd('en_US').format(currentDate);

  return formattedDate;
}
