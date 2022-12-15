import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hunger_bites/User/screens/all_items.dart';
import 'package:hunger_bites/User/screens/category_shop_list.dart';
import 'package:hunger_bites/User/screens/drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

import '../../../model/category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  List category = [
    {'image': 'assets/images/Vector.png'},
    {'image': 'assets/images/Vector1.png'},
    {'image': 'assets/images/Vector1.png'},
    {'image': 'assets/images/Vector1.png'},
  ];
  List populatItem = [
    {'image': 'assets/images/Rectangle18.png'},
    {'image': 'assets/images/Rectangle18.png'},
    {'image': 'assets/images/Rectangle18.png'},
    {'image': 'assets/images/Rectangle18.png'},
  ];
  List grocery = [
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle30.png'
    },
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle30.png'
    },
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle30.png'
    },
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle30.png'
    },
  ];
  List offerImages = [
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle17.png'
    },
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle17.png'
    },
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle17.png'
    },
    {
      'name': 'Enjoy your favourite treats',
      'image': 'assets/images/Rectangle17.png'
    },
  ];

  final TextEditingController _controller = TextEditingController();

  getCategoryList() async {
    String url = 'http://157.245.97.144:8000/find-category';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    String json = response.body;
    print(response.body);
    CategoryList _categoryList =
        CategoryList.fromJson(jsonDecode(response.body));

    print(_categoryList);

    return _categoryList;
  }

  List restaurantImage = [
    {'image': 'assets/images/Vector.png'},
    {'image': 'assets/images/Vector1.png'},
    {'image': 'assets/images/Vector1.png'},
    {'image': 'assets/images/Vector1.png'},
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: UserDrawer(),
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 25,
                color: Colors.black,
              ),
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: Icon(Icons.notification_add_outlined),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.sort,
              size: 35,
              color: Colors.black,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ), //AppBar

        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Provide You",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontFamily: 'Poppins'),
              ),
              Row(
                children: [
                  Text(
                    "Fresh",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        color: Color(0xffED4322)),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    "and best",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 30),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    "Food",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        color: Color(0xffED4322)),
                  ),
                ],
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
                      controller: _controller,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  TextButton(
                    onPressed: () {
                     // Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          color: Color(0xffAEACBA)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              FutureBuilder(
                  future: getCategoryList(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    CategoryList? _categoryList = snapshot.data;
                    if (snapshot.data == null) {
                      return Container();
                    }
                    print(_categoryList!.data?.length);
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            _categoryList.data?.length ?? 0,
                            (index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/category_shop_list',
                                    arguments: restaurantImage);
                              },
                              child: Container(
                                child: CategoryItems(
                                  data: _categoryList.data?[index].profile,
                                  categoryName: _categoryList.data![index].name,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 5),
                        //enlargeCenterPage: false,
                        onPageChanged: (i, r) {
                          setState(() {
                            _current = i;
                          });
                        }),
                    items: [1, 2, 3, 4, 5]
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.all(5.0),
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/Rectangle17.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Positioned(
                    left: 20,
                    top: 140,
                    child: Container(


                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      child: AnimatedSmoothIndicator(
                        activeIndex: _current,
                        count: 5,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color.fromRGBO(0, 0, 0, 0.9),
                            dotColor: Colors.white,
                            dotWidth: 4,
                            dotHeight: 8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Item",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/super_market');
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                          color: Color(0xffAEACBA)),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        populatItem.length,
                        (index) => Popular(
                              popularItems: populatItem[index]['image'],
                            )),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Convenience, Grocery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        grocery.length,
                        (index) => GroceryItems(
                              allGrocery: grocery[index]['image'],
                            )),
                  )),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 200,
                        // width: 300,
                        child: Image.asset(
                          'assets/images/Rectangle30.png',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Fantastic food and\n where to find them!",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 26,
                            color: Color(0xffE88B00)),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/category_shop_list",
                            arguments: restaurantImage);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 10.0, right: 5),
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffAEACBA)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Explore more",
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.red,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    "Live",
                    style: TextStyle(
                        fontSize: 49,
                        fontFamily: 'Poppins',
                        color: Color(0xffAEAEAE)),
                  ),
                  Text(
                    "It up!",
                    style: TextStyle(
                        fontSize: 49,
                        fontFamily: 'Poppins',
                        color: Color(0xffAEAEAE)),
                  )
                ],
              ),
              Container(
                height: 200,
              )
            ]),
          ),
        ));
  }
}
