import 'package:stacked/stacked.dart';
//import 'home_model.dart';
import 'package:MiniShop/ui/views/product/product_model.dart';

class HomeViewModel extends BaseViewModel {
  List<Product> _listProduct = <Product>[];
  List<Product> get items => _listProduct;
  void load() {
    for (int i = 0; i < 100; i++) {
      _listProduct.add(Product(
          "https://i.stack.imgur.com/Ycfjq.png", "sssádffd " + "$i", "sss $i"));
    }
  }
}
