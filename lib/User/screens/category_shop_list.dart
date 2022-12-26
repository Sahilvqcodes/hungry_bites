import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hunger_bites/Admin/models/available_shops.dart';
import 'package:hunger_bites/routes.dart';

import '../Apis/allApi.dart';

class CategoryShopList extends StatefulWidget {
  CategoryShopList({Key? key}) : super(key: key);

  @override
  State<CategoryShopList> createState() => _CategoryShopListState();
}

class _CategoryShopListState extends State<CategoryShopList> {
  final TextEditingController controller = TextEditingController();
  AvailableShops? _availableShops;
  // List restaurantImage = [
  //   {'image': 'assets/images/Vector.png'},
  //   {'image': 'assets/images/Vector1.png'},
  //   {'image': 'assets/images/Vector1.png'},
  //   {'image': 'assets/images/Vector1.png'},
  // ];
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    String categoryName = args[0];
    String categoryId = args[1];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "${categoryName}",
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: FutureBuilder(
          future: UserApis.getUsersProductList(categoryId),
          builder: (context, AsyncSnapshot snapshot) {
            _availableShops = snapshot.data;
            return Container(
              height: size.height,
              // padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(top: 25),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 50,
                        child: TextField(
                          cursorColor: const Color(0xffED4322),
                          controller: controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black87, width: 12.0),
                                borderRadius: BorderRadius.circular(0.0)),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black87, width: 1.0),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Color(0xffED4322),
                            ),
                            hintText: 'Search ${categoryName}',
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
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
                  const SizedBox(
                    height: 25,
                  ),
                  controller.text.isEmpty
                      ? _availableShops == null || _availableShops!.data == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              // height: size.height - 200,
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
                                  Container(
                                    height: size.height - 260,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _availableShops!
                                            .data!.productId!.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Navigator.pushNamed(
                                              //     context, '/details_page',
                                              //     arguments: _availableShops!
                                              //         .data!
                                              //         .productId![index]
                                              //         .sId);
                                              // arguments: restaurantImage);
                                              Get.toNamed(Routes.details_page,
                                                  arguments: _availableShops!
                                                      .data!
                                                      .productId![index]
                                                      .sId);
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
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(30),
                                                          ),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.0,
                                                                  1.0), //(x,y)
                                                              blurRadius: 2.0,
                                                            ),
                                                          ],
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    'http://157.245.97.144:8000/category/${_availableShops!.data!.productId![index].profile![0]}',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover),
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
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Text(
                                                              _availableShops!
                                                                      .data!
                                                                      .productId![
                                                                          index]
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
                                                                      Colors
                                                                          .green,
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons.star,
                                                                    size: 18,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 5.0),
                                                                Text("3.8",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    )),
                                                                SizedBox(
                                                                    width: 5.0),
                                                                Text("(100+)",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    )),
                                                                SizedBox(
                                                                    width: 2.0),
                                                                // Text(".22 mins",
                                                                //     style: TextStyle(
                                                                //       fontFamily: "Poppins",
                                                                //       fontWeight:
                                                                //           FontWeight.w700,
                                                                //     ))
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 2.0),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  const WidgetSpan(
                                                                    child: Icon(
                                                                        Icons
                                                                            .location_on_outlined,
                                                                        size:
                                                                            15),
                                                                  ),
                                                                  TextSpan(
                                                                    text: _availableShops!
                                                                        .data!
                                                                        .productId![
                                                                            index]
                                                                        .address,
                                                                    style: const TextStyle(
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        color: Color(
                                                                            0xff818181),
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              _availableShops!
                                                                      .data!
                                                                      .productId![
                                                                          index]
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
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            )
                      : FutureBuilder(
                          // stream: null,
                          builder: (context, AsyncSnapshot snapshot) {
                          List<ProductId> _productId;
                          _productId = _availableShops!.data!.productId!
                              .where((element) => element.shopName!
                                  .toLowerCase()
                                  .startsWith(controller.text.toLowerCase()))
                              .toList();
                          return _productId.length != 0
                              ? SizedBox(
                                  height: size.height - 200,
                                  child: ListView.builder(
                                      itemCount: _productId.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/details_page',
                                                arguments:
                                                    _productId[index].sId);
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
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(30),
                                                        ),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 2.0,
                                                          ),
                                                        ],
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              'http://157.245.97.144:8000/category/${_productId[index].profile![0]}',
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
                                                            _productId[index]
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
                                                                    Colors
                                                                        .green,
                                                                radius: 10,
                                                                child: Icon(
                                                                  Icons.star,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5.0),
                                                              Text("3.8",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  )),
                                                              SizedBox(
                                                                  width: 5.0),
                                                              Text("(100+)",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  )),
                                                              SizedBox(
                                                                  width: 2.0),
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
                                                                  text: _productId[
                                                                          index]
                                                                      .address,
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      color: Color(
                                                                          0xff818181),
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            _productId[index]
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
                                        );
                                      }),
                                )
                              : Container(
                                  child: const Center(
                                      child: Text(
                                    "Data Not Found!",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins"),
                                  )),
                                );
                        }),
                ],
              ),
            );
          }),
    );
  }
}
