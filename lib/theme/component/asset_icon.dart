import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class AssetIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const AssetIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? context.color.text,
        BlendMode.srcIn,
      ),
    );
  }
}
