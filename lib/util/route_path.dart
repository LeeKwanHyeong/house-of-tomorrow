import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/Product.dart';
import 'package:house_of_tomorrow/src/view/cart/cart_view.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view.dart';
import 'package:house_of_tomorrow/theme/component/constrained_screen.dart';

import '../src/view/product/product_view.dart';

abstract class RoutePath {
  static const String shopping = 'shopping';
  static const String product = 'product';
  static const String cart = 'cart';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.shopping:
        page = const ShoppingView();
        break;
      case RoutePath.product:
        Product product = settings.arguments as Product;
        page = ProductView(product: product);
        break;
      case RoutePath.cart:
        page = CartView();
        break;
    }

    return MaterialPageRoute(
      builder: (context) => ConstrainedScreen(
        child: page,
      ),
    );
  }
}
