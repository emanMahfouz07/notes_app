import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class EditNoteScreenBody extends StatelessWidget {
  const EditNoteScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            icon: Icons.search,
            title: 'Notes',
          ),
        ],
      ),
    );
  }
}
