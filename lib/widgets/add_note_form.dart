import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/clolrs_list_view.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/custome_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ColorsListView(),
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTab: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedDate = DateFormat.yMd().format(currentDate);

                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedDate,
                        color: Colors.purple.value);
                    BlocProvider.of<NotesCubit>(context).addNote(noteModel);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Note Added Successfully'),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
