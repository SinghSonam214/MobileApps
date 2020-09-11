import 'dart:collection';
import 'package:flutter/widgets.dart';

class SubApp {
  final AppSection mainSection;
  final UnmodifiableListView<AppSection> subSections;

  SubApp(
    this.mainSection, {
    List<AppSection> subSections = const [],
  })  : subSections = UnmodifiableListView(subSections),
        assert(mainSection != null);
}

class AppSection {
  final IconData icon;
  final String name;
  final WidgetBuilder builder;
  final WidgetBuilder appBarAction;
  final int badgeValue;
  final bool hideAppbar;
  final String appId;
  final int displayOrder;
  //final Level level;
  final List<String> roles;

  AppSection({
    @required this.icon,
    @required this.name,
    @required this.builder,
    this.appBarAction,
    this.badgeValue = 0,
    this.appId = '',
    this.hideAppbar,
    @required this.displayOrder,
    // this.level,
    this.roles,
  }) : assert(displayOrder != null && displayOrder > 0);
}
