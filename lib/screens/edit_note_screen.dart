import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            SizedBox(
              height: 40,
            ),
            CustomTextField(hintText: 'Title'),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'Contetnt',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
