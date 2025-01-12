import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/src/model/Product.dart';
import 'package:house_of_tomorrow/src/view/base_view.dart';
import 'package:house_of_tomorrow/src/view/product/product_view_model.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_desc.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_layout.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';

import '../../../util/lang/generated/l10n.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProductViewModel(
        product: product,
        cartService: context.read(),
      ),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
            title: Text(
              S.current.product,
            ),
            leading: const PopButton(),
            titleSpacing: 0,
            actions: const [
              CartButton(),
            ]),
        body: ProductLayout(
          productInfo: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Wrap(
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: [
                /// Product Color Preview
                ProductColorPreview(
                  colorIndex: viewModel.colorIndex,
                  product: product,
                ),

                /// ColorPicker
                ColorPicker(
                  colorIndex: viewModel.colorIndex,
                  colorList:
                      product.productColorList.map((e) => e.color).toList(),
                  onColorSelected: viewModel.onColorIndexChanged,
                ),

                /// Product Description
                ProductDesc(product: product),
              ],
            ),
          ),
          productBottomSheet:

              /// Product Bottom Sheet
              ProductBottomSheet(
            count: viewModel.count,
            product: product,
            onCounterChanged: viewModel.onCountChanged,
            onAddToCartPressed: viewModel.onAddToCartPressed,
          ),
        ),
      ),
    );
  }
}
