import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/cubits/notes_list_state.dart';
import 'package:notes_app/cubits/search/search_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/notes_item.dart';
import 'package:notes_app/cubits/search/search_cubit.dart';

class NotesListView extends StatefulWidget {
  const NotesListView(
      {Key? key,
      required this.toggleSearch,
      required this.isSearching,
      required this.controller})
      : super(key: key);
  final VoidCallback toggleSearch;
  final bool isSearching;
  final TextEditingController controller;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchNotesCubit>(context);

    return BlocBuilder<NotesListCubit, NotesListState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesListCubit>(context).notes ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              if (widget.isSearching)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (query) {
                      searchCubit.searchNote(query, notes);
                      BlocProvider.of<NotesListCubit>(context).fetchAllNotes();
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search Notes',
                      hintText: 'Enter a search term',
                    ),
                  ),
                ),
              if (widget.isSearching)
                Expanded(
                  child: BlocBuilder<SearchNotesCubit, SearchNotesState>(
                    builder: (context, searchState) {
                      if (searchState is NotesSearchSuccess) {
                        return ListView.builder(
                          itemCount: searchState.notes!.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: NotesItem(
                                note: searchState.notes![index],
                              ),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: notes.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: NotesItem(
                          note: notes[index],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
