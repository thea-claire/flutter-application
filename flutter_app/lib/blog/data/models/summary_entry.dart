import 'package:equatable/equatable.dart';

class SummaryEntry extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String date;
  final String body;

  const SummaryEntry(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.body});

  factory SummaryEntry.fromJson(Map<String, dynamic> json) {
    return SummaryEntry(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        subtitle: json['subtitle'] ?? '',
        date: json['date'] ?? '',
        body: json['body'] ?? '');
  }

  @override
  List<Object> get props {
    return [id, title, subtitle, date, body];
  }
}
