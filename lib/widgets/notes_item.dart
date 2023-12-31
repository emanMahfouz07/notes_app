import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_note_screen.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteScreen(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 18)),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesListCubit>(context).fetchAllNotes();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Note deleted successfully'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(note.date,
                  style: TextStyle(color: Colors.black.withOpacity(0.5))),
            )
          ],
        ),
      ),
    );
  }
}
