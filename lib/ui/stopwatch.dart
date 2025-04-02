import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_stop_watch/ui/reset_button.dart';
import 'package:flutter_stop_watch/ui/start_stop_button.dart';

import 'package:flutter_stop_watch/ui/stop_watch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _prevoislyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration get _elapsed => _prevoislyElapsed + _currentlyElapsed;
  bool isRuning = false;

  @override
  void initState() {
    super.initState();

    _ticker = this.createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });

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

  void _toggleRuning() {
    setState(() {
      isRuning = !isRuning;
      if (isRuning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _prevoislyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void reset() {
    setState(() {
      isRuning = false;
      _prevoislyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radouis = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopWatchRenderer(elapsed: _elapsed, radouis: radouis),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRuning: isRuning,
                  onPressed: _toggleRuning,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
