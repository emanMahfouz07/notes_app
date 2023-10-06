import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

import '../cubits/notes_List_cubit.dart';

class NotesAppBody extends StatefulWidget {
  const NotesAppBody({Key? key}) : super(key: key);

  @override
  State<NotesAppBody> createState() => _NotesAppBodyState();
}

class _NotesAppBodyState extends State<NotesAppBody> {
  @override
  void initState() {
    BlocProvider.of<NotesListCubit>(context as BuildContext).fetchAllNotes();
    super.initState();
  }

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
