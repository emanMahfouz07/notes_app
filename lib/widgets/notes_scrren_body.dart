import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_item.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesAppBody extends StatelessWidget {
  const NotesAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(
            icon: Icons.search,
            title: 'Notes App',
          ),
          Expanded(
            child: NotesListView(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
