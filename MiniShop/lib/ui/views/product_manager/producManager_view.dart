import 'package:MiniShop/models/product.dart';
import 'package:MiniShop/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'productManager_viewmodel.dart';
import 'package:MiniShop/component/FormManager.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  int _selectedIndex = 0;
  Product test =
      new Product(id: 1, name: "asasdasd", description: "asdsadasasd");
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (ProducManagerViewModel model) => model.load(),
      builder: (context, ProducManagerViewModel model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Product manager"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Icon(Icons.add),
            ),
            Expanded(
              flex: 7,
              child: GridView.builder(
                itemCount: model.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 10),
                ),
                itemBuilder: (context, int index) {
                  var item = model.items[index];
                  return Card(
                      child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Image.network(item.imgUrl),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            width: double.infinity,
                            //color: Colors.yellow,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 8),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 12),
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.price,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.update),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new FormManager(
                                              type: false,
                                              product: item,
                                              //txtDescription: "asdasad",
                                              returnData: (Product val) {
                                                model.update(val);
                                                Navigator.of(context).pop();
                                              },
                                            ));
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    model.delete(item.id);
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ));
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => new FormManager(
                      type: true,
                      product: test,
                      //txtDescription: "asdasad",
                      returnData: (Product val) {
                        model.add(val);
                        Navigator.of(context).pop();
                      },
                    ));
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text("Emails"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            )
          ],
          onTap: (int id) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
        ),
      ),
      viewModelBuilder: () => ProducManagerViewModel(),
    );
  }

  //in sert update
  @override
  void initState() {
    setState(() {
      _textEditingController.text = "snapshot";
    });
    super.initState();
  }
}
