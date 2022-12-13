import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final data;
  String? categoryName;

  CategoryItems({
    Key? key,
    this.data,
    this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 60,
              child: Image.network(
                "http://157.245.97.144:8000/category/$data",
                width: 80,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${categoryName}",
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  final popularItems;
  const Popular({Key? key, this.popularItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Image.asset(
              popularItems,
              width: 100,
            ),
          ),
          Text(
            "Burger Point",
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          )
        ],
      ),
    );
  }
}

class GroceryItems extends StatelessWidget {
  final allGrocery;
  const GroceryItems({Key? key, this.allGrocery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        height: 250,
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Image.asset(
                  allGrocery,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    Text(
                      "Gerrard Square (Toronto) Store , 1000\nGerrard st E , Toronto,ON M4AM",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text("(4.2)"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
