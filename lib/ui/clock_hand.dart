import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({
    super.key,
    required this.handLength,
    required this.handThikness,
    required this.roationZAngle,
    required this.color,
  });
  final double roationZAngle;
  final double handThikness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThikness / 2, 0.0, 0.0)
        ..rotateZ(roationZAngle),
      child: Container(
        height: handLength,
        width: handThikness,
        color: color,
      ),
    );
  }
}
