import 'package:flutter/material.dart';

class LayoutData {
  final Device device;

  const LayoutData({this.device = Device.Mobile});
}

enum Device { Mobile, Tablet, Desktop }

class Layout extends StatelessWidget {
  final Widget child;
  final LayoutData layoutData;

  static const _kLayoutData = LayoutData(device: Device.Mobile);

  const Layout({
    Key key,
    @required this.child,
    this.layoutData,
  }) : super(key: key);

  static LayoutData of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(_LayoutScope) as _LayoutScope)
          .layout ??
      _kLayoutData;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context, nullOk: true);
    if (mq == null) {
      return _LayoutScope(layoutData, child);
    }

    return _LayoutScope(
      LayoutData(
        device: findDevice(
          mq.orientation,
          mq.size.width,
        ),
      ),
      child,
    );
  }

  Device findDevice(final currOrientation, final width) {
    const _kMobilePortraitSize = 600;
    const _kMobileLandscapeSize = 960;
    const _kTabletPortraitSize = 960;
    const _kTabletLandscapeSize = 1440;

    if (currOrientation == Orientation.portrait) {
      if (width < _kMobilePortraitSize) {
        return Device.Mobile;
      } else if (width >= _kMobilePortraitSize &&
          width < _kTabletPortraitSize) {
        return Device.Tablet;
      } else {
        return Device.Desktop;
      }
    } else {
      if (width < _kMobileLandscapeSize) {
        return Device.Mobile;
      } else if (width >= _kMobileLandscapeSize &&
          width < _kTabletLandscapeSize) {
        return Device.Tablet;
      } else {
        return Device.Desktop;
      }
    }
  }
}

class _LayoutScope extends InheritedWidget {
  final LayoutData layout;

  _LayoutScope(this.layout, Widget child) : super(child: child);

  @override
  bool updateShouldNotify(_LayoutScope old) {
    return old.layout != layout;
  }
}
