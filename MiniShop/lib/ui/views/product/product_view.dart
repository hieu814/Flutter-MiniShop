import 'package:flutter/material.dart';
import 'package:MiniShop/ui/views/home/home_view.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Card(
          child: ListView(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height - 60 * 2),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Card(
                    //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    //width: double.infinity,
                    //color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 8),
                        Text(
                          'No, we need bold strokes. We need this plan.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 15),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Text("ten san pham")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.green,
          )
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(null),
            title: Text("Add to card"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            title: Text("Add to card"),
          ),
        ],
        onTap: (int id) {
          if (_selectedIndex != id) {
            _selectedIndex = id;
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
          }
        },
      ),
    );
  }
}
