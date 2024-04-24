import 'package:equatable/equatable.dart';

import 'package:flutter_app/blog/data/models/summary_entry.dart';

class BlogState extends Equatable {
  final String titleInput;
  final String subtitleInput;
  final String dateInput;
  final String bodyInput;
  final List<SummaryEntry> summaryEntries;
  final EntryStatus status;
  final Exception? error;

  const BlogState({
    this.titleInput = '',
    this.subtitleInput = '',
    this.dateInput = '',
    this.bodyInput = '',
    this.summaryEntries = const [],
    this.status = EntryStatus.initial,
    this.error,
  });

  BlogState copyWith({
    String? titleInput,
    String? subtitleInput,
    String? dateInput,
    String? bodyInput,
    List<SummaryEntry>? summaryEntries,
    EntryStatus? status,
    Exception? error,
  }) {
    return BlogState(
      titleInput: titleInput ?? this.titleInput,
      subtitleInput: subtitleInput ?? this.subtitleInput,
      dateInput: dateInput ?? this.dateInput,
      bodyInput: bodyInput ?? this.bodyInput,
      summaryEntries: summaryEntries ?? this.summaryEntries,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        titleInput,
        subtitleInput,
        dateInput,
        bodyInput,
        summaryEntries,
        status,
        error,
      ];
}

enum EntryStatus { initial, loading, success, error, empty, incorrect }
