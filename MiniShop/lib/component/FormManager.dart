import 'package:MiniShop/models/product.dart';
import 'package:flutter/material.dart';

class FormManager extends StatefulWidget {
  final Product product;
  final bool type;
  final Function(Product) returnData;

  const FormManager(
      {Key key, @required this.type, this.product, this.returnData})
      : super(key: key);

  @override
  _FormManagerState createState() => _FormManagerState();
}

class _FormManagerState extends State<FormManager> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController imgUrlController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    if (!widget.type) {
      nameController.text = widget.product.name;
      imgUrlController.text = widget.product.imgUrl;
      priceController.text = widget.product.price;
      descriptionController.text = widget.product.description;
      print(widget.product.imgUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(widget.type ? "Add new product" : "Update product"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name", labelText: "Name"),
              maxLines: null,
            ),
            TextField(
              controller: imgUrlController,
              decoration: InputDecoration(
                  hintText: "Image Url", labelText: "Image Url"),
              maxLines: null,
            ),
            TextField(
              controller: priceController,
              decoration:
                  InputDecoration(hintText: "Price", labelText: "Price"),
              //maxLines: null,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: "Description", labelText: "Description"),
              maxLines: null,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
            child: Text(widget.type ? 'Add' : 'Save'),
            color: Colors.blue,
            onPressed: () {
              Product temp = new Product(
                  id: widget.product.id,
                  name: nameController.text,
                  imgUrl: imgUrlController.text,
                  price: priceController.text,
                  description: descriptionController.text);
              widget.returnData(temp);
            })
      ],
    );
  }
}
