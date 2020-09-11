import 'dart:collection';

import 'package:flutter/material.dart';

import '../../main_app/models/sub_apps.dart';

class NavBar extends StatefulWidget {
  final UnmodifiableListView<SubApp> subApps;
  final AppSection currentSection;
  final void Function(AppSection) onSelect;

  const NavBar({
    Key key,
    @required this.subApps,
    @required this.onSelect,
    @required this.currentSection,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: Column(
          children: [
            for (var item in widget.subApps)
              GestureDetector(
                onTap: () {
                  widget.onSelect(item.mainSection);
                },
                child: Text((item.mainSection.name)),
              )
          ],
        ),
      ),
    );
  }
}
