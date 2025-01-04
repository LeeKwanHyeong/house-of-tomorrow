import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

import '../../service/theme_service.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.shopping),
      ),
      body: Center(
        child: TextButton(
          onPressed: context.read<ThemeService>().toggleTheme,
          child: Text(
            'Toggle Theme',
            style: context.typo.headline6,
          ),
        ),
      ),
    );
  }
}
