import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class CircularIndicator extends StatelessWidget {
  final Widget child;
  final bool isBusy;

  const CircularIndicator({
    super.key,
    required this.child,
    required this.isBusy,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        /// CircularIndicator
        IgnorePointer(
          ignoring: !isBusy,
          child: AnimatedOpacity(
            opacity: isBusy ? 1 : 0,
            duration: Duration(milliseconds: 222),
            child: Container(
              color: context.color.background,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: context.color.primary,
                value: isBusy ? null : 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
