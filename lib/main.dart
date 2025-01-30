import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// DebugWidget wraps around a given widget and paints outlines
/// around the widget and its children to visualize the widget tree.
class DebugWidget extends StatelessWidget {
  final Widget child;
  final Color color;

  /// Constructs a DebugWidget
  /// [child] is the widget to debug, and [color] specifies the outline color (default is red).
  const DebugWidget({
    Key? key,
    required this.child,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _DebugPainter(
      color: color,
      child: child,
    );
  }
}

class _DebugPainter extends SingleChildRenderObjectWidget {
  final Color color;

  const _DebugPainter({
    Key? key,
    required Widget child,
    required this.color,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _DebugRenderObject(color);
  }

  @override
  void updateRenderObject(BuildContext context, covariant _DebugRenderObject renderObject) {
    renderObject.color = color;
  }
}

class _DebugRenderObject extends RenderProxyBox {
  Color color;

  _DebugRenderObject(this.color);

  @override
  void paint(PaintingContext context, Offset offset) {
    // Paint the child widget first
    super.paint(context, offset);

    // Draw outlines around the current widget
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    context.canvas.drawRect(offset & size, paint);
  }
}