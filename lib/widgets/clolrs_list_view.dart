import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
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
                  BlocProvider.of<NotesCubit>(context).color = colors[index];
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
  }
}
