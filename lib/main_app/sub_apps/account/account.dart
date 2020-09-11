import 'package:first_app/main_app/models/sub_apps.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

final account = SubApp(
  AppSection(
    icon: Icons.dashboard,
    name: 'Account',
    builder: (context) {
      return Account();
    },
    hideAppbar: true,
    displayOrder: 1,
  ),
);
