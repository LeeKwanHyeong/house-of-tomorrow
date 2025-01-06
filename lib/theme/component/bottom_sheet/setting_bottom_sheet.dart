import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/tile.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

import '../../../src/service/theme_service.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = context.theme.brightness == Brightness.light;
    final LangService langService = context.watch();

    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Theme Tile
          Tile(
            icon: isLightTheme ? 'sunny' : 'moon',
            title: S.current.theme,
            subTitle: isLightTheme ? S.current.light : S.current.dark,
            onPressed: context.read<ThemeService>().toggleTheme,
          ),

          /// Lang Tile
          Tile(
            icon: 'language',
            title: S.current.language,
            subTitle: IntlHelper.isKo ? S.current.ko : S.current.en,
            onPressed: langService.toggleLang,
          ),
        ],
      ),
    );
  }
}
