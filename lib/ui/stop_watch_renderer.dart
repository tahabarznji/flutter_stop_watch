import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_stop_watch/ui/clock_hand.dart';
import 'package:flutter_stop_watch/ui/clock_markers.dart';
import 'package:flutter_stop_watch/ui/elapsed_time_text.dart';
import 'package:flutter_stop_watch/ui/elapsed_time_text_basic.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer(
      {super.key, required this.elapsed, required this.radouis});
  final Duration elapsed;
  final double radouis;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radouis,
            top: radouis,
            child: ClockSecondsTickMarker(seconds: i, radouis: radouis),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            left: radouis,
            top: radouis,
            child: ClockTextMarker(value: i, maxValue: 60, radouis: radouis),
          ),
        Positioned(
          left: radouis,
          top: radouis,
          child: ClockHand(
            handLength: radouis,
            handThikness: 2,
            roationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        Positioned(
          top: radouis * 1.3,
          left: 0,
          right: 0,
          child: ElapsedTimeText(elapsed: elapsed),
        ),
      ],
    );
  }
}
