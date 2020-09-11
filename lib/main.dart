import 'dart:collection';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:first_app/main_app/models/sub_apps.dart';
//import 'package:first_app/nav-bar-hooks.dart';
import 'common/appBar/appBar.dart';
import 'common/widgets/layout.dart';
import 'main_app/navbar/nav_bar.dart';
import 'nav-bar-hooks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Layout(
          child: CasefoxApp(
            subApps: UnmodifiableListView([...navBarItems]),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class CasefoxApp extends StatefulWidget {
  final UnmodifiableListView<SubApp> subApps;

  CasefoxApp({Key randomkey, @required this.subApps})
      : assert((subApps?.length ?? 0) > 0),
        super(key: randomkey);

  @override
  _CasefoxAppState createState() => _CasefoxAppState();
}

class _CasefoxAppState extends State<CasefoxApp> with RouteAware {
  final navigator = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AppSection currentSection;

  _CasefoxAppState();
  Widget build(BuildContext context) {
    List<SubApp> navBarList = [];
    navBarList.addAll(widget.subApps);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        currentSection,
        Key('random key'),
      ),
      drawer: buildDrawer(context, navBarList),
      // body: currentSection.builder(context),
    );
  }
}

Builder buildDrawer(BuildContext context, List<SubApp> navBarList) {
  return Builder(
    builder: (BuildContext context) {
      return Drawer(
        child: NavBar(
          currentSection: navBarList.first.mainSection,
          subApps: UnmodifiableListView([...navBarList]),
          onSelect: (section) {
            Navigator.pop(context);
            print(section.name);
            setState(() {
              currentSection = section;
            });
          },
        ),
      );
    },
  );
}
