import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/theme/resource/layout.dart';

class ProductLayout extends StatelessWidget {
  final Widget productInfo;
  final Widget productBottomSheet;

  const ProductLayout({
    super.key,
    required this.productInfo,
    required this.productBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return context.layout(
      /// Mobile & Tablet
      Column(
        children: [
          Expanded(
            child: productInfo,
          ),
          productBottomSheet,
        ],
      ),

      /// Desktop
      desktop: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: productInfo,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                ),
                child: productBottomSheet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
