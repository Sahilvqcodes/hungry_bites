import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hunger_bites/Admin/models/add_items_model.dart';
import 'package:hunger_bites/User/screens/all_items.dart';
import 'package:hunger_bites/User/screens/category_shop_list.dart';
import 'package:hunger_bites/User/screens/drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

import '../../../model/category_list.dart';
import '../hot_offers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  bool? _check = false;
  bool? _checked = false;
  int _current = 0;
  String? dropdownvalue = 'items';

  var items = [
    'Restaurant',
    'Supermarket',
  ];

  List populatItem = [
    {'image': 'assets/image/img.png', 'name': 'Garam Dharam'},
    {'image': 'assets/image/img1.png', 'name': 'Haveli'},
    {'image': 'assets/image/img2.png', 'name': 'G.N Dairy'},
    {'image': 'assets/image/img.png', 'name': 'KFC'},
  ];
  List Offers = [
    {
      'image': 'assets/image/offers1.png',
      'name': 'The Biryani Life',
      'offer': '10',
    },
    {
      'image': 'assets/image/offers2.png',
      'name': 'Katani Dhaba',
      'offer': '40',
    },
    {
      'image': 'assets/image/offers3.png',
      'name': 'Captains Pizza',
      'offer': '20',
    },
    {
      'image': 'assets/image/offers1.png',
      'name': "Domino's Pizza",
      'offer': '30',
    },
  ];
  List grocery = [
    {
      'name': 'Vishal Mega Mart',
      'image': 'assets/image/banners.png',
      'address': '3B2, Phase 5,Mohali,Punajb'
    },
    {
      'name': 'Big Bazaar',
      'image': 'assets/images/Rectangle35.png',
      'address': 'sector 22,Chandigarh'
    },
    {
      'name': 'D Mart',
      'image': 'assets/images/Rectangle30.png',
      'address': 'Near Mandi,Mohali,Punajb'
    },
    {
      'name': 'Relience Super Mart',
      'image': 'assets/images/Rectangle30.png',
      'address': 'sector 74,phase 8b,Mohali,Punajb'
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
  List<Color> categoryColor = [
    Color(0xFFFFAE8DD),
    Color(0xFFFF7F1DE),
    Color(0xFFFFCEAEA)
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
  CategoryList? _categoryList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: UserDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            onPressed: () {
              Navigator.pushNamed(context, "/user_notification");
            },
          ),
        ],
        // backgroundColor: Colors.white,/
        leading: IconButton(
          icon: const Icon(
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
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 5.0, top: 5.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // RichText(
            //   text: const TextSpan(
            //       text: "Provide You",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w700,
            //           fontSize: 30,
            //           color: Color(0xff03060F),
            //           fontFamily: 'Poppins'),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: "\nFresh",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 30,
            //               fontFamily: 'Poppins',
            //               color: Color(0xffED4322)),
            //         ),
            //         TextSpan(
            //           text: " and best",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               color: Color(0xff03060F),
            //               fontFamily: 'Poppins',
            //               fontSize: 30),
            //         ),
            //         TextSpan(
            //           text: " Food",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 30,
            //               fontFamily: 'Poppins',
            //               color: Color(0xffED4322)),
            //         )
            //       ]),
            // ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.34,
                  height: 50,
                  child: TextField(
                    cursorColor: Color(0xffED4322),
                    controller: controller,
                    //textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior
                          .never, //Hides label on focus or if filled

                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Color(0xffAEACBA)),
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xffED4322),
                        size: 30,
                      ),
                      hintText: 'Search for restaurant, item or more',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xffED4322),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          size: 35,
                          color: Colors.white,
                        )),
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
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment_options');
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
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
                  _categoryList = snapshot.data;
                  if (snapshot.data == null) {
                    return Container();
                  }
                  print(_categoryList!.data?.length);
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          _categoryList!.data?.length ?? 0,
                          (index) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/category_shop_list',
                                arguments: [
                                  _categoryList!.data![index].name,
                                  _categoryList!.data![index].sId
                                ],
                              );
                            },
                            child: CategoryItems(
                              data: _categoryList!.data?[index].profile,
                              categoryName: _categoryList!.data![index].name,
                              categoryColor: categoryColor[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //       autoPlay: true,
            //       viewportFraction: 1,
            //       autoPlayInterval: Duration(seconds: 5),
            //       //enlargeCenterPage: false,
            //       onPageChanged: (i, r) {
            //         setState(() {
            //           _current = i;
            //         });
            //       }),
            //   items: [1, 2, 3, 4, 5]
            //       .map(
            //         (e) => Container(
            //           margin: EdgeInsets.all(5.0),
            //           height: 250,
            //           width: MediaQuery.of(context).size.width,
            //           child: Image.asset(
            //             'assets/images/Rectangle17.png',
            //             fit: BoxFit.contain,
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
            // Center(
            //   child: AnimatedSmoothIndicator(
            //     activeIndex: _current,
            //     count: 5,
            //     effect: ExpandingDotsEffect(
            //         activeDotColor: Color.fromRGBO(0, 0, 0, 0.9),
            //         dotColor: Colors.grey,
            //         dotWidth: 4,
            //         dotHeight: 8),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Popular Item",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/super_market');
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
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
                            popularItems: populatItem[index],
                          )),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Hot Offers",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/super_market');
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Color(0xffAEACBA)),
                  ),
                )
              ],
            ),

            // CarouselSlider(
            //   options: CarouselOptions(
            //     // height: 400,

            //     // aspectRatio: 16 / 9,
            //     // viewportFraction: 0.8,
            //     initialPage: 0,
            //     enableInfiniteScroll: true,
            //     reverse: false,
            //     autoPlay: true,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     enlargeCenterPage: true,
            //     // enlargeFactor: 0.3,
            //     // onPageChanged: callbackFunction,
            //     scrollDirection: Axis.horizontal,
            //   ),
            //   items: populatItem
            //       .map(
            //         (e) => Container(
            //           child: Popular(
            //             popularItems: e["image"],
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      populatItem.length,
                      (index) => HotOffers(
                            Items: Offers[index],
                          )),
                )),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Convenience, Grocery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      grocery.length,
                      (index) => GroceryItems(
                            allGrocery: grocery[index],
                          )),
                )),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/category_shop_list",
                  arguments: [
                    _categoryList!.data![0].name,
                    _categoryList!.data![0].sId
                  ],
                );
              },
              child: Card(
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
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Fantastic food and\n where to find them!",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 26,
                          color: Color(0xffE88B00),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/category_shop_list",
                          arguments: [
                            _categoryList!.data![0].name,
                            _categoryList!.data![0].sId
                          ],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 10.0, right: 5),
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xffE88B00),
                            border: Border.all(color: Color(0xffAEACBA)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Explore more",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFE1E1E1),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: Color(0xffE88B00),
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
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/category_shop_list",
                  arguments: [
                    _categoryList!.data![1].name,
                    _categoryList!.data![1].sId
                  ],
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 200,
                        // width: 300,
                        child: Image.asset(
                          'assets/images/banner1.png',
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Natural and Organic\n Homemade Foods",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 26,
                          color: Color(0xff29B306),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/category_shop_list",
                          arguments: [
                            _categoryList!.data![1].name,
                            _categoryList!.data![1].sId
                          ],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 10.0, right: 5),
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xff29B306),
                            border: Border.all(color: Color(0xffAEACBA)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Explore more",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFE1E1E1),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: Color(0xff29B306),
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
            ),

            // Column(
            //   children: [
            //     Text(
            //       "Live",
            //       style: TextStyle(
            //           fontSize: 49,
            //           fontFamily: 'Poppins',
            //           color: Color(0xffAEAEAE)),
            //     ),
            //     Text(
            //       "It up!",
            //       style: TextStyle(
            //           fontSize: 49,
            //           fontFamily: 'Poppins',
            //           color: Color(0xffAEAEAE)),
            //     )
            //   ],
            // ),
            Container(
              height: 100,
            )
          ]),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
