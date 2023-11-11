import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_List_cubit.dart';
import 'package:notes_app/cubits/search/search_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:notes_app/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchNotesCubit>(
          create: (context) => SearchNotesCubit(),
        ),
        BlocProvider<NotesListCubit>(create: (context) => NotesListCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: kPrimaryLightColor),
        darkTheme: ThemeData(
          primaryColor: kPrimaryColor,
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        home: NotesScreen(),
      ),
    );
  }
}
