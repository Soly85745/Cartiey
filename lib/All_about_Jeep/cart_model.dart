import 'items_model.dart';

class Cart {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<AutoSpareParts> _items = [];

  List<AutoSpareParts> get items => _items;

  void addItem(AutoSpareParts item) {
    _items.add(item);
  }
}

final cart = Cart();
