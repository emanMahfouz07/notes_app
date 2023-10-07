import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteModalBottomSheet extends StatefulWidget {
  const AddNoteModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteModalBottomSheet> createState() =>
      _AddNoteModalBottomSheetState();
}

class _AddNoteModalBottomSheetState extends State<AddNoteModalBottomSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            isLoading = true;
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('An error has occurred'),
              backgroundColor: Colors.red,
            ));
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesListCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, NotesState state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
