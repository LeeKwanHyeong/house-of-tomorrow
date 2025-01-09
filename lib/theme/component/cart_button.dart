import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/counter_badge.dart';

import '../../src/service/cart_service.dart';
import '../../util/route_path.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    int count = context.watch<CartService>().cartItemList.length;
    return CounterBadge(
      label: '$count',
      isShow: false,
      child: Button(
          icon: 'basket',
          type: ButtonType.flat,
          onPressed: () {
            Navigator.pushNamed(context, RoutePath.cart);
          }),
    );
  }
}
