import 'package:MiniShop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:MiniShop/ui/views/home/home_view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductView extends StatefulWidget {
  Product product;
  ProductView({Key key, @required this.product}) : super(key: key);
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
                Expanded(flex: 4, child: Image.network(widget.product.imgUrl)),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    width: double.infinity,
                    //color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //const SizedBox(height: 8),
                        Text(
                          widget.product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Text(
                                widget.product.price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 30),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                            ),
                            //const SizedBox(width: 100),
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: SmoothStarRating(
                                    // allowHalfRating: false,
                                    onRated: (v) {},
                                    starCount: 5,
                                    rating: 4,
                                    size: 15.0,
                                    isReadOnly: true,
                                    // fullRatedIconData: Icons.blur_off,
                                    // halfRatedIconData: Icons.blur_on,
                                    color: Colors.orange,
                                    borderColor: Colors.orange,
                                    spacing: 0.0),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Container(
              height: 500,
              width: double.infinity,
              //color: Colors.green,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Description: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.product.description),
                ],
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(null),
            title: Text("Buy"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text("Add to card"),
          ),
        ],
        onTap: (int id) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        },
      ),
    );
  }
}
