import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_state.dart';
import 'package:flutter_app/blog/presentation/modules/components/entry_content.dart';

class BlogDashboard extends StatelessWidget {
  const BlogDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
        buildWhen: (previous, current) => current.status != previous.status,
        builder: (context, state) {
          if (state.status == EntryStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber)),
            );
          }

          if (state.status == EntryStatus.error) {
            return const Center(
              child:
                  Text('No available entries!', style: TextStyle(fontSize: 30)),
            );
          }

          return const EntryContent();
        });
  }
}
