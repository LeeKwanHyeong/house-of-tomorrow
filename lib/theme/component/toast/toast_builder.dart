import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ToastBuilder extends StatefulWidget {
  final String text;
  final Duration animDuration;
  const ToastBuilder({
    super.key,
    required this.text,
    required this.animDuration,
  });

  @override
  State<ToastBuilder> createState() => ToastBuilderState();
}

class ToastBuilderState extends State<ToastBuilder> {
  bool _isShow = false;
  bool get isShow => _isShow;
  set isShow(bool value) => setState(() {
        _isShow = value;
      });
  @override
  Widget build(BuildContext context) {
    final Size screenSized = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSized.height * 0.25,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedOpacity(
          opacity: isShow ? 1 : 0,
          duration: widget.animDuration,
          child: Container(
            decoration: BoxDecoration(
              color: context.color.toastContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: DefaultTextStyle(
                style: context.typo.headline6.copyWith(
                  color: context.color.onToastContainer,
                ),
                child: Text(widget.text)),
          ),
        ),
      ),
    );
  }
}
