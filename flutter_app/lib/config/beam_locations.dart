import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_app/blog/presentation/modules/screens/blog.dart';

class RouteLocationGenerator {
  static const String homeRoute = '/';
  static const String blogRoute = '/blog';
}

class SimpleLocationGenerator {
  static final simpleLocationBuilder = RoutesLocationBuilder(routes: {
    '/': (context, state, data) => BeamPage(
        key: ValueKey('blog'),
        title: 'Blog',
        child: BlogPage(),
        type: BeamPageType.noTransition),
    '/blog': (context, state, data) => BeamPage(
        key: ValueKey('blog'),
        title: 'Blog',
        child: BlogPage(),
        type: BeamPageType.noTransition),
  });
}
