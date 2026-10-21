import 'package:flutter/material.dart';

/// Responsive layout wrapper: 360dp'de tasmaz, buyuk ekranda max 600dp ortalar.
class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  const ResponsiveLayout({
    super.key,
    required this.child,
    this.maxWidth = 600.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padding != null
            ? Padding(padding: padding!, child: child)
            : child,
      ),
    );
  }
}
