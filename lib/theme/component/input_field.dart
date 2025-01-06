import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

import 'button/button.dart';

class InputField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;

  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          widget.onChanged?.call(value);
        });
      },
      onSubmitted: widget.onSubmitted,
      style: context.typo.headline5,
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        /// Border 테두리 제거
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: context.color.hintContainer,
        hintText: widget.hint,
        hintStyle: context.typo.headline5.copyWith(
          fontWeight: context.typo.light,
          color: context.color.onHintContainer,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 11.5,
          horizontal: 16,
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : Button(
                icon: 'close',
                type: ButtonType.flat,
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onClear?.call();
                  });
                },
              ),
      ),
    );
  }
}
