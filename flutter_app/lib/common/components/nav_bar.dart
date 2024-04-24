import 'package:flutter/material.dart';

import 'package:flutter_app/config/beam_locations.dart';
import 'package:flutter_app/common/utils/responsive_layout.dart';
import 'package:flutter_app/common/components/menu_button.dart';

class CustomNavBar extends PreferredSize {
  final Size _preferredSize;

  CustomNavBar({Key? key, Size? preferredSize})
      : _preferredSize = Size.fromHeight(75),
        super(key: key, preferredSize: Size.fromHeight(75), child: Container());

  @override
  Size get preferredSize => _preferredSize;

  @override
  Widget build(BuildContext context) {
    final screen = Responsive(context);
    return Container(
        color: Colors.green[900],
        child: Row(
          children: [
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/images/rm.png'),
                  ),
                  Text(
                    "Rick",
                    style: TextStyle(
                        fontFamily: 'RockSalt',
                        fontSize: !screen.isMobileView ? 20 : 15,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    "and",
                    style: TextStyle(
                        fontFamily: 'Sacramento',
                        fontSize: !screen.isMobileView ? 18 : 12,
                        color: Colors.white),
                  ),
                  Text("Morty",
                      style: TextStyle(
                          fontFamily: 'RockSalt',
                          fontSize: !screen.isMobileView ? 20 : 15,
                          color: Colors.lightBlue)),
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
