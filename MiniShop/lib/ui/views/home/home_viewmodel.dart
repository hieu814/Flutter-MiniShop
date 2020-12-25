//import 'dart:developer';

import 'package:stacked/stacked.dart';
//import 'home_model.dart';
import 'package:MiniShop/models/product.dart';
import 'package:MiniShop/services/database_service.dart';

class HomeViewModel extends BaseViewModel {
  List<Product> _listProduct = <Product>[];

  List<Product> get items => _listProduct;
  int cou = 0;
  // final database= DatabaseService.instance;

  Future<void> more() async {
    var db = new DatabaseService.internal();
    await db.insertProduct(Product(
        id: 2,
        name: "Ssd",
        imgUrl:
            "https://giaitri.vn/wp-content/uploads/2019/07/avatar-la-gi-01.jpg",
        price: "2323",
        description: "asdasdasdad"));
    cou++;
    print("tessss");
    notifyListeners();
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
    //db = new DatabaseService();
    //DatabaseService db = new DatabaseService();
    await fetchAndSetWorkouts();
    //notifyListeners();
    //_listProduct = db.products() as List<Product>;
  }
  // db.insertProduct(Product(
  //   id: 1,
  //   name: "Ssd",
  //   imgUrl: "asdasdasd",
  //   price: "2323",
  //   description: "asdasdasdad"));
}
