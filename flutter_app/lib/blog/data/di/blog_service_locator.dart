import 'package:flutter_app/blog/data/api/blog_provider.dart';
import 'package:flutter_app/blog/data/repository/blog_repository.dart';

final blogRemoteSource = BlogProvider();
final blogRepository = BlogRepository(blogRemoteSource);
