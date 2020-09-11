import 'package:flutter/material.dart';

import '../../main_app/models/sub_apps.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final AppSection currentApp;

  MyAppBar(
    this.currentApp,
    key,
  ) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  State<StatefulWidget> createState() {
    return MyAppBarState();
  }
}

class MyAppBarState extends State<MyAppBar> {
  ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return AppBar(
      centerTitle: true,
      key: widget.key,
      title: Text("Dashboard"),

      // actions: [widget.currentApp.appBarAction(context)],
    );
  }
}
