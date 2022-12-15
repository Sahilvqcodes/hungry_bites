import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    return Stack(children: [
      Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                // width: 300,
                child: Image.asset(
                  popularItems,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 10),
            Text(
              "Burger Point",
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),

            Row(
              children: [
                RatingBar.builder(
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize:10,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text("(4.9)",style: TextStyle(fontSize: 10),)
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      Positioned(
          top: 8.0,
          right: 8.0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black87,
              size: 15,
            ),
          ))
    ]);
  }
}

class GroceryItems extends StatelessWidget {
  final allGrocery;

  const GroceryItems({Key? key, this.allGrocery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // height:150,
              //   width: 350,
                child: Image.asset(
              allGrocery,
               fit: BoxFit.fitWidth,
            )),
            SizedBox(height: 10),
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
            SizedBox(height: 20),
          ],
        ),
      ),
        Positioned(
          top: 25.0,
          right: 25.0,
            child: CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xffEF0101),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Upto",style: TextStyle(fontSize: 10.0, fontFamily: 'Poppins',fontWeight: FontWeight.w600),),
                  Text("20%",style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins',fontWeight: FontWeight.w600),),
                  Text("Off",style: TextStyle(fontSize: 10.0, fontFamily: 'Poppins',fontWeight: FontWeight.w600),)
                ],
              ),
        ))
    ],
    );
  }
}
