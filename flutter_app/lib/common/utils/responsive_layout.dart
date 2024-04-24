// reference:
// https://medium.com/flutter-community/a-guide-to-using-screensize-in-flutter-a-more-readable-approach-901e82556195
// https://ashish-pipaliya.medium.com/flutter-responsive-layout-for-flutter-web-2a03ea6048e

import 'package:flutter/material.dart';

class Responsive {
  BuildContext context;

  Responsive(this.context);

  final kMobileMaxWidth = 550.0;
  final kTabletMaxWidth = 800.0;
  final kDesktopMaxWidth = 1080.0;
  final kWideScreenMaxWidth = 1440.0;

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  bool get isMobileView => width < kMobileMaxWidth;
  bool get isTabletView => isMobileView ? false : width < kTabletMaxWidth;
  bool get isDesktopView => !(isMobileView || isTabletView);
  bool get isWideScreenView => width >= kWideScreenMaxWidth;

  double get scrollWidth => 900;
}
