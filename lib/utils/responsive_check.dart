// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  // final Widget tablet;
  final Widget desktop;
  const ResponsiveWidget(
      {required this.mobile,
      required this.desktop});
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 450;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 450;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 450) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
