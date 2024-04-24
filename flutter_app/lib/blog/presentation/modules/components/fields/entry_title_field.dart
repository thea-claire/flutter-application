import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_event.dart';

class EntryTitleField extends StatelessWidget {
  final String title;
  const EntryTitleField({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 2)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 2)),
        labelText: 'Title',
        labelStyle:
            const TextStyle(fontFamily: 'Montserrat', color: Colors.brown),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        hoverColor: Colors.amber.shade50,
      ),
      initialValue: title,
      cursorColor: Color.fromARGB(242, 204, 71, 31),
      onChanged: (value) {
        context.read<BlogBloc>().add(
              EntryTitleChanged(value),
            );
      },
    );
  }
}
