import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_stop_watch/ui/elapsed_time_text.dart';
import 'package:flutter_stop_watch/ui/elapsed_time_text_basic.dart';
import 'package:flutter_stop_watch/ui/stop_watch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();

    _ticker = this.createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });
    _ticker.start();
    // _timer = Timer.periodic(Duration(microseconds: 50), (timer) {
    //   final now = DateTime.now();
    //   setState(() {
    //     _elapsed = now.difference(_intialTime);
    //   });
    // });
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radouis = constraints.maxWidth / 2;
        return StopWatchRenderer(
          radouis: radouis,
          elapsed: _elapsed,
        );
      },
    );
  }
}
