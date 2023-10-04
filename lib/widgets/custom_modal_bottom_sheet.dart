import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/custome_button.dart';

class AddNoteModalBottomSheet extends StatelessWidget {
  const AddNoteModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}
