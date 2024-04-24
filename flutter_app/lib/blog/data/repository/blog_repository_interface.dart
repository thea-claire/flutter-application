import 'package:flutter_app/blog/data/models/summary_form.dart';
import 'package:flutter_app/blog/data/models/summary_entry.dart';

abstract interface class BlogRepositoryInterface {
  Future<List<SummaryEntry>> retrieveSummaries();
  Future<SummaryEntry> addEntry(SummaryForm value);
  Future<void> deleteEntry(String id);
}
