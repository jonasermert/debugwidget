import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayDebugger extends StatelessWidget {
  final Widget child;
  final Color gridColor;
  final double gridSize;

  const OverlayDebugger({
    Key? key,
    required this.child,
    this.gridColor = Colors.grey,
    this.gridSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          child: CustomPaint(
            painter: _GridPainter(gridColor: gridColor, gridSize: gridSize),
          ),
        ),
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color gridColor;
  final double gridSize;

  _GridPainter({required this.gridColor, required this.gridSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 0.5;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}