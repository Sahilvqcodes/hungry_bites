import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hunger_bites/Admin/models/available_shops.dart';

import '../Apis/allApi.dart';

class CategoryShopList extends StatefulWidget {
  CategoryShopList({Key? key}) : super(key: key);

  @override
  State<CategoryShopList> createState() => _CategoryShopListState();
}

class _CategoryShopListState extends State<CategoryShopList> {
  final TextEditingController controller = TextEditingController();

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
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(
              child: Text(
            "${categoryName}",
            style: const TextStyle(color: Colors.black),
          )),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          )),
      body: FutureBuilder(
          future: UserApis.getUsersProductList(categoryId),
          builder: (context, AsyncSnapshot snapshot) {
            AvailableShops? _availableShops = snapshot.data;
            return Container(
              height: size.height,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 25),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 50,
                        child: TextField(
                          cursorColor: Color(0xffED4322),
                          controller: controller,
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
                              size: 40,
                              color: Color(0xffED4322),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _availableShops == null || _availableShops!.data == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: size.height - 150,
                          child: ListView.builder(
                              itemCount:
                                  _availableShops.data!.productId!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/details_page',
                                        arguments: _availableShops
                                            .data!.productId![index].sId);
                                    // arguments: restaurantImage);
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      height: 150,
                                      padding: EdgeInsets.all(0),
                                      child: Row(children: [
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: _availableShops
                                                        .data!
                                                        .productId![index]
                                                        .profile!
                                                        .length !=
                                                    0
                                                ? Image.network(
                                                    'http://157.245.97.144:8000/category/${_availableShops.data!.productId![index].profile![0]}',
                                                    fit: BoxFit.cover,
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        Expanded(
                                          flex: 10,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  _availableShops
                                                          .data!
                                                          .productId![index]
                                                          .shopName ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Color(0xff000000),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 2.0),
                                                Row(
                                                  children: const [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
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
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        )),
                                                    SizedBox(width: 5.0),
                                                    Text("(100+)",
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                                        text: _availableShops
                                                            .data!
                                                            .productId![index]
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
                                                  _availableShops
                                                          .data!
                                                          .productId![index]
                                                          .city ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Color(0xff818181),
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                ],
              ),
            );
          }),
    );
  }
}
