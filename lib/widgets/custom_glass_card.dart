import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGlassCard extends StatelessWidget {
  final Widget content;
  final double? width;
  final double? height;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomGlassCard({
    super.key,
    required this.content,
    this.width,
    this.height,
    BorderRadiusGeometry? borderRadius,
    this.padding,
    this.margin,
  })  : borderRadius = borderRadius ?? BorderRadius.zero;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius, // this will use the value passed or default to BorderRadius.circular(20)
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          margin: margin,
          padding: padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: borderRadius,
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.3)),
          ),
          child: content,
        ),
      ),
    );
  }
}
