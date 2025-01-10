import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

import '../resource/layout.dart';

class ConstrainedScreen extends StatelessWidget {
  final Widget child;

  const ConstrainedScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.surface,
      alignment: Alignment.center,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Breakpoints.desktop,
          ),
          child: child,
        ),
      ),
    );
  }
}
