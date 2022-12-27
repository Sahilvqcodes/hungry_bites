import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hunger_bites/User/screens/shopsDetails/controller/shops_controller.dart';
import 'package:readmore/readmore.dart';

class UserWishlist extends GetView<ShopsController> {
  // const UserWishlist({super.key});
  ShopsController controller = Get.put(ShopsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Wishlist",
          style: const TextStyle(color: Colors.black),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showSearch(context: context, delegate: CustomSearch());
        //     },
        //     icon: Icon(
        //       Icons.search,
        //       size: 30,
        //     ),
        //   )
        // ],
      ),
      body: Container(
        height: size.height - 60,
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: FutureBuilder(builder: (context, snapshot) {
          return Obx(
            () => controller.wishlisIds.length != 0
                ? ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.wishlisIds.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/details_page');
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
                                              controller.wishlisItems[index]
                                                  .itemName!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15,
                                                  fontFamily: "Poppins"),
                                            ),
                                            SizedBox(height: 2.0),
                                            Text(
                                              "\$ ${controller.wishlisItems[index].price}",
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
                                            decoration: BoxDecoration(
                                                // color:
                                                //     Colors.red,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(
                                                        0.0, 1.0), //(x,y)
                                                    blurRadius: 2.0,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "http://157.245.97.144:8000/category/${controller.wishlisItems[index].profile}"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Positioned(
                                          right: 20,
                                          top: 20,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.wishlisIds.remove(
                                                  controller
                                                      .wishlisItems[index].sId);
                                              controller.wishlisItems
                                                  .removeWhere((element) =>
                                                      element.sId ==
                                                      controller
                                                          .wishlisItems[index]
                                                          .sId);
                                            },
                                            child: Container(
                                              // height: 50.0,
                                              // width: 40.0,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    child: const Center(
                                                      child: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.grey,
                                                          size: 40.0),
                                                    ),
                                                  ),
                                                  controller.wishlisIds
                                                          .contains(controller
                                                              .wishlisItems[
                                                                  index]
                                                              .sId)
                                                      ? Container(
                                                          width: 40,
                                                          height: 40,
                                                          child: Center(
                                                            child: Icon(
                                                                Icons.favorite,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                                size: 33.0),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // !controller.addedItemToCart.contains(
                                        //         controller.wishlisItems[index].sId)
                                        //     ? Positioned(
                                        //         right: 30.0,
                                        //         left: 30.0,

                                        //         //top: 90,
                                        //         bottom: 0,
                                        //         child: Container(
                                        //           height: 45,
                                        //           // width: 120,
                                        //           child: Card(
                                        //             elevation: 5,
                                        //             child: Row(
                                        //               mainAxisAlignment:
                                        //                   MainAxisAlignment.center,
                                        //               children: [
                                        //                 InkWell(
                                        //                   onTap: () {
                                        //                     controller
                                        //                         .addedItemToCart
                                        //                         .add(controller
                                        //                             .wishlisItems[
                                        //                                 index]
                                        //                             .sId!);
                                        //                     controller
                                        //                         .addedMenuItemsToCart
                                        //                         .add(controller
                                        //                                 .wishlisItems[
                                        //                             index]);
                                        //                     // setState(() {
                                        //                     // print(addedMenuItemsToCart);
                                        //                     // });
                                        //                   },
                                        //                   child: const Text(
                                        //                     "Add",
                                        //                     style: TextStyle(
                                        //                         color:
                                        //                             Color.fromARGB(
                                        //                                 255,
                                        //                                 5,
                                        //                                 177,
                                        //                                 126),
                                        //                         fontSize: 18,
                                        //                         fontWeight:
                                        //                             FontWeight.w600,
                                        //                         fontFamily:
                                        //                             "Poppins"),
                                        //                   ),
                                        //                 )
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       )
                                        //     : Positioned(
                                        //         right: 30.0,
                                        //         left: 30.0,

                                        //         //top: 90,
                                        //         bottom: 0,
                                        //         child: Container(
                                        //           height: 45,
                                        //           // width: 120,
                                        //           child: Card(
                                        //             child: Row(
                                        //               mainAxisAlignment:
                                        //                   MainAxisAlignment.center,
                                        //               children: [
                                        //                 GestureDetector(
                                        //                   onTap: () {
                                        //                     // setState(() {
                                        //                     final item = controller
                                        //                         .addedMenuItemsToCart
                                        //                         .indexWhere((e) =>
                                        //                             e.sId ==
                                        //                             controller
                                        //                                 .wishlisItems[
                                        //                                     index]
                                        //                                 .sId);
                                        //                     controller
                                        //                         .addedMenuItemsToCart
                                        //                         .removeAt(item);
                                        //                     // addedMenuItemsToCart.removeWhere((element) => element.sId == _availableItems!.data!.menuItem![index].sId);
                                        //                     controller
                                        //                         .addedItemToCart
                                        //                         .remove(controller
                                        //                             .wishlisItems[
                                        //                                 index]
                                        //                             .sId!);
                                        //                     // print(addedMenuItemsToCart);
                                        //                     // });
                                        //                   },
                                        //                   child: const Icon(
                                        //                     Icons.remove,
                                        //                     color: Color.fromARGB(
                                        //                         255, 5, 177, 126),
                                        //                     size: 25,
                                        //                   ),
                                        //                 ),
                                        //                 Padding(
                                        //                   padding:
                                        //                       const EdgeInsets.only(
                                        //                           left: 10.0,
                                        //                           right: 10),
                                        //                   child: Text(
                                        //                       '${controller.itemCounter.value}',
                                        //                       style:
                                        //                           const TextStyle(
                                        //                         color:
                                        //                             Color.fromARGB(
                                        //                                 255,
                                        //                                 5,
                                        //                                 177,
                                        //                                 126),
                                        //                         fontSize: 18,
                                        //                         fontWeight:
                                        //                             FontWeight.bold,
                                        //                       )),
                                        //                 ),
                                        //                 GestureDetector(
                                        //                   onTap: () {
                                        //                     controller
                                        //                         .addedItemToCart
                                        //                         .add(controller
                                        //                             .wishlisItems[
                                        //                                 index]
                                        //                             .sId!);
                                        //                     controller
                                        //                         .addedMenuItemsToCart
                                        //                         .add(controller
                                        //                                 .wishlisItems[
                                        //                             index]);
                                        //                     // setState(() {
                                        //                     // print(addedMenuItemsToCart);
                                        //                     // });
                                        //                   },
                                        //                   child: const Icon(
                                        //                     Icons.add,
                                        //                     color: Color.fromARGB(
                                        //                         255, 5, 177, 126),
                                        //                     size: 25,
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        // Positioned(
                                        //     bottom: 0,
                                        //     child: Container(
                                        //       height: 40,
                                        //       width: 50,
                                        //       color: Colors.red,
                                        //     ))
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
                    })
                : const Center(
                    child: Text(
                    "No Wishlist Found !",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  )),
          );
        }),
      ),
    );
  }
}
