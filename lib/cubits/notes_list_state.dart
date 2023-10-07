import 'package:notes_app/models/note_model.dart';

abstract class NotesListState {}

class NotesListInitial extends NotesListState {}

class NotesLoading extends NotesListState {}

class NotesSuccess extends NotesListState {
  final List<NoteModel>? notes;

  NotesSuccess(this.notes);
}
