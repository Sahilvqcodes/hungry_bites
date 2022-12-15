import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isReadmore = false;
  int current = 0;
  int _counter = 0;
  bool isFavorite = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          //scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 5),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: 50,
                  child: TextField(
                    cursorColor: Color(0xffED4322),
                   // controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black87, width: 12.0),
                          borderRadius: BorderRadius.circular(0.0)),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black87, width: 1.0),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      filled: true,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xffED4322),
                      ),
                      hintText: 'Search Here',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        size: 40,
                        color: Color(0xffED4322),
                      )),
                ),
              ],
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
            SizedBox(height: 10),
            SizedBox(
              // height: size.height - 50,
              child: ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/details_page');
                      },
                      child: Stack(children: [
                        Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            padding: EdgeInsets.all(0),
                            child: Row(children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 50),
                                      Text(
                                        "Shahi Paneer",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,
                                            fontFamily: "Poppins"),
                                      ),
                                      SizedBox(height: 2.0),
                                      Text(
                                        "\$14",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                            fontFamily: "Poppins",
                                            color: Color(0xffED4322)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                        RatingBar.builder(

                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },

                                      ),
                                          Text("(3.9)")
                                        ],
                                      ),
                                      SizedBox(height:5.0),
                                      buildText(
                                          "We are a small craft, tea brewery in the Drumbo hills, overlooking the"
                                              " city of Belfast, Northern Ireland. We want to help people discover"
                                              " the magic of tea by sourcing great "
                                              "loose leaf tea and brewing delicious kombucha and"
                                              " other innovative, healthy tea drinks."),



                                    ],
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Card(
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Rectangle35.png'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Positioned(
                          top: 160,
                          left: 190,
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: _decrementCounter,
                                      icon: Icon(
                                        Icons.remove,
                                        color: Color(0xffED4322),
                                      )),
                                  Text('$_counter',
                                      style: TextStyle(
                                        color: Color(0xffED4322),
                                      )),
                                  IconButton(
                                      onPressed: _incrementCounter,
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xffED4322),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                    );
                  }),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget buildText(String text) {
    final lines = isReadmore ? null:3;




    return Column(
      children: [
         Text(
          text,
          style: TextStyle(fontSize: 5),
          maxLines: lines,
          overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                isReadmore = !isReadmore;
              });
            },
            child: Text(
              (isReadmore ? 'less' : 'more'),style: TextStyle(fontSize:8),)),

      ],
    );
    // return Text(
    //   text,
    //   style: TextStyle(fontSize: 5),
    //   maxLines: lines,
    //   overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    // );
  }
}
