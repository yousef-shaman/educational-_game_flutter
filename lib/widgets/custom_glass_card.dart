import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGlassCard extends StatelessWidget {
  final Widget content;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CustomGlassCard({super.key, required this.content, this.width, this.height, this.borderRadius = 20, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          margin: margin,
          padding: padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(width: 2, color: Colors.black12),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.white38.withOpacity(0.5),
            //     blurRadius: 5,
            //     spreadRadius: -5,
            //   )
            // ],
          ),
          child: content,
        ),
      ),
    );
  }
}
