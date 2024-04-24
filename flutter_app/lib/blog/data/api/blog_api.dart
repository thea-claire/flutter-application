import 'package:flutter_app/blog/data/api/blog_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blogApiProvider = Provider<BlogApiProvider>((ref) => BlogApiProvider());

class BlogApiProvider {
  final summaries = BlogProvider();
}
