import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class MenuButton extends StatelessWidget {
  final String? name;
  final String routeName;

  const MenuButton({Key? key, this.name, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.name;

    return Container(
        height: 75,
        constraints: BoxConstraints(minWidth: 50),
        child: TextButton(
          child: Text(name!,
              style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
          onPressed: () {
            if (route != routeName) {
              Beamer.of(context).beamToNamed(routeName);
            }
          },
        ));
  }
}
