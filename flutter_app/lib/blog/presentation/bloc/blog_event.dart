abstract class BlogEvent {}

class SummariesRequested extends BlogEvent {}

class EntryAdded extends BlogEvent {}

class EntryDeleted extends BlogEvent {
  final String id;

  EntryDeleted(this.id);
}

class EntryTitleChanged extends BlogEvent {
  final String title;

  EntryTitleChanged(this.title);
}

class EntrySubtitleChanged extends BlogEvent {
  final String subtitle;

  EntrySubtitleChanged(this.subtitle);
}

class EntryDateChanged extends BlogEvent {
  final String date;

  EntryDateChanged(this.date);
}

class EntryBodyChanged extends BlogEvent {
  final String body;

  EntryBodyChanged(this.body);
}
