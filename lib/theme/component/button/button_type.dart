part of 'button.dart';

/// Button Type
enum ButtonType {
  fill,
  flat,
  outline;

  /// Text & Icon Color
  Color getColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.onInactiveContainer
            : color ?? context.color.onPrimary;
      case ButtonType.flat:
      case ButtonType.outline:
        return isInactive
            ? context.color.inactive
            : color ?? context.color.primary;
    }
  }

  /// Background Color
  Color getBackgroundColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.inactiveContainer
            : color ?? context.color.primary;
      case ButtonType.flat:
      case ButtonType.outline:
        return color ?? Colors.transparent;
    }
  }

  /// Border
  Border? getBorder(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
            color: getColor(
          context,
          isInactive,
          color,
        ));
    }
  }
}
