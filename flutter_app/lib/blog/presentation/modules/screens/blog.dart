import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/data/di/blog_service_locator.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_event.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_state.dart';

import 'package:flutter_app/blog/presentation/modules/components/add_entry_button.dart';
import 'package:flutter_app/blog/presentation/modules/components/blog_dashboard.dart';
import 'package:flutter_app/blog/presentation/modules/components/fields/entry_title_field.dart';
import 'package:flutter_app/blog/presentation/modules/components/fields/entry_subtitle_field.dart';
import 'package:flutter_app/blog/presentation/modules/components/fields/entry_date_field.dart';
import 'package:flutter_app/blog/presentation/modules/components/fields/entry_body_field.dart';
import 'package:flutter_app/common/components/app_bar.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlogBloc>(
      //initialize initial data
      create: (context) {
        return BlogBloc(blogRepository)
          ..add(
            SummariesRequested(),
          );
      },
      child: BlocListener<BlogBloc, BlogState>(
        listenWhen: (previous, current) => current.status != previous.status,
        listener: (context, state) {
          if (state.status == EntryStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Entries Successfully Loaded')),
            );
          }

          if (state.status == EntryStatus.empty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                      'Missing Values. Please fill out all the details on the form.')),
            );
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(),
          body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: BlogDashboard()), // List View of Entries
                  SizedBox(height: 8),
                  Container(
                    /// Add Entry Portion
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const SingleChildScrollView(
                      child: Form(
                          child: Column(
                        children: [
                          Text(
                            'Add Entry',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color.fromARGB(242, 204, 71, 31)),
                          ),
                          SizedBox(height: 7),
                          SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                EntryDateField(),
                                SizedBox(height: 7),
                                EntryTitleField(),
                                SizedBox(height: 7),
                                EntrySubtitleField(),
                                SizedBox(height: 7),
                                EntryBodyField(),
                                SizedBox(height: 15)
                              ]))
                        ],
                      )),
                    ),
                  ),
                  SizedBox(height: 8),
                  AddEntryButton(),
                  SizedBox(height: 8),
                ],
              )),
        ),
      ),
    );
  }
}
