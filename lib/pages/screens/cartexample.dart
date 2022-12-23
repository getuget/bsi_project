import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart {
  final String dateId;
  final String title;
  final int quantity;
  final double price;

  Cart(
      {required this.dateId,
      required this.title,
      required this.quantity,
      required this.price});
}

final cartProvider = StateNotifierProvider<CartNotifier, Map<String, Cart>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<Map<String, Cart>> {
  CartNotifier() : super({});

  int cartLength() {
    return state.length;
  }

  void add(String productId, double price, String title) {
    if (!state.containsKey(productId)) {
      Map<String, Cart> cartMap = {
        productId:
            Cart(dateId: 'dateId', title: title, quantity: 1, price: price),
      };
      state = {...state, ...cartMap};
    } else {
      state.update(
          productId,
          (existing) => Cart(
                dateId: existing.dateId,
                title: existing.title,
                quantity: existing.quantity + 1,
                price: existing.price,
              ));
    }
  }
}
