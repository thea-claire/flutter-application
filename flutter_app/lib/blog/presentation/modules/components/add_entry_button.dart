import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_event.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_state.dart';

class AddEntryButton extends StatelessWidget {
  const AddEntryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.amber),
            onPressed: () {
              if (state.status == EntryStatus.loading) {
                return;
              }
              context.read<BlogBloc>().add(EntryAdded());
            },
            child: (state.status == EntryStatus.loading)
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const Text('Add Entry',
                    style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
