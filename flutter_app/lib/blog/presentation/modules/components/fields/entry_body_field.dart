import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_event.dart';

class EntryBodyField extends StatelessWidget {
  const EntryBodyField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 3,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 2)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 2)),
        labelText: 'Body',
        labelStyle:
            const TextStyle(fontFamily: 'Montserrat', color: Colors.brown),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        hoverColor: Colors.amber.shade50,
      ),
      cursorColor: Color.fromARGB(242, 204, 71, 31),
      onChanged: (value) {
        context.read<BlogBloc>().add(
              EntryBodyChanged(value),
            );
      },
    );
  }
}
