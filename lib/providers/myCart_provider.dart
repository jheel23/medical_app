import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/model/test.dart';

class MyCartNotifier extends StateNotifier<Test> {
  MyCartNotifier() : super(Test.initialState());
  final List<Test> _cartList = [];
  List<Test> get cartList => _cartList;

  void addTest(Test test) {
    _cartList.add(test);
    state = Test.initialState();
  }

  void removeTest(Test test) {
    _cartList.remove(test);
    state = Test.initialState();
  }

  int get totalAmount =>
      _cartList.fold(0, (sum, item) => sum + item.testNormalPrice);
  int get totalItems => _cartList.length;
  int get totalAmountAfterDiscount =>
      _cartList.fold(0, (sum, item) => sum + item.testDiscountPrice);
  int get totalDiscount => _cartList.fold(
      0, (sum, item) => sum + (item.testNormalPrice - item.testDiscountPrice));
}

final myCartProvider = StateNotifierProvider<MyCartNotifier, Test>(
  (ref) => MyCartNotifier(),
);
