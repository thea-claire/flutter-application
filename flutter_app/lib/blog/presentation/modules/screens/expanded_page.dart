import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/data/models/summary_entry.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_event.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_state.dart';

import 'package:flutter_app/common/components/menu_button.dart';
import 'package:flutter_app/common/utils/responsive_layout.dart';
import 'package:flutter_app/config/beam_locations.dart';

class ExpandedPage extends StatelessWidget {
  final SummaryEntry summary;
  const ExpandedPage({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final response = Responsive(context);

    return BlocBuilder<BlogBloc, BlogState>(
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (context, state) {
        if (state.status == EntryStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber)),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            centerTitle: true,
            toolbarHeight: 75,
            title: Row(
              children: [
                Text(
                  "Reading",
                  style: TextStyle(
                      fontFamily: 'RockSalt',
                      fontSize: !response.isMobileView ? 15 : 12,
                      color: Colors.white),
                ),
                Text("List",
                    style: TextStyle(
                        fontFamily: 'Sacramento',
                        fontSize: !response.isMobileView ? 22 : 15,
                        color: Colors.brown)),
              ],
            ),
            actions: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MenuButton(
                    name: 'Blog',
                    routeName: RouteLocationGenerator.homeRoute,
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ],
          ),
          body: Container(
              width: response.width,
              height: response.height,
              color: Color.fromARGB(255, 243, 241, 235),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(summary.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.brown[900])),
                  ),
                  const SizedBox(height: 20),
                  Center(
                      child: Text(summary.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Sacramento',
                              fontSize: 25,
                              color: Color.fromARGB(255, 248, 84, 25)))),
                  const SizedBox(height: 5),
                  Text(
                    summary.date,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        color: Colors.brown[200]),
                  ),
                  Container(
                    constraints:
                        const BoxConstraints(minWidth: 200, maxWidth: 400),
                    child: const Divider(
                        height: 40, thickness: 2, color: Colors.amber),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(62.0),
                    child: Text(
                      summary.body,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Delete Entry
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.amber),
                        onPressed: () => {
                          print(
                              "* deleted entry ${summary.id}, ${summary.title}"),
                          context
                              .read<BlogBloc>()
                              .add(EntryDeleted(summary.id)),
                          Navigator.of(context).pop()
                        },
                        child: const Text('Delete Entry',
                            style: TextStyle(fontFamily: 'Montserrat')),
                      ),
                      SizedBox(width: 50.0),
                    ],
                  ),
                ],
              ))),
        );
      },
    );
  }
}
