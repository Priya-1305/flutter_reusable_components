import 'package:flutter/widgets.dart';

enum Breakpoint { mobile, tablet, desktop }

class Responsive {
  static Breakpoint of(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w >= 1024) return Breakpoint.desktop;
    if (w >= 600) return Breakpoint.tablet;
    return Breakpoint.mobile;
  }
}

class ResponsiveBox extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  const ResponsiveBox({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    switch (Responsive.of(context)) {
      case Breakpoint.desktop:
        return desktop ?? tablet ?? mobile;
      case Breakpoint.tablet:
        return tablet ?? mobile;
      case Breakpoint.mobile:
        return mobile;
    }
  }
}
