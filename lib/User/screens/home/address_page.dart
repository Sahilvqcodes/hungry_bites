import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunger_bites/User/screens/shopsDetails/controller/shops_controller.dart';

import '../../../Admin/models/available_items.dart';

// class AddressPage extends StatefulWidget {
//   const AddressPage({Key? key}) : super(key: key);

//   @override
//   State<AddressPage> createState() => _AddressPageState();
// }

class Customer {
  String id;
  int tagValue;
  Customer(this.id, this.tagValue);
  @override
  String toString() {
    return '{ ${this.id}, ${this.tagValue} }';
  }
}

class AddressPage extends GetView<ShopsController> {
  var arguments;
  String? shopName;

  List<MenuItems>? addToCartDatas;
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     setState(
  //       () {
  //         arguments = (ModalRoute.of(context)?.settings.arguments ??
  //             <String, dynamic>{}) as Map;
  //         shopName = arguments["shopName"];
  //         addToCartDatas = arguments["cartData"];
  //         Map<String, dynamic> count = {};
  //         addToCartDatas!
  //             .forEach((i) => count[i.sId!] = (count[i.sId] ?? 0) + 1);

  //         count.forEach((k, v) => listSimilarData.add(Customer(k, v)));
  //       },
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print("controller.addedMenuItemsToCart ${controller.addedMenuItemsToCart}");
    String shopName = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          "${shopName}",
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Container(
      //     height: 100,
      //     decoration: BoxDecoration(
      //         color: Color(0xffFFFFFF),
      //         borderRadius: BorderRadius.all(Radius.circular(15))),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Icon(
      //                 Icons.edit_location_alt_outlined,
      //                 color: Color(0xffED4322),
      //                 size: 18,
      //               ),
      //               Text(
      //                 'You are in a new location',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.w500,
      //                     fontFamily: "Poppins",
      //                     fontSize: 14),
      //               ),
      //             ]),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             ButtonBar(
      //               children: <Widget>[
      //                 SizedBox(
      //                     width: 140,
      //                     child: ElevatedButton(
      //                       onPressed: () {
      //                         _settingModalBottomSheet(context);
      //                       },
      //                       child: Text('Select Address'),
      //                     )),
      //                 SizedBox(
      //                     width: 140,
      //                     child: ElevatedButton(
      //                       onPressed: () {
      //                         _moreModalBottomSheet(context);
      //                       },
      //                       child: Text('Add Address'),
      //                     ))
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Obx(() {
        // addToCartDatas = arguments["cartData"];
        int totalAmount = 0;

        Map<String, dynamic> count = {};
        controller.addedMenuItemsToCart!
            .forEach((i) => count[i.sId!] = (count[i.sId] ?? 0) + 1);
        controller.addedMenuItemsToCart!
            .forEach((i) => totalAmount += int.parse(i.price!));
        print(count);
        controller.listSimilarData.clear();
        count.forEach((k, v) => controller.listSimilarData.add(Customer(k, v)));
        print(controller.listSimilarData);
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        ...List.generate(controller.listSimilarData.length,
                            (index) {
                          print(
                              "listSimilarData[index].id ${controller.listSimilarData[index].id}");
                          controller.cartMenuItems.clear();
                          RxList<MenuItems> cartMenuItems = controller
                              .addedMenuItemsToCart!
                              .where((element) =>
                                  element.sId ==
                                  controller.listSimilarData[index].id)
                              .toList()
                              .obs;
                          print(" controller.cartMenuItems ${cartMenuItems}");
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 120,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartMenuItems[0].itemName ?? "",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Poppins",
                                                    color: Color(0xff03060F)),
                                              ),
                                              Text(
                                                cartMenuItems[0].itemDetails ??
                                                    "",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                  color: Color(0xffAEACBA),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.0), //(x,y)
                                                blurRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  final item = controller
                                                      .addedMenuItemsToCart
                                                      .indexWhere((e) =>
                                                          e.sId ==
                                                          cartMenuItems[0].sId);
                                                  // print(item);
                                                  controller
                                                      .addedMenuItemsToCart
                                                      .removeAt(item);
                                                  controller.addedItemToCart
                                                      .remove(
                                                          cartMenuItems[0].sId);
                                                  // setState(() {});
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Color.fromARGB(
                                                        255, 5, 177, 126),
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10),
                                                child: Text(
                                                    "${cartMenuItems.length}",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 5, 177, 126),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Poppins")),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .addedMenuItemsToCart
                                                      .add(cartMenuItems[0]);
                                                  print(cartMenuItems[0].sId);
                                                  // setState(() {});
                                                  controller.addedItemToCart
                                                      .add(
                                                          cartMenuItems[0].sId);
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color.fromARGB(
                                                        255, 5, 177, 126),
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          child: Text(
                                            "\$ ${cartMenuItems.length * int.parse(cartMenuItems[0].price!)}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins"),
                                          ),
                                        )
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        //   children: [
                                        //     Padding(
                                        //       padding: const EdgeInsets.all(5.0),
                                        //       child: Container(
                                        //           height: 30,
                                        //           width: 30,
                                        //           decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color: Color(0xffEFEFEF),
                                        //           ),
                                        //           child: IconButton(
                                        //             onPressed: () {},
                                        //             icon: const Icon(
                                        //               Icons.remove,
                                        //               size: 15,
                                        //             ),
                                        //           )),
                                        //     ),
                                        //     Container(
                                        //         height: 30,
                                        //         width: 50,
                                        //         decoration: const BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.all(Radius.circular(15)),
                                        //           //shape: BoxShape.circle,
                                        //           color: Color(0xffEFEFEF),
                                        //         ),
                                        //         child: Center(
                                        //             child: Text("${cartMenuItems.length}"))),
                                        //     Padding(
                                        //       padding: const EdgeInsets.all(5.0),
                                        //       child: Container(
                                        //           height: 30,
                                        //           width: 30,
                                        //           decoration: BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color: Color(0xffEFEFEF),
                                        //           ),
                                        //           child: IconButton(
                                        //             onPressed: () {},
                                        //             icon: Icon(
                                        //               Icons.add,
                                        //               size: 15,
                                        //             ),
                                        //           )),
                                        //     ),
                                        //     Text("\$52")
                                        //   ],
                                        // ),
                                      ],
                                    ),

                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       "Write instructions for restaurant",
                                    //       style: (TextStyle(
                                    //           color: Color(0xffAEACBA),
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w300,
                                    //           fontFamily: "Poppins")),
                                    //     ),
                                    //     Text(
                                    //       "Save",
                                    //       style: TextStyle(
                                    //           fontSize: 16,
                                    //           fontWeight: FontWeight.w500,
                                    //           fontFamily: "Poppins",
                                    //           color: Color(0xffED4322)),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                        // SizedBox(height: 20),
                        // DottedLine(),
                        // SizedBox(height: 10),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  // DottedLine(),
                  // SizedBox(height: 10),
                  const SizedBox(height: 20),
                  const Text(
                    "Bill Details",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Items",
                              style: (TextStyle(
                                  color: Color(0xffAEACBA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                            ),
                            Text(
                              "\$ ${totalAmount}",
                              style: (TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Taxes & Charges",
                              style: (TextStyle(
                                  color: Color(0xffAEACBA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                            ),
                            Text(
                              "\$ 0",
                              style: (TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        DottedLine(),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "To Pay",
                              style: (TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins")),
                            ),
                            Text(
                              "\$ ${totalAmount}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    color: Colors.white,
                    child: RichText(
                      text: const TextSpan(
                          text: ' Note:',
                          style: TextStyle(
                              color: Color(0xffED4322),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting '
                                  'industry. Lorem Ipsum has been the industry'
                                  ' standard dummy text ever since the 1500s, when an unknown '
                                  'printer took a galley of type and scrambled it to make a type specimen book'
                                  ' It has survived not only five centuries, but also the leap into'
                                  '    electronic typesetting, remaining essentially unchanged.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: Color(0xff000000),
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Total Amount :",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            "\$ ${totalAmount}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 5, 177, 126),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10, left: 20, right: 20),
                          child: Text(
                            "Submit Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

void _settingModalBottomSheet(context) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Choose a delivery address',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                trailing: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onTap: () => {},
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.black,
                      border: Border.all(color: Color(0xffAEACBA))),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color(
                      0xffED4322,
                    ),
                    size: 20,
                  ),
                ),
                title: Text(
                  'Townhouse',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                subtitle: Text(
                    "120 St. Andrews Dr,Burlington , Ontario L8K 6C3",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12)),
                onTap: () => {},
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.black,
                      border: Border.all(color: Color(0xffAEACBA))),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color(
                      0xffED4322,
                    ),
                    size: 20,
                  ),
                ),
                title: Text(
                  'Townhouse',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                subtitle: Text(
                    "120 St. Andrews Dr,Burlington , Ontario L8K 6C3",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12)),
                onTap: () => {},
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Color(0xffAEACBA))),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color(
                      0xffED4322,
                    ),
                    size: 20,
                  ),
                ),
                title: Text(
                  'Townhouse',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                subtitle: Text(
                    "120 St. Andrews Dr,Burlington , Ontario L8K 6C3",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12)),
                onTap: () => {},
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      });
}

_moreModalBottomSheet(context) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Choose a delivery address',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                trailing: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onTap: () => {},
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "Name",
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Color(0xffAEACBA)),
                    fillColor: Color(0xffEFEFEF),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xffED4322),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    ),
                    hintText: 'City,Town'),
                onChanged: (value) {},
                validator: (String? value) {
                  return (value!.isEmpty || value.length < 6)
                      ? 'Password Must between 6-12 letters'
                      : null;
                },
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "House no,",
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Color(0xffAEACBA)),
                    fillColor: Color(0xffEFEFEF),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xffED4322),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    ),
                    hintText: 'Password'),
                onChanged: (value) {},
                validator: (String? value) {
                  return (value!.isEmpty || value.length < 6)
                      ? 'Password Must between 6-12 letters'
                      : null;
                },
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "Password",
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Color(0xffAEACBA)),
                    fillColor: Color(0xffEFEFEF),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xffED4322),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    ),
                    hintText: 'Password'),
                onChanged: (value) {},
                validator: (String? value) {
                  return (value!.isEmpty || value.length < 6)
                      ? 'Password Must between 6-12 letters'
                      : null;
                },
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      });
}
