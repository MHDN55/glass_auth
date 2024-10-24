// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBoxWidget extends StatelessWidget {
  GlassBoxWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget child;

  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(12);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: _borderRadius,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
