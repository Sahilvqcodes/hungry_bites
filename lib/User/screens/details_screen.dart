import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int current = 0;
  int _counter = 0;
  bool isFavorite = false;

  // int simpleIntInput = 0;
  increment() {
    setState(() {
      _counter++;
    });
  }

  decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Container(
          height: 40,
          child: Image.asset(
            "assets/images/Rectangle45.png",
          ),
        ),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,


                      viewportFraction: 1,
                      autoPlayInterval: Duration( seconds:5),
                        //enlargeCenterPage: false,
                        onPageChanged: (i, r) {
                      setState(() {
                        current = i;
                      });
                    }),
                    items: [1, 2, 3, 4, 5]
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.all(5.0),
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/Rectangle35.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      child: AnimatedSmoothIndicator(
                        activeIndex: current,
                        count: 5,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color.fromRGBO(0, 0, 0, 0.9),
                            dotWidth: 5,
                            dotHeight: 8),
                      ),
                    ),
                  ),
                  Text(
                    "Major Tom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff818181),
                        size: 16,
                      ),
                      Text(
                        "Langdon Drive,Cambridge , Ont",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff818181),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Open All Days",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffED4322)),
                  ),
                  SizedBox(height: 20),

                ],
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffED4322),
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                    Text("In Your Cart",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      width: 100,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffAEACBA),
                      child: Text(
                        "4",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          //  SizedBox(height: 10),
            ...List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  tileColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(left: 5.0, right: 5.0),
                  leading: Image.asset(
                    "assets/images/Rectangle36.png",
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shahi Paneer\n14"),
                      InkWell(
                          onTap: () {
                            isFavorite = !isFavorite;
                            setState(() {});
                          },
                          child: isFavorite
                              ? Icon(
                                  Icons.favorite,size: 12,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border_outlined,size: 12,)),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize:15,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Container(
                        height: 20,
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: decrement(),
                              child: CircleAvatar(
                                  backgroundColor: Color(0xffAEACBA),
                                  radius: 10,
                                  child: Icon(
                                    Icons.remove,
                                    size: 12,
                                    color: Colors.red,
                                  )),
                            ),
                            Text("$_counter"),
                            InkWell(
                              onTap: increment(),
                              child: CircleAvatar(
                                  backgroundColor: Color(0xffAEACBA),
                                  radius: 10,
                                  child: Icon(
                                    Icons.add,
                                    size: 12,
                                    color: Colors.red,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
