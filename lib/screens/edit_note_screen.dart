import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesListCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              oldText: widget.note.title,
              onChanged: (value) {
                title = value;
              },
              hintText: 'Add text',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              oldText: widget.note.subTitle,
              hintText: ' Content',
              onChanged: (value) {
                subTitle = value;
              },
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
