import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/blog/data/models/summary_form.dart';
import 'package:flutter_app/blog/data/repository/blog_repository.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_event.dart';
import 'package:flutter_app/blog/presentation/bloc/blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository _blogRepository;

  BlogBloc(this._blogRepository) : super(const BlogState()) {
    on<SummariesRequested>(_onSummariesRequested);
    on<EntryAdded>(_onAdded);
    on<EntryDeleted>(_onDeleted);
    on<EntryTitleChanged>(_onTitleChanged);
    on<EntrySubtitleChanged>(_onSubtitleChanged);
    on<EntryDateChanged>(_onDateChanged);
    on<EntryBodyChanged>(_onBodyChanged);
  }

  // Summaries Request
  Future<void> _onSummariesRequested(
    SummariesRequested event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(status: EntryStatus.loading));

    final posts = await _blogRepository.retrieveSummaries();

    emit(
      state.copyWith(
        status: EntryStatus.success,
        summaryEntries: posts,
      ),
    );
  }

  // Add Entry
  Future<void> _onAdded(
    EntryAdded event,
    Emitter<BlogState> emit,
  ) async {
    if (state.dateInput.isEmpty &&
        state.titleInput.isEmpty &&
        state.subtitleInput.isEmpty &&
        state.bodyInput.isEmpty) {
      emit(state.copyWith(status: EntryStatus.empty));
      return;
    }

    emit(state.copyWith(status: EntryStatus.loading));

    final entry = await _blogRepository.addEntry(SummaryForm(
        id: '',
        title: state.titleInput,
        subtitle: state.subtitleInput,
        date: state.dateInput,
        body: state.bodyInput));

    emit(
      state.copyWith(status: EntryStatus.success),
    );
  }

  // Delete Entry
  Future<void> _onDeleted(
    EntryDeleted event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(status: EntryStatus.loading));

    final newSummaries = await _blogRepository.deleteEntry(event.id);

    print("* onDeleted");
    emit(
      state.copyWith(
        status: EntryStatus.success,
        summaryEntries: newSummaries,
      ),
    );
  }

  // Fields Change
  void _onTitleChanged(
    EntryTitleChanged event,
    Emitter<BlogState> emit,
  ) {
    print("* onTitleChanged");
    emit(state.copyWith(titleInput: event.title));
  }

  void _onSubtitleChanged(
    EntrySubtitleChanged event,
    Emitter<BlogState> emit,
  ) {
    print("* onSubtitleChanged");
    emit(state.copyWith(subtitleInput: event.subtitle));
  }

  void _onDateChanged(
    EntryDateChanged event,
    Emitter<BlogState> emit,
  ) {
    print("* onDateChanged");
    emit(state.copyWith(dateInput: event.date));
  }

  void _onBodyChanged(
    EntryBodyChanged event,
    Emitter<BlogState> emit,
  ) {
    print("* onBodyChanged");
    emit(state.copyWith(bodyInput: event.body));
  }
}
