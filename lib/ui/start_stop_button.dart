import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({super.key, required this.isRuning, this.onPressed});
  final bool isRuning;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: isRuning ? Colors.red[900] : Colors.green[900],
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text('Reset'),
          ),
        ),
      ),
    );
  }
}
