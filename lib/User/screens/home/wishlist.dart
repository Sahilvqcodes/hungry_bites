import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class UserWishlist extends StatelessWidget {
  const UserWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
            return ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
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
                                          "name",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15,
                                              fontFamily: "Poppins"),
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          "\$ 100}",
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
                });
          }),
        ));
  }
}
