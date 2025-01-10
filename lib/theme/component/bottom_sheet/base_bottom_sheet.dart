import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class BaseBottomSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool? isRoundAll;

  const BaseBottomSheet({
    super.key,
    required this.child,
    this.padding,
    this.isRoundAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: isRoundAll ?? false
            ? BorderRadius.circular(24)
            : BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
        boxShadow: context.deco.shadow,
      ),
      padding: padding ??
          EdgeInsets.only(
            top: 32,
            bottom: 16,
          ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
