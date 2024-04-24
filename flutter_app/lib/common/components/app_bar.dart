import 'package:flutter/material.dart';

import 'package:flutter_app/config/beam_locations.dart';
import 'package:flutter_app/common/utils/responsive_layout.dart';
import 'package:flutter_app/common/components/menu_button.dart';

class CustomAppBar extends PreferredSize {
  final Size _preferredSize;

  CustomAppBar({Key? key, Size? preferredSize})
      : _preferredSize = const Size.fromHeight(75),
        super(
            key: key,
            preferredSize: const Size.fromHeight(75),
            child: Container());

  @override
  Size get preferredSize => _preferredSize;

  @override
  Widget build(BuildContext context) {
    final screen = Responsive(context);
    return Container(
        color: Colors.amber,
        child: Row(
          children: [
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/images/book.png'),
                  ),
                  Text(
                    "Reading",
                    style: TextStyle(
                        fontFamily: 'RockSalt',
                        fontSize: !screen.isMobileView ? 15 : 12,
                        color: Colors.white),
                  ),
                  Text("List",
                      style: TextStyle(
                          fontFamily: 'Sacramento',
                          fontSize: !screen.isMobileView ? 22 : 15,
                          color: Colors.brown))
                ])),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MenuButton(
                  name: 'Blog',
                  routeName: RouteLocationGenerator.homeRoute,
                ),
                SizedBox(width: 25),
              ],
            ),
          ],
        ));
  }
}
