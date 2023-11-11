import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'color_item.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  final List<Color> colors = const [
    Color(0xffF15BB5),
    Color(0xff9B5DE5),
    Color(0xffFEE440),
    Color(0xffff6b35),
    Color(0xfffcf6bd),
    Color(0xff00F5D4),
    Color(0xff00bbf9),
  ];
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = colors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  isActive: currentIndex == index,
                  color: colors[index].value,
                ),
              ),
            );
          }),
    );
    ();
  }
}
