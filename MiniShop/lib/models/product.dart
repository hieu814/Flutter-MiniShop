class Product {
  String imgUrl, name, price, description;
  int id;
  Product({this.id, this.name, this.imgUrl, this.price, this.description});

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'name': name,
      'imgUrl': imgUrl,
      'price': price,
      'description': description,
    };
  }
}
