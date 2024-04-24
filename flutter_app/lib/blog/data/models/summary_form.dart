import 'package:equatable/equatable.dart';

class SummaryForm extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String date;
  final String body;

  const SummaryForm({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'date': date,
      'body': body,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      subtitle,
      date,
      body,
    ];
  }
}
