import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:hunger_bites/Admin/screens/addShops/addItems.dart';
import 'package:hunger_bites/Owner/owner_drawer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Admin/models/available_items.dart';

AvailableItems? _availableItems;
List? passData;

class OwnerShopsHome extends StatefulWidget {
  const OwnerShopsHome({super.key});

  @override
  State<OwnerShopsHome> createState() => _OwnerShopsHomeState();
}

class _OwnerShopsHomeState extends State<OwnerShopsHome> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  // void _showAddItemsDialog() async {
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AddItems();
  //     },
  //   );
  // }
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

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(milliseconds: 1000), () {
      completer.complete();
    });
    setState(() {});
    return completer.future.then<void>((_) {
      // ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
      //   SnackBar(
      //     content: const Text('Refresh complete'),
      //     action: SnackBarAction(
      //       label: 'RETRY',
      //       onPressed: () {
      //         _refreshIndicatorKey.currentState!.show();
      //       },
      //     ),
      //   ),
      // );
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    passData = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      key: _scaffoldKey,
      drawer: OwnerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          "assets/images/logo.png",
          scale: 10,
        ),
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
              size: 40,
            )),
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
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey, // key if you want to add
        onRefresh: _handleRefresh,
        // backgroundColor: Colors.amber,
        color: Theme.of(context).colorScheme.primary,
        child: FutureBuilder(
            future: HomePageApi.getMenuItemsList(passData![1]),
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
                                  Stack(
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
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Image.network(
                                                  "http://157.245.97.144:8000/category/${e}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              "/owner_update_shops",
                                              arguments: {
                                                "passData": [
                                                  _availableItems!
                                                      .data!.Category_type,
                                                  _availableItems!.data!.catId
                                                ],
                                                "shopsData":
                                                    _availableItems!.data,
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                              color: Color.fromARGB(
                                                  255, 212, 206, 206),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.mode_edit,
                                                size: 30,
                                                color: Colors.black,
                                                // color: Theme.of(context)
                                                //     .colorScheme
                                                //     .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
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

                    Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5, right: 15, left: 15),
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Add New Items",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/add_items",
                                  arguments: {
                                    "passData": passData,
                                    "menuData": null
                                  });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Availble Items",
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
                                      return Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Slidable(
                                            // key: const ValueKey(),
                                            endActionPane: ActionPane(
                                              motion: ScrollMotion(),
                                              extentRatio: 0.6,
                                              children: [
                                                SlidableAction(
                                                  // An action can be bigger than the others.

                                                  onPressed:
                                                      (BuildContext context) {
                                                    Navigator.pushNamed(
                                                        context, "/add_items",
                                                        arguments: {
                                                          "passData": passData,
                                                          "menuData":
                                                              _availableItems!
                                                                      .data!
                                                                      .menuItem![
                                                                  index]
                                                        });
                                                  },
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          253, 93, 127, 196),
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.edit,
                                                  label: 'Edit',
                                                ),
                                                SlidableAction(
                                                  onPressed: (context) async {
                                                    await HomePageApi
                                                        .deleteMenuItems(
                                                            context,
                                                            _availableItems!
                                                                .data!
                                                                .menuItem![
                                                                    index]
                                                                .sId!);
                                                    setState(() {});
                                                  },
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.delete,
                                                  label: 'Delete',
                                                ),
                                              ],
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                // Navigator.pushNamed(
                                                //     context, '/details_page');
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 10,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          20.0,
                                                                      right:
                                                                          20),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  //SizedBox(height: 50),
                                                                  Text(
                                                                    _availableItems!
                                                                            .data!
                                                                            .menuItem![index]
                                                                            .itemName ??
                                                                        "",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            "Poppins"),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          2.0),
                                                                  Text(
                                                                    "\$ ${_availableItems!.data!.menuItem![index].price ?? ""}",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        fontSize:
                                                                            18,
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
                                                                      RatingBar
                                                                          .builder(
                                                                        initialRating:
                                                                            3,
                                                                        minRating:
                                                                            1,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        allowHalfRating:
                                                                            true,
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            15,
                                                                        //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                                        itemBuilder:
                                                                            (context, _) =>
                                                                                const Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Colors.amber,
                                                                        ),
                                                                        onRatingUpdate:
                                                                            (rating) {
                                                                          print(
                                                                              rating);
                                                                        },
                                                                      ),
                                                                      Text(
                                                                          "(3.9)")
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
                                                                    trimLines:
                                                                        2,
                                                                    // colorClickableText: Colors.pink,
                                                                    trimMode:
                                                                        TrimMode
                                                                            .Line,
                                                                    trimCollapsedText:
                                                                        ' more',
                                                                    trimExpandedText:
                                                                        ' Less',
                                                                    lessStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                    moreStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),

                                                                  const SizedBox(
                                                                      height:
                                                                          5.0),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15.0,
                                                                        right:
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  height: 150,
                                                                  width: 140,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    // color:
                                                                    //     Colors.red,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          30),
                                                                    ),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                            "http://157.245.97.144:8000/category/${_availableItems!.data!.menuItem![index].profile!}"),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                  ),
                                                                  // child: Image.asset(
                                                                  //   'assets/images/Rectangle35.png',
                                                                  //   height: 130,
                                                                  //   width: 130,
                                                                  //   fit: BoxFit.cover,
                                                                  // ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                      // const SizedBox(
                                                      //   height: 20,
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                            height: 10,
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ),
                  ],
                ),
              );
            }),
      ),
    );
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Available Items",
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
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Slidable(
                                  // key: const ValueKey(),
                                  endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    extentRatio: 0.6,
                                    children: [
                                      SlidableAction(
                                        // An action can be bigger than the others.

                                        onPressed: (BuildContext context) {
                                          Navigator.pushNamed(
                                              context, "/add_items",
                                              arguments: {
                                                "passData": passData,
                                                "menuData": _availableItems!
                                                    .data!.menuItem![index]
                                              });
                                        },
                                        backgroundColor: const Color.fromARGB(
                                            253, 93, 127, 196),
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                        label: 'Edit',
                                      ),
                                      SlidableAction(
                                        onPressed: (context) async {
                                          await HomePageApi.deleteMenuItems(
                                              context,
                                              _availableItems!
                                                  .data!.menuItem![index].sId!);
                                          // setState(() {});
                                        },
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
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
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 20),
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
                                                          searchMenuItems![
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
                                                          "\$ ${searchMenuItems![index].price ?? ""}",
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
                                                              initialRating: 3,
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
                                                          // colorClickableText: Colors.pink,
                                                          trimMode:
                                                              TrimMode.Line,
                                                          trimCollapsedText:
                                                              ' more',
                                                          trimExpandedText:
                                                              ' Less',
                                                          lessStyle: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          moreStyle: TextStyle(
                                                              fontSize: 14,
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
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              right: 15),
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
                                                            Radius.circular(30),
                                                          ),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  "http://157.245.97.144:8000/category/${searchMenuItems[index].profile!}"),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                            );
                          }),
                    ],
                  ),
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
            child: SingleChildScrollView(
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
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Slidable(
                              // key: const ValueKey(),
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                extentRatio: 0.6,
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.

                                    onPressed: (BuildContext context) {
                                      Navigator.pushNamed(context, "/add_items",
                                          arguments: {
                                            "passData": passData,
                                            "menuData": _availableItems!
                                                .data!.menuItem![index]
                                          });
                                    },
                                    backgroundColor:
                                        const Color.fromARGB(253, 93, 127, 196),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await HomePageApi.deleteMenuItems(
                                          context,
                                          _availableItems!
                                              .data!.menuItem![index].sId!);
                                      // setState(() {});
                                    },
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: GestureDetector(
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
                                                padding: const EdgeInsets.only(
                                                    left: 20.0, right: 20),
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
                                                          fontFamily:
                                                              "Poppins"),
                                                    ),
                                                    SizedBox(height: 2.0),
                                                    Text(
                                                      "\$ ${searchMenuItems![index].price ?? ""}",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 18,
                                                          fontFamily: "Poppins",
                                                          color: Color(
                                                              0xffED4322)),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                      // colorClickableText: Colors.pink,
                                                      trimMode: TrimMode.Line,
                                                      trimCollapsedText:
                                                          ' more',
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
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15),
                                                  child: Container(
                                                    height: 150,
                                                    width: 140,
                                                    decoration:
                                                        const BoxDecoration(
                                                            // color:
                                                            //     Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  30),
                                                            ),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/Rectangle35.png"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                        );
                      }),
                ],
              ),
            ),
          );
  }
}
