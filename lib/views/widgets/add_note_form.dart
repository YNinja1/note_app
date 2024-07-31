import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

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

  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child:  Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value){
              title = value;
            },
            hint: 'Title',
          ),
          const  SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value){
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 120,
          ),
          CustomButton(
            onTap: (){
              if(formKey.currentState!.validate())
              {
                formKey.currentState!.save();
              }else{
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const  SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}