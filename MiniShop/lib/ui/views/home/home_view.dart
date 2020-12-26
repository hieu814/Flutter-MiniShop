import 'package:MiniShop/ui/views/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:MiniShop/ui/views/product_manager/producManager_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (HomeViewModel model) => model.load(),
      builder: (context, HomeViewModel model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductManager()),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Hieu"),
                accountEmail: Text("Hieuvu81198@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
              ),
              ListTile(
                title: ButtonBar(),
              ),
              ListTile(
                title: Text("Product"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductManager()),
                  );
                },
              ),
            ],
          ),
        ),
        body: GridView.builder(
          itemCount: model.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.4),
          ),
          itemBuilder: (context, int index) {
            var item = model.items[index];
            return Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductView(
                              product: model.items[index],
                            )),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.green,
                        child: Image.network(item.imgUrl),
                      ),
                    ),
                    Expanded(
                      flex: 3,
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
                  ],
                ),
              ),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
