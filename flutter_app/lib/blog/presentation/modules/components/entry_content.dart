import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_state.dart';
import 'package:flutter_app/blog/presentation/modules/screens/expanded_page.dart';

class EntryContent extends StatelessWidget {
  const EntryContent({super.key});

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

          if (state.status == EntryStatus.error ||
              state.summaryEntries.isEmpty) {
            return const Center(
              child:
                  Text('No available entries!', style: TextStyle(fontSize: 30)),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: state.summaryEntries.length,
            itemBuilder: (context, index) {
              final summary = state.summaryEntries[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () => {
                    print('* expanded entry'),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider<BlogBloc>.value(
                            value: context.read<BlogBloc>(),
                            child: ExpandedPage(summary: summary))))
                  },
                  child: Container(
                    color: Color.fromARGB(255, 243, 241, 235),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.summaryEntries[index].title,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.brown[900],
                          ),
                        ),
                        Text(
                          state.summaryEntries[index].subtitle,
                          style: const TextStyle(
                              fontFamily: 'Sacramento',
                              fontSize: 16,
                              color: Color.fromARGB(255, 248, 84, 25)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          child: Text(
                            state.summaryEntries[index].date,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 9,
                                color: Colors.brown[200]),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 200),
                          child: const Divider(
                              height: 12, thickness: 2, color: Colors.amber),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            state.summaryEntries[index].body,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                height: 1.2,
                                color: Colors.brown),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4, // Up to 4 lines on the body
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
