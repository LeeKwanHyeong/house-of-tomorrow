import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_empty.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_item_tile.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';

import '../../../util/lang/generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartService cartService = context.watch();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cart),
        leading: const PopButton(),
        titleSpacing: 0,
      ),
      body: cartService.cartItemList.isEmpty

          /// Empty
          ? CartEmpty()

          /// Not Empty
          : ListView.builder(
              itemCount: cartService.cartItemList.length,
              itemBuilder: (context, index) {
                final cartItem = cartService.cartItemList[index];
                return CartItemTile(
                  cartItem: cartItem,
                  onPressed: () {
                    cartService.update(
                      index,
                      cartItem.copyWith(
                        isSelected: !cartItem.isSelected,
                      ),
                    );
                  },
                  onCountChanged: (count) {
                    cartService.update(
                      index,
                      cartItem.copyWith(
                        count: count,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
