// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker({
    super.key,
    required this.seconds,
    required this.radouis,
  });
  final int seconds;
  final double radouis;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey;
    final width = 2.0;
    final hight = 12.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -hight / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radouis - hight / 2),
      child: Container(
        width: width,
        height: hight,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {super.key,
      required this.value,
      required this.maxValue,
      required this.radouis});
  final int value;
  final int maxValue;
  final double radouis;

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const hight = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -hight / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radouis - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        height: hight,
        width: width,
        child: Text(
          value.toString(),
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
