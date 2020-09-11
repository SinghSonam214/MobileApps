import 'package:first_app/main_app/models/sub_apps.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

final calendar = SubApp(
  AppSection(
    icon: Icons.dashboard,
    name: 'Calendar',
    builder: (context) {
      return Calendar();
    },
    hideAppbar: true,
    displayOrder: 1,
  ),
);
