import 'dart:async';

import 'package:flutter_app/blog/data/api/blog_provider.dart';
import 'package:flutter_app/blog/data/repository/blog_repository_interface.dart';
import 'package:flutter_app/blog/data/models/summary_form.dart';
import 'package:flutter_app/blog/data/models/summary_entry.dart';

class BlogRepository implements BlogRepositoryInterface {
  final BlogProvider _blogRemoteSource;

  BlogRepository(this._blogRemoteSource);

  @override
  Future<SummaryEntry> addEntry(SummaryForm value) async {
    return await _blogRemoteSource.addEntry(value);
  }

  @override
  Future<List<SummaryEntry>> deleteEntry(String id) async {
    return await _blogRemoteSource.deleteEntry(id);
  }

  @override
  Future<List<SummaryEntry>> retrieveSummaries() async {
    return await _blogRemoteSource.retrieveSummaries();
  }
}
