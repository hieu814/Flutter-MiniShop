import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:MiniShop/ui/views/product/product_view.dart';

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
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("loggin vs lis"),
                decoration: BoxDecoration(color: Colors.red),
              ),
              ListTile(
                title: Text("chuc nang 1"),
              ),
              ListTile(
                title: Text("chuc nang 2"),
              ),
              ListTile(
                title: Text("chuc nang 3"),
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
                child: Column(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.green,
                    child: Image.network(item.url),
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
            if (id == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductView()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              );
            }
          },
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
