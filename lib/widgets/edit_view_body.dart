import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import '../cubits/notes_List_cubit.dart';
import 'edit_note_colors_list.dart';

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
