import 'package:notes_app/models/note_model.dart';

abstract class SearchNotesState {}

class NotesSearchListInitial extends SearchNotesState {}

class NotesSearchSuccess extends SearchNotesState {
  final List<NoteModel>? notes;

  NotesSearchSuccess(this.notes);
}

class NotesFailure extends SearchNotesState {
  final String errMessage;

  NotesFailure(this.errMessage);
}
