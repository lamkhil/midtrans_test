import 'package:flutter/material.dart';
import 'package:midtrans_test/app/global/constant/gradient.dart';

class BackgroundApps extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final Color? color;
  BackgroundApps(
      {super.key,
      required this.child,
      this.gradient = GradientsApp.primary,
      this.color})
      : assert(
            (child is Scaffold
                ? (child.backgroundColor == Colors.transparent)
                : false),
            "if use scaffold, backgroundColor must be transparent");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: color == null ? gradient : null, color: color),
      child: child,
    );
  }
}
