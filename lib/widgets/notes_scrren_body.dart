import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesAppBody extends StatefulWidget {
  const NotesAppBody({Key? key}) : super(key: key);

  @override
  State<NotesAppBody> createState() => _NotesAppBodyState();
}

class _NotesAppBodyState extends State<NotesAppBody> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<NotesListCubit>(context).fetchAllNotes();
  }

  final TextEditingController _controller = TextEditingController();
  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      BlocProvider.of<NotesListCubit>(context).fetchAllNotes();
      if (!isSearching) {
        _controller.clear();
        BlocProvider.of<NotesListCubit>(context)
            .fetchAllNotes(); // Clear text when not searching
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(
            icon: isSearching ? Icons.close : Icons.search,
            title: 'Notes App',
            onPressed: toggleSearch,
          ),
          Expanded(
            flex: 1,
            child: NotesListView(
              isSearching: isSearching,
              toggleSearch: toggleSearch,
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
