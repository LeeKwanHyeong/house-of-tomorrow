import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

import '../../../theme/component/toast/toast.dart';
import '../../../util/lang/generated/l10n.dart';
import '../../service/cart_service.dart';

class CartViewModel extends BaseViewModel {
  final CartService cartService;

  CartViewModel({
    required this.cartService,
  }) {
    cartService.addListener(notifyListeners);
  }

  /// 선택한 CartItem 삭제
  void onDeletePressed() {
    cartService.delete(cartService.selectedCartItemList);
    Toast.show(S.current.checkoutDialogSuccessToast);
  }

  /// 선택한 CartItem 목록
  List<CartItem> get selectedCartItemList => cartService.selectedCartItemList;

  /// 전체 CartItem
  List<CartItem> get cartItemList => cartService.cartItemList;

  /// 최종 가격
  String get totalPrice {
    return cartService.selectedCartItemList.isEmpty
        ? '0'
        : IntlHelper.currency(
            symbol: cartService.selectedCartItemList.first.product.priceUnit,
            number: cartService.selectedCartItemList.fold(
              0,
              (prev, curr) {
                return prev + curr.count * curr.product.price;
              },
            ),
          );
  }

  /// CartItem 클릭
  void onCartItemPressed(int index) {
    final cartItem = cartItemList[index];
    cartService.update(
      index,
      cartItem.copyWith(
        isSelected: !cartItem.isSelected,
      ),
    );
  }

  /// CartItem 개수 변경
  void onCountChanged(int index, int count) {
    final cartItem = cartItemList[index];
    cartService.update(
      index,
      cartItem.copyWith(
        count: count,
      ),
    );
  }

  /// 선택한 CartItem 결제
  void onCheckoutPressed() {
    cartService.delete(cartService.selectedCartItemList);
    Toast.show(S.current.checkoutDialogSuccessToast);
  }

  @override
  void dispose() {
    cartService.removeListener(notifyListeners);
    super.dispose();
  }
}
