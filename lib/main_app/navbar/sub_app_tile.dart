import 'package:flutter/material.dart';
import 'package:first_app/main_app/models/sub_apps.dart';

class SubAppTile extends StatelessWidget {
  final SubApp app;
  final void Function(AppSection section) onSelect;
  final AppSection currentSection;

  const SubAppTile({
    Key key,
    @required this.app,
    @required this.onSelect,
    @required this.currentSection,
  })  : assert(app != null),
        assert(onSelect != null),
        super(key: key);

  Widget _sectionTile(
    BuildContext context,
    AppSection section,
    bool isSubSection,
  ) {
    return Column(
      children: <Widget>[
        _buildRow(
            context, section, section.badgeValue, currentSection == section),
        if (!isSubSection)
          Divider(
            color: Theme.of(context).accentColor,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((app.subSections?.length ?? 0) > 0) {
      final expanded = app.mainSection == currentSection ||
          app.subSections.any((sec) => sec == currentSection);

      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          constraints: BoxConstraints.expand(),
          child: ExpansionTile(
            initiallyExpanded: expanded,
            leading: Icon(app.mainSection.icon),
            title: Text(app.mainSection.name),
            children: <Widget>[
              for (final section in app.subSections)
                _sectionTile(context, section, true)
            ],
          ),
        ),
        onTap: () {
          onSelect(app.mainSection);
        },
      );
    }

    return _sectionTile(context, app.mainSection, false);
  }

  Widget _buildRow(BuildContext context, AppSection section, int badgeNumber,
      bool selected) {
    var color = Theme.of(context).textTheme.title.color;
    if (selected) color = Theme.of(context).highlightColor;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Icon(
              section.icon,
              color: color,
            ),
            SizedBox(width: 10.0),
            Text(
              section.name.toUpperCase(),
              style:
                  Theme.of(context).textTheme.subtitle.copyWith(color: color),
            ),
            Spacer(),
            if (badgeNumber > 0)
              Material(
                elevation: 3.0,
                child: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    '10+',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
          ],
        ),
      ),
      onTap: () {
        onSelect(app.mainSection);
      },
    );
  }
}
