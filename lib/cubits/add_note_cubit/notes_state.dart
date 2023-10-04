part of 'notes_cubit.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class AddNoteLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class AddNoteFailure extends NotesState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}
