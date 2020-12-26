//import 'dart:developer';

import 'package:stacked/stacked.dart';
//import 'home_model.dart';
import 'package:MiniShop/models/product.dart';
import 'package:MiniShop/services/database_service.dart';

class ProducManagerViewModel extends BaseViewModel {
  List<Product> _listProduct = <Product>[];

  List<Product> get items => _listProduct;
  int cou = 0;
  // final database= DatabaseService.instance;

  Future<void> add(Product p) async {
    var db = new DatabaseService.internal();
    await db.insertProduct(p);
    // notifyListeners();
    await fetchAndSetWorkouts();
  }

  Future<void> delete(int id) async {
    var db = new DatabaseService.internal();
    await db.deleteProduct(id);
    //notifyListeners();
    await fetchAndSetWorkouts();
  }

  Future<void> update(Product p) async {
    var db = new DatabaseService.internal();
    await db.updateProduct(p);
    //notifyListeners();
    await fetchAndSetWorkouts();
  }

  Future<void> fetchAndSetWorkouts() async {
    var db = new DatabaseService.internal();
    final dataList = await db.products();

    _listProduct = dataList
        .map(
          (item) => Product(
              id: item.id,
              name: item.name,
              imgUrl: item.imgUrl,
              price: item.price,
              description: item.description),
        )
        .toList();

    notifyListeners();
  }

  Future load() async {
    await fetchAndSetWorkouts();
  }
}
