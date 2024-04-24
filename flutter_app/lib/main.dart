import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blog/data/api/blog_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/config/beam_locations.dart';

void main() {
  setPathUrlStrategy();
  runApp(riverpod.ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final routeDelegate = BeamerDelegate(
      locationBuilder: SimpleLocationGenerator.simpleLocationBuilder);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BlogProvider(),
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: routeDelegate,
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routeDelegate),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
