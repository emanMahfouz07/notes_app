import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_modal_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_scrren_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
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
    );
  }
}
