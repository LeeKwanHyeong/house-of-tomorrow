import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';

import '../../model/Product.dart';

class ShoppingViewModel extends BaseViewModel {
  List<Product> productList = [];

  TextEditingController textController = TextEditingController();

  final ProductRepository productRepository = ProductRepository();

  String get keyword => textController.text.trim();

  Future<void> searchProductList() async {
    isLoading = true;
    final result = await Future.wait([
      productRepository.searchProductList(keyword),
      Future.delayed(const Duration(milliseconds: 555))
    ]);
    productList = result.first;
    isLoading = false;
  }
}
