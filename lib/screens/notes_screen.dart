import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/widgets/custom_modal_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_scrren_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesListCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                builder: (context) {
                  return const AddNoteModalBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: const NotesAppBody(),
      ),
    );
  }
}
