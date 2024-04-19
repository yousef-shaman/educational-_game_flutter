import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomSpeedDial extends StatelessWidget {
  final List<SpeedDialChild> children;
  final AnimatedIconData? animatedIcon;
  final Color? backgroundColor;
  final Function()? onTap;
  final Widget? child;
  final String? label;

  const CustomSpeedDial({
    super.key,
    this.animatedIcon,
    this.backgroundColor,
    required this.children,
    this.onTap,
    this.child,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      closeManually: false,
      renderOverlay: false,
      animatedIcon: animatedIcon ?? AnimatedIcons.menu_close, // the animatedIcon parameter, with a default value.
      backgroundColor: backgroundColor ?? Colors.white, // Provide a default value.
      spacing: 5,
      spaceBetweenChildren: 10,
      children: children, // the children parameter passed to the widget.
    );
  }
}
