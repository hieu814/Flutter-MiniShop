import 'package:stacked/stacked.dart';
//import 'home_model.dart';
import 'package:MiniShop/models/product.dart';
import 'package:MiniShop/services/database_service.dart';

class HomeViewModel extends BaseViewModel {
  List<Product> _listProduct = <Product>[];
  List<Product> get items => _listProduct;
  // final database= DatabaseService.instance;

  void more() {
    _listProduct.add(Product(
        id: 1,
        name: "Ssd",
        imgUrl: "asdasdasd",
        price: "2323",
        description: "asdasdasdad"));
    //notifyListeners();
    // db.insertProduct(Product(
    //     id: 1,
    //     name: "Ssd",
    //     imgUrl: "asdasdasd",
    //     price: "2323",
    //     description: "asdasdasdad"));
  }

  void load2() {}
  Future load() async {
    var db = new DatabaseService();
    db.insertProduct(Product(
        id: 1,
        name: "Ssd",
        imgUrl: "asdasdasd",
        price: "2323",
        description: "asdasdasdad"));
    _listProduct = await db.products();
    _listProduct.add(Product(
        id: 1,
        name: "Ssd",
        imgUrl: "asdasdasd",
        price: "2323",
        description: "asdasdasdad"));
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
