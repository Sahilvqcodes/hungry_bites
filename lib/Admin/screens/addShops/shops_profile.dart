import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:hunger_bites/Admin/screens/addShops/addItems.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/available_items.dart';

class ShopsProfile extends StatefulWidget {
  const ShopsProfile({super.key});

  @override
  State<ShopsProfile> createState() => _ShopsProfileState();
}

class _ShopsProfileState extends State<ShopsProfile> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List passData = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          "assets/images/logo.png",
          scale: 10,
        ),
      ),
      body: FutureBuilder(
          future: HomePageApi.getMenuItemsList(passData[1]),
          builder: (context, AsyncSnapshot snapshot) {
            AvailableItems? _availableItems = snapshot.data;
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      width: size.height - 40,
                      child: _availableItems != null
                          ? Column(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                      // autoPlay: true,
                                      viewportFraction: 1,
                                      autoPlayInterval: _availableItems!
                                                  .data!.profile!.length !=
                                              1
                                          ? Duration(seconds: 5)
                                          : Duration(seconds: 0),
                                      //enlargeCenterPage: false,
                                      onPageChanged: (i, r) {
                                        setState(() {
                                          print(i);
                                          current = i;
                                        });
                                      }),
                                  items: _availableItems!.data!.profile!
                                      .map(
                                        (e) => Container(
                                          margin: EdgeInsets.all(5.0),
                                          height: 250,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.network(
                                            "http://157.245.97.144:8000/category/${e}",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
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
                                  "${_availableItems!.data!.name}",
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
                                      Icons.location_on,
                                      color: Color(0xff818181),
                                      size: 25,
                                    ),
                                    Text(
                                      "${_availableItems.data!.address},${_availableItems.data!.city}",
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
                                SizedBox(height: 20),
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                    // Container(
                    //   color: Colors.white,
                    //   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    //   width: size.height - 40,
                    //   child: Column(
                    //     children: [
                    //       Image.asset(
                    //         "${_availableItems.data.menuItem.}",
                    //         fit: BoxFit.cover,
                    //         width: size.height - 40,
                    //       ),
                    //       const SizedBox(
                    //         height: 10,
                    //       ),
                    //       const Text(
                    //         "Major Tom",
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.w600),
                    //       ),
                    //       const SizedBox(
                    //         height: 10,
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: const [
                    //           Icon(
                    //             Icons.location_on,
                    //             color: Color.fromARGB(255, 139, 138, 138),
                    //           ),
                    //           Text(
                    //             "mohali,Punjab",
                    //             style: TextStyle(
                    //               color: Color.fromARGB(255, 139, 138, 138),
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       const SizedBox(
                    //         height: 10,
                    //       ),
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
                                  borderSide: BorderSide(
                                      color: Colors.black87, width: 1.0),
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
                      margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "ADD NEW ITEM",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/add_items",
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Added Items",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _availableItems != null
                              ? _availableItems!.data!.menuItem!.length != 0
                                  ? Column(
                                      children: [
                                        ...List.generate(
                                          _availableItems!
                                              .data!.menuItem!.length,
                                          (index) => Container(
                                            height: 130,
                                            color: Colors.white,
                                            margin: const EdgeInsets.only(
                                                bottom: 10,
                                                right: 15,
                                                left: 15),
                                            child: Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Container(
                                                  width: 130,
                                                  // height: 110,
                                                  child: Image.network(
                                                    "http://157.245.97.144:8000/category/${_availableItems!.data!.menuItem![index].profile!}",
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  bottom: 5,
                                                                  top: 10),
                                                          child: Text(
                                                            "${_availableItems!.data!.menuItem![index].itemName!}",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
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
                                                          Icons.location_on,
                                                          color: Color.fromARGB(
                                                              255,
                                                              139,
                                                              138,
                                                              138),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            "${_availableItems!.data!.address},${_availableItems!.data!.city!}",
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      139,
                                                                      138,
                                                                      138),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: 0.0,
                                                          ),
                                                          child: Text(
                                                            "Edit",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      220,
                                                                      28,
                                                                      28),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Center(
                                      child: Text(
                                        "No Any Item Is Available!",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    )
                              : const Center(
                                  child: SingleChildScrollView(),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
