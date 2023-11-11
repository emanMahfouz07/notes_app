import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/search/search_state.dart';
import 'package:notes_app/models/note_model.dart';

class SearchNotesCubit extends Cubit<SearchNotesState> {
  SearchNotesCubit() : super(NotesSearchListInitial());

  List<NoteModel>? _originalNotes;

  setNotes(List<NoteModel> notes) {
    _originalNotes = notes;
    emit(NotesSearchSuccess(_originalNotes));
  }

  void searchNote(String query, List<NoteModel> notes) {
    if (query.isEmpty) {
      emit(NotesSearchSuccess(notes));
    } else {
      final filteredNotes = notes
          .where((note) =>
              note.title.toLowerCase().contains(query.toLowerCase()) ||
              note.subTitle.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(NotesSearchSuccess(filteredNotes));
    }
  }
}
