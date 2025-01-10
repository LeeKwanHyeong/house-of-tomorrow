import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/resource/layout.dart';

class CartLayout extends StatelessWidget {
  final Widget cartItemList;
  final Widget cartBottomSheet;

  const CartLayout({
    super.key,
    required this.cartItemList,
    required this.cartBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return context.layout(
      Column(
        children: [
          Expanded(child: cartItemList),
          cartBottomSheet,
        ],
      ),

      /// Desktop
      desktop: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.color.surface,
                    boxShadow: context.deco.shadow,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: cartItemList),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: cartBottomSheet,
            ),
          ],
        ),
      ),
    );
  }
}
