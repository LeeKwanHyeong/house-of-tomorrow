import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/theme/dark_theme.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/theme/light_theme.dart';
import 'package:house_of_tomorrow/theme/resource/layout.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? theme,
  }) : theme = theme ?? LightTheme();

  /// 현재 테마
  AppTheme theme;

  /// 테마 변경
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }

  /// Material ThemeData Customization
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.typo.headline2.copyWith(
          color: theme.color.text,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          constraints: BoxConstraints(
            maxWidth: Breakpoints.bottomSheet,
          )),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppTypo get typo => theme.typo;
}
