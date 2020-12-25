import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'productManager_viewmodel.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  int _selectedIndex = 0;
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
        body: GridView.builder(
          itemCount: model.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 10),
          ),
          itemBuilder: (context, int index) {
            var item = model.items[index];
            return Card(
                child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    child: Image.network(item.imgUrl),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                              fontSize: 15),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Text(item.price)
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
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      ],
                    )),
              ],
            ));
          },
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
            model.more();
            // if (id == 1) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ProductView()),
            //   );
            // } else {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => HomeView()),
            //   );
            // }
          },
        ),
      ),
      viewModelBuilder: () => ProducManagerViewModel(),
    );
  }
}
