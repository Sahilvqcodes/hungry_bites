import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';

import '../models/available_shops.dart';

class AdminCategoryShopList extends StatefulWidget {
  const AdminCategoryShopList({super.key});

  @override
  State<AdminCategoryShopList> createState() => _AdminCategoryShopListState();
}

class _AdminCategoryShopListState extends State<AdminCategoryShopList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List passData = ModalRoute.of(context)!.settings.arguments as List;
    String categoryName = passData[0];
    String categoryId = passData[1];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
            child: Text(
          "${categoryName}      ",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: 100,
                //   color: Colors.white,
                //   padding: EdgeInsets.only(bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: IconButton(
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //             icon: const Icon(
                //               Icons.arrow_back_ios_new,
                //               color: Colors.black,
                //               size: 25,
                //             )),
                //       ),
                //       const Text(
                //         "Categories Name",
                //         // textAlign: TextAlign.center,
                //         style: TextStyle(
                //             fontSize: 18.0,
                //             fontWeight: FontWeight.w600,
                //             letterSpacing: 1.01,
                //             fontFamily: 'Poppins'),
                //       ),
                //       Container(
                //         width: 50,
                //       )
                //       // IconButton(onPressed: () {}, icon: Icon(Icons.search))
                //     ],
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          cursorColor: Color(0xffED4322),
                          // controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87, width: 12.0),
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
                              size: 35,
                              color: Color(0xffED4322),
                            )),
                      ),
                    ],
                  ),
                ),
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
                          Navigator.pushNamed(context, "/add_shops",
                              arguments: passData);
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
                SizedBox(
                  height: 50,
                ),
                FutureBuilder(
                    future: HomePageApi.getShopsList(categoryId),
                    builder: (context, AsyncSnapshot snapshot) {
                      AvailableShops? _availableShops = snapshot.data;
                      // print(_availableShops!.data!.productId![0].profile);

                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Availble $categoryName",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              _availableShops != null
                                  ? _availableShops.data!.productId!.length != 0
                                      ? Column(
                                          children: [
                                            ...List.generate(
                                              _availableShops
                                                  .data!.productId!.length,
                                              (index) => Slidable(
                                                // key: const ValueKey(),
                                                endActionPane: ActionPane(
                                                  motion: ScrollMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      // An action can be bigger than the others.

                                                      onPressed: (BuildContext
                                                          context) {},
                                                      backgroundColor:
                                                          Color.fromARGB(253,
                                                              93, 127, 196),
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.edit,
                                                      label: 'Edit',
                                                    ),
                                                    SlidableAction(
                                                      onPressed:
                                                          (context) async {
                                                        await HomePageApi
                                                            .deleteProducts(
                                                                context,
                                                                _availableShops
                                                                    .data!
                                                                    .productId![
                                                                        index]
                                                                    .sId!);
                                                        setState(() {});
                                                      },
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.delete,
                                                      label: 'Delete',
                                                    ),
                                                  ],
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(context,
                                                        "/shops_profile",
                                                        arguments: [
                                                          categoryId,
                                                          _availableShops
                                                              .data!
                                                              .productId![index]
                                                              .sId
                                                        ]);
                                                  },
                                                  child: Container(
                                                    height: 130,
                                                    color: Colors.white,
                                                    margin: EdgeInsets.only(
                                                        bottom: 10,
                                                        right: 15,
                                                        left: 15),
                                                    child: Row(children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Container(
                                                          width: 130,
                                                          height: 110,
                                                          child: Image.network(
                                                            "http://157.245.97.144:8000/category/${_availableShops.data!.productId![index].profile![0]}",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 100,
                                                        width: 180,
                                                        child: Column(
                                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0,
                                                                      bottom: 5,
                                                                      top: 10),
                                                                  child: Text(
                                                                    "${_availableShops.data!.productId![index].shopName}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          139,
                                                                          138,
                                                                          138),
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${_availableShops.data!.productId![index].address},${_availableShops.data!.productId![index].city}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          139,
                                                                          138,
                                                                          138),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            // Row(
                                                            //   mainAxisAlignment:
                                                            //       MainAxisAlignment
                                                            //           .end,
                                                            //   children: const [
                                                            //     Padding(
                                                            //       padding:
                                                            //           EdgeInsets
                                                            //               .only(
                                                            //         right: 0.0,
                                                            //       ),
                                                            //       child: Text(
                                                            //         "Edit",
                                                            //         style:
                                                            //             TextStyle(
                                                            //           color: Color.fromARGB(
                                                            //               255,
                                                            //               220,
                                                            //               28,
                                                            //               28),
                                                            //           fontSize:
                                                            //               18,
                                                            //           fontWeight:
                                                            //               FontWeight
                                                            //                   .w500,
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                          ],
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
    );
  }
}
