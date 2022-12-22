import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hunger_bites/Admin/models/available_items.dart';
import 'package:hunger_bites/User/Apis/allApi.dart';
import 'package:readmore/readmore.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

AvailableItems? _availableItems;

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
    final args = ModalRoute.of(context)!.settings.arguments as String;
    String productId = args;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          "assets/images/logo.png",
          scale: 10,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: FutureBuilder(
          future: UserApis.getUsersMenuList(productId),
          builder: (context, AsyncSnapshot snapshot) {
            _availableItems = snapshot.data;

            return Padding(
              padding: EdgeInsets.all(0.0),
              child: ListView(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                children: [
                  _availableItems != null
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                      // autoPlay: true,
                                      viewportFraction: 1,
                                      // autoPlayInterval: Duration(seconds: 5),
                                      //enlargeCenterPage: false,
                                      onPageChanged: (i, r) {
                                        setState(() {
                                          current = i;
                                        });
                                      }),
                                  items: _availableItems!.data!.profile!
                                      .map(
                                        (e) => Container(
                                          // margin: EdgeInsets.all(5.0),
                                          height: 250,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                            "http://157.245.97.144:8000/category/${e}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    child: AnimatedSmoothIndicator(
                                      activeIndex: current,
                                      count: _availableItems!
                                          .data!.profile!.length,
                                      effect: const ExpandingDotsEffect(
                                          activeDotColor:
                                              Color.fromRGBO(0, 0, 0, 0.9),
                                          dotWidth: 5,
                                          dotHeight: 8),
                                    ),
                                  ),
                                ),
                                Text(
                                  _availableItems!.data!.shopName!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xff818181),
                                      size: 16,
                                    ),
                                    Text(
                                      "${_availableItems!.data!.address!},${_availableItems!.data!.city!}",
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff818181),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Open All Days",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffED4322)),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 1.3,
                  //       height: 50,
                  //       child: TextField(
                  //         cursorColor: Color(0xffED4322),
                  //         // controller: _controller,
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //               borderSide:
                  //               BorderSide(color: Colors.black87, width: 12.0),
                  //               borderRadius: BorderRadius.circular(0.0)),
                  //           fillColor: Colors.white,
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide:
                  //             BorderSide(color: Colors.black87, width: 1.0),
                  //             borderRadius: BorderRadius.circular(0.0),
                  //           ),
                  //           filled: true,
                  //           suffixIcon: Icon(
                  //             Icons.search,
                  //             color: Color(0xffED4322),
                  //           ),
                  //           hintText: 'Search Here',
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 50,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5.0),
                  //         color: Colors.white,
                  //       ),
                  //       child: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.filter_list,
                  //             size: 40,
                  //             color: Color(0xffED4322),
                  //           )),
                  //     ),
                  //   ],
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.pushNamed(context, '/search_bar');
                  //       },
                  //       child: Container(
                  //         padding: EdgeInsets.all(10),
                  //         width: MediaQuery.of(context).size.width / 1.3,
                  //         height: 50,
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             border: Border.all(color: Colors.black54)),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: const [
                  //             Text(
                  //               "Search here",
                  //               style: TextStyle(color: Colors.black54),
                  //             ),
                  //             Icon(
                  //               Icons.search_outlined,
                  //               color: Color(0xffED4322),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 50,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5.0),
                  //         color: Colors.white,
                  //       ),
                  //       child: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.filter_list,
                  //             size: 40,
                  //             color: Color(0xffED4322),
                  //           )),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15,
                    ),
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xffED4322),
                              child: Icon(Icons.shopping_cart_outlined),
                            ),
                            const Text("In Your Cart",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(
                              width: 100,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xffAEACBA),
                              child: Text(
                                "$_counter",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //...List.generate(10, (index) => YourCart()),
                  _availableItems == null || _availableItems!.data == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Recommended",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      _availableItems!.data!.menuItem!.length,
                                  itemBuilder: (context, index) {
                                    bool isAdded = false;
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigator.pushNamed(
                                        //     context, '/details_page');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 10,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          //SizedBox(height: 50),
                                                          Text(
                                                            _availableItems!
                                                                    .data!
                                                                    .menuItem![
                                                                        index]
                                                                    .itemName ??
                                                                "",
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    "Poppins"),
                                                          ),
                                                          SizedBox(height: 2.0),
                                                          Text(
                                                            "\$ ${_availableItems!.data!.menuItem![index].price ?? ""}",
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    "Poppins",
                                                                color: Color(
                                                                    0xffED4322)),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RatingBar.builder(
                                                                initialRating:
                                                                    3,
                                                                minRating: 1,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    true,
                                                                itemCount: 5,
                                                                itemSize: 15,
                                                                //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                onRatingUpdate:
                                                                    (rating) {
                                                                  print(rating);
                                                                },
                                                              ),
                                                              Text("(3.9)")
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          const ReadMoreText(
                                                            "We are a small craft, tea brewery in the Drumbo hills, overlooking the"
                                                            " city of Belfast, Northern Ireland. We want to help people discover"
                                                            " the magic of tea by sourcing great "
                                                            "loose leaf tea and brewing delicious kombucha and"
                                                            " other innovative, healthy tea drinks.",
                                                            trimLines: 2,
                                                            trimMode:
                                                                TrimMode.Line,
                                                            trimCollapsedText:
                                                                ' more',
                                                            trimExpandedText:
                                                                ' Less',
                                                            lessStyle: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                            moreStyle: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),

                                                          SizedBox(height: 5.0),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Container(
                                                          height: 150,
                                                          width: 140,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // color:
                                                                  //     Colors.red,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            30),
                                                                  ),
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                          "http://157.245.97.144:8000/category/${_availableItems!.data!.menuItem![index].profile!}"),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                          // child: Image.asset(
                                                          //   'assets/images/Rectangle35.png',
                                                          //   height: 130,
                                                          //   width: 130,
                                                          //   fit: BoxFit.cover,
                                                          // ),
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   // color: Colors.red,
                                                      //   height: 150,
                                                      //   width: 150,
                                                      // ),
                                                      // Container(
                                                      //   decoration: BoxDecoration(
                                                      //       borderRadius:
                                                      //           BorderRadius.circular(
                                                      //               20.0)),
                                                      //   child: Image.asset(
                                                      //     'assets/images/Rectangle35.png',
                                                      //     height: 130,
                                                      //     width: 130,
                                                      //     fit: BoxFit.cover,
                                                      //   ),
                                                      // ),
                                                      // Positioned(
                                                      //     bottom: 0,
                                                      //     right: 60,
                                                      //     // left: ,
                                                      //     child: Container(
                                                      //       height: 20,
                                                      //       width: ,
                                                      //       color: Colors.red,
                                                      //     ))
                                                      isAdded == false
                                                          ? Positioned(
                                                              right: 30.0,
                                                              left: 30.0,

                                                              //top: 90,
                                                              bottom: 0,
                                                              child: Container(
                                                                height: 50,
                                                                // width: 120,
                                                                child: Card(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          isAdded =
                                                                              true;
                                                                          print(
                                                                              isAdded);
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Add",
                                                                          style: TextStyle(
                                                                              color: Colors.green,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: "Poppins"),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Positioned(
                                                              right: 30.0,
                                                              left: 30.0,

                                                              //top: 90,
                                                              bottom: 0,
                                                              child: Container(
                                                                height: 50,
                                                                // width: 120,
                                                                child: Card(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            _decrementCounter,
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .remove,
                                                                          color:
                                                                              Color(0xffED4322),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                10.0,
                                                                            right:
                                                                                10),
                                                                        child: Text(
                                                                            '$_counter',
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Color(0xffED4322),
                                                                            )),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            _incrementCounter,
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              Color(0xffED4322),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: size.width * 0.9,
                                                child: const Divider(
                                                  height: 1,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildText(String text) {
    final lines = isReadmore ? null : 3;

    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 10),
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
              (isReadmore ? 'less' : 'more'),
              style: TextStyle(fontSize: 8),
            )),
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

class CustomSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MenuItems>? searchMenuItems;
    searchMenuItems = _availableItems!.data!.menuItem!.where((element) {
      return element.itemName!.toLowerCase().contains(
            query.toLowerCase(),
          );
    }).toList();
    return searchMenuItems == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : searchMenuItems.length != 0
            ? Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: searchMenuItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/details_page');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                //SizedBox(height: 50),
                                                Text(
                                                  searchMenuItems![index]
                                                          .itemName ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 15,
                                                      fontFamily: "Poppins"),
                                                ),
                                                SizedBox(height: 2.0),
                                                Text(
                                                  "\$ ${searchMenuItems![index].price ?? ""}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
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
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 15,
                                                      //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                      itemBuilder:
                                                          (context, _) =>
                                                              const Icon(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),

                                                const ReadMoreText(
                                                  "We are a small craft, tea brewery in the Drumbo hills, overlooking the"
                                                  " city of Belfast, Northern Ireland. We want to help people discover"
                                                  " the magic of tea by sourcing great "
                                                  "loose leaf tea and brewing delicious kombucha and"
                                                  " other innovative, healthy tea drinks.",
                                                  trimLines: 2,
                                                  // colorClickableText: Colors.pink,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText: ' more',
                                                  trimExpandedText: ' Less',
                                                  lessStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  moreStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),

                                                SizedBox(height: 5.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Container(
                                                height: 150,
                                                width: 140,
                                                decoration: const BoxDecoration(
                                                    // color:
                                                    //     Colors.red,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/Rectangle35.png"),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      // width: size.width * 0.9,
                                      child: const Divider(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              )
            : Container(
                child: const Center(
                    child: Text(
                  "Data Not Found!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<MenuItems>? searchMenuItems;
    searchMenuItems = _availableItems!.data!.menuItem!.where((element) {
      return element.itemName!.toLowerCase().contains(
            query.toLowerCase(),
          );
    }).toList();
    return searchMenuItems == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Recommended",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: "Poppins"),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: searchMenuItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/details_page');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            //SizedBox(height: 50),
                                            Text(
                                              searchMenuItems![index]
                                                      .itemName ??
                                                  "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15,
                                                  fontFamily: "Poppins"),
                                            ),
                                            SizedBox(height: 2.0),
                                            Text(
                                              "\$ ${searchMenuItems![index].price ?? ""}",
                                              style: const TextStyle(
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
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
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
                                            const SizedBox(
                                              height: 10,
                                            ),

                                            const ReadMoreText(
                                              "We are a small craft, tea brewery in the Drumbo hills, overlooking the"
                                              " city of Belfast, Northern Ireland. We want to help people discover"
                                              " the magic of tea by sourcing great "
                                              "loose leaf tea and brewing delicious kombucha and"
                                              " other innovative, healthy tea drinks.",
                                              trimLines: 2,
                                              // colorClickableText: Colors.pink,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: ' more',
                                              trimExpandedText: ' Less',
                                              lessStyle: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                              moreStyle: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            SizedBox(height: 5.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            height: 150,
                                            width: 140,
                                            decoration: const BoxDecoration(
                                                // color:
                                                //     Colors.red,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/Rectangle35.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  // width: size.width * 0.9,
                                  child: const Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
  }
}
