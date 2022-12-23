import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../models/available_shops.dart';

AvailableShops? _availableShops;
List? passData;

class AdminCategoryShopList extends StatefulWidget {
  const AdminCategoryShopList({super.key});

  @override
  State<AdminCategoryShopList> createState() => _AdminCategoryShopListState();
}

class _AdminCategoryShopListState extends State<AdminCategoryShopList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _textController = TextEditingController();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    passData = ModalRoute.of(context)!.settings.arguments as List;
    String categoryName = passData![0];
    String categoryId = passData![1];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "${categoryName}",
          style: TextStyle(color: Colors.black),
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
              showSearch(context: context, delegate: ProductSearch());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey, // key if you want to add
        onRefresh: _handleRefresh,
        // backgroundColor: Colors.amber,
        color: Theme.of(context).colorScheme.primary,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 40, right: 15, left: 15),
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add New ${categoryName}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/add_shops",
                              arguments: {
                                "passData": passData,
                                "shopsData": null
                              },
                            );
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
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: HomePageApi.getShopsList(categoryId),
                      builder: (context, AsyncSnapshot snapshot) {
                        _availableShops = snapshot.data;
                        // print(_availableShops!.data!.productId![0].profile);

                        return Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _availableShops != null
                                    ? _availableShops!
                                                .data!.productId!.length !=
                                            0
                                        ? Container(
                                            // height: size.height - 200,
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Text(
                                                    "Availble $categoryName",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18,
                                                        fontFamily: "Poppins"),
                                                  ),
                                                ),
                                                Container(
                                                  // height: size.height - 290,
                                                  child: ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          _availableShops!
                                                              .data!
                                                              .productId!
                                                              .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Slidable(
                                                              // key: const ValueKey(),
                                                              endActionPane:
                                                                  ActionPane(
                                                                motion:
                                                                    ScrollMotion(),
                                                                extentRatio:
                                                                    0.6,
                                                                children: [
                                                                  SlidableAction(
                                                                    // An action can be bigger than the others.

                                                                    onPressed:
                                                                        (BuildContext
                                                                            context) {
                                                                      Navigator
                                                                          .pushNamed(
                                                                        context,
                                                                        "/add_shops",
                                                                        arguments: {
                                                                          "passData":
                                                                              passData,
                                                                          "shopsData": _availableShops!
                                                                              .data!
                                                                              .productId![index]
                                                                        },
                                                                      );
                                                                    },
                                                                    backgroundColor:
                                                                        const Color.fromARGB(
                                                                            253,
                                                                            93,
                                                                            127,
                                                                            196),
                                                                    foregroundColor:
                                                                        Colors
                                                                            .white,
                                                                    icon: Icons
                                                                        .edit,
                                                                    label:
                                                                        'Edit',
                                                                  ),
                                                                  SlidableAction(
                                                                    onPressed:
                                                                        (context) async {
                                                                      await HomePageApi.deleteProducts(
                                                                          context,
                                                                          _availableShops!
                                                                              .data!
                                                                              .productId![index]
                                                                              .sId!);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    backgroundColor: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary,
                                                                    foregroundColor:
                                                                        Colors
                                                                            .white,
                                                                    icon: Icons
                                                                        .delete,
                                                                    label:
                                                                        'Delete',
                                                                  ),
                                                                ],
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      "/shops_profile",
                                                                      arguments: [
                                                                        categoryId,
                                                                        _availableShops!
                                                                            .data!
                                                                            .productId![index]
                                                                            .sId
                                                                      ]);
                                                                  // arguments: restaurantImage);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          150,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      child: Row(
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 8,
                                                                              child: Container(
                                                                                height: 150,
                                                                                width: 140,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: const BorderRadius.all(
                                                                                    Radius.circular(30),
                                                                                  ),
                                                                                  image: DecorationImage(
                                                                                      image: NetworkImage(
                                                                                        'http://157.245.97.144:8000/category/${_availableShops!.data!.productId![index].profile![0]}',
                                                                                      ),
                                                                                      fit: BoxFit.cover),
                                                                                ),
                                                                                // child: _availableShops!
                                                                                //             .data!
                                                                                //             .productId![index]
                                                                                //             .profile!
                                                                                //             .length !=
                                                                                //         0
                                                                                //     ? Image.network(
                                                                                //         'http://157.245.97.144:8000/category/${_availableShops!.data!.productId![index].profile![0]}',
                                                                                //         fit: BoxFit.fitHeight,
                                                                                //       )
                                                                                //     : Container(),
                                                                              ),
                                                                            ),
                                                                            const Spacer(
                                                                              flex: 1,
                                                                            ),
                                                                            Expanded(
                                                                              flex: 10,
                                                                              child: Container(
                                                                                padding: const EdgeInsets.only(top: 5),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text(
                                                                                      _availableShops!.data!.productId![index].shopName ?? "",
                                                                                      style: const TextStyle(fontFamily: "Poppins", color: Color(0xff000000), fontSize: 18, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    const SizedBox(height: 2.0),
                                                                                    Row(
                                                                                      children: const [
                                                                                        CircleAvatar(
                                                                                          backgroundColor: Colors.green,
                                                                                          radius: 10,
                                                                                          child: Icon(
                                                                                            Icons.star,
                                                                                            size: 18,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(width: 5.0),
                                                                                        Text("3.8",
                                                                                            style: TextStyle(
                                                                                              fontFamily: "Poppins",
                                                                                              fontWeight: FontWeight.w700,
                                                                                            )),
                                                                                        SizedBox(width: 5.0),
                                                                                        Text("(100+)",
                                                                                            style: TextStyle(
                                                                                              fontFamily: "Poppins",
                                                                                              fontWeight: FontWeight.w700,
                                                                                            )),
                                                                                        SizedBox(width: 2.0),
                                                                                        // Text(".22 mins",
                                                                                        //     style: TextStyle(
                                                                                        //       fontFamily: "Poppins",
                                                                                        //       fontWeight:
                                                                                        //           FontWeight.w700,
                                                                                        //     ))
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(height: 2.0),
                                                                                    RichText(
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          const WidgetSpan(
                                                                                            child: Icon(Icons.location_on_outlined, size: 15),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: _availableShops!.data!.productId![index].address,
                                                                                            style: const TextStyle(fontFamily: "Poppins", color: Color(0xff818181), fontSize: 14),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      _availableShops!.data!.productId![index].city ?? "",
                                                                                      style: const TextStyle(fontFamily: "Poppins", color: Color(0xff818181), fontSize: 14),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              width:
                                                                  size.width *
                                                                      0.9,
                                                              child:
                                                                  const Divider(
                                                                height: 1,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            )
                                                          ],
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            child: Center(
                                              child: Text(
                                                "No Any ${categoryName} Available!",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Poppins"),
                                              ),
                                            ),
                                          )
                                    : Center(child: CircularProgressIndicator())
                              ]),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate {
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
    List<ProductId>? searchProduct;
    if (_availableShops != null) {
      searchProduct = _availableShops!.data!.productId!
          .where((element) =>
              element.shopName!.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    } else {
      searchProduct = null;
    }
    return searchProduct != null
        ? searchProduct!.length != 0
            ? Container(
                // height: size.height - 200,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Recomended",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: "Poppins"),
                        ),
                      ),
                      Container(
                        // height: size.height - 290,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: searchProduct.length,
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
                                              context,
                                              "/add_shops",
                                              arguments: {
                                                "passData": passData,
                                                "shopsData":
                                                    searchProduct![index]
                                              },
                                            );
                                          },
                                          backgroundColor:
                                              Color.fromARGB(253, 93, 127, 196),
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: 'Edit',
                                        ),
                                        SlidableAction(
                                          onPressed: (context) async {
                                            await HomePageApi.deleteProducts(
                                                context,
                                                searchProduct![index].sId!);
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
                                        Navigator.pushNamed(
                                            context, "/shops_profile",
                                            arguments: [
                                              searchProduct![index].catId,
                                              searchProduct[index].sId
                                            ]);
                                        // arguments: restaurantImage);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 150,
                                            padding: EdgeInsets.all(10),
                                            child: Row(children: [
                                              Expanded(
                                                flex: 8,
                                                child: Container(
                                                  height: 150,
                                                  width: 140,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          'http://157.245.97.144:8000/category/${searchProduct![index].profile![0]}',
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        searchProduct[index]
                                                                .shopName ??
                                                            "",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            color: Color(
                                                                0xff000000),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                          height: 2.0),
                                                      Row(
                                                        children: const [
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            radius: 10,
                                                            child: Icon(
                                                              Icons.star,
                                                              size: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          Text("3.8",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              )),
                                                          SizedBox(width: 5.0),
                                                          Text("(100+)",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              )),
                                                          SizedBox(width: 2.0),
                                                          // Text(".22 mins",
                                                          //     style: TextStyle(
                                                          //       fontFamily: "Poppins",
                                                          //       fontWeight:
                                                          //           FontWeight.w700,
                                                          //     ))
                                                        ],
                                                      ),
                                                      SizedBox(height: 2.0),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            const WidgetSpan(
                                                              child: Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  size: 15),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  searchProduct[
                                                                          index]
                                                                      .address,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  color: Color(
                                                                      0xff818181),
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        searchProduct[index]
                                                                .city ??
                                                            "",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            color: Color(
                                                                0xff818181),
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text(
                    "No Any Data Available!",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins"),
                  ),
                ),
              )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductId>? searchProduct;
    if (_availableShops != null) {
      searchProduct = _availableShops!.data!.productId!
          .where((element) =>
              element.shopName!.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    } else {
      searchProduct = null;
    }
    return searchProduct != null
        ? searchProduct!.length != 0
            ? Container(
                // height: size.height - 200,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Recomended",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: "Poppins"),
                        ),
                      ),
                      Container(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: searchProduct.length,
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

                                          onPressed: (BuildContext context) {},
                                          backgroundColor:
                                              Color.fromARGB(253, 93, 127, 196),
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: 'Edit',
                                        ),
                                        SlidableAction(
                                          onPressed: (context) async {
                                            await HomePageApi.deleteProducts(
                                                context,
                                                _availableShops!.data!
                                                    .productId![index].sId!);
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
                                        Navigator.pushNamed(
                                            context, "/shops_profile",
                                            arguments: [
                                              searchProduct![index].catId,
                                              searchProduct[index].sId
                                            ]);
                                        // arguments: restaurantImage);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 150,
                                            padding: EdgeInsets.all(10),
                                            child: Row(children: [
                                              Expanded(
                                                flex: 8,
                                                child: Container(
                                                  height: 150,
                                                  width: 140,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          'http://157.245.97.144:8000/category/${searchProduct![index].profile![0]}',
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                  // child: _availableShops!
                                                  //             .data!
                                                  //             .productId![index]
                                                  //             .profile!
                                                  //             .length !=
                                                  //         0
                                                  //     ? Image.network(
                                                  //         'http://157.245.97.144:8000/category/${_availableShops!.data!.productId![index].profile![0]}',
                                                  //         fit: BoxFit.fitHeight,
                                                  //       )
                                                  //     : Container(),
                                                ),
                                              ),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        searchProduct[index]
                                                                .shopName ??
                                                            "",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            color: Color(
                                                                0xff000000),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                          height: 2.0),
                                                      Row(
                                                        children: const [
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            radius: 10,
                                                            child: Icon(
                                                              Icons.star,
                                                              size: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          Text("3.8",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              )),
                                                          SizedBox(width: 5.0),
                                                          Text("(100+)",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              )),
                                                          SizedBox(width: 2.0),
                                                          // Text(".22 mins",
                                                          //     style: TextStyle(
                                                          //       fontFamily: "Poppins",
                                                          //       fontWeight:
                                                          //           FontWeight.w700,
                                                          //     ))
                                                        ],
                                                      ),
                                                      SizedBox(height: 2.0),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            const WidgetSpan(
                                                              child: Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  size: 15),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  searchProduct[
                                                                          index]
                                                                      .address,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  color: Color(
                                                                      0xff818181),
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        searchProduct[index]
                                                                .city ??
                                                            "",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            color: Color(
                                                                0xff818181),
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
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
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text(
                    "No Any Data Available!",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins"),
                  ),
                ),
              )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
