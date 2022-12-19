import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class CategoryItems extends StatelessWidget {
  final data;
  String? categoryName;
  Color? categoryColor;

  CategoryItems({
    Key? key,
    this.data,
    this.categoryName,
    this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: categoryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          children: [
            Container(
              // color: Colors.white,
              // height: 60,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Image.network(
                "http://157.245.97.144:8000/category/$data",
                // width: 80,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${categoryName}",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  final popularItems;

  const Popular({Key? key, this.popularItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Container(
            height: 170,
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    // height: 100,
                    // width: 300,
                    child: Image.asset(
                  popularItems,
                  fit: BoxFit.cover,
                )),
                const SizedBox(height: 10),
                const Text(
                  "Burger Point",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 10,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const Text(
                      "(4.9)",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        const Positioned(
            top: 8.0,
            right: 15.0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black87,
                size: 15,
              ),
            ))
      ],
    );
  }
}

class GroceryItems extends StatelessWidget {
  final allGrocery;

  const GroceryItems({Key? key, this.allGrocery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  // height:150,
                  //   width: 350,
                  child: Image.asset(
                allGrocery,
                fit: BoxFit.fitWidth,
              )),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Text(
                      "Gerrard Square (Toronto) Store , 1000\nGerrard st E , Toronto,ON M4AM",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFFD705),
                        ),
                        Text(
                          "(4.2)",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
            top: 25.0,
            right: 25.0,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffEF0101),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Upto",
                    style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "20%",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Off",
                    style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
// class YourCart extends StatefulWidget {
//
//
//   const YourCart({Key? key}) : super(key: key);
//
//   @override
//   State<YourCart> createState() => _YourCartState();
// }
//
// class _YourCartState extends State<YourCart> {
//
//
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _decrementCounter() {
//     if (_counter > 0) {
//       setState(() {
//         _counter--;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color:Colors.white,
//      // height: 500,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             //  SizedBox(height: 50),
//                                     Text(
//                                       "Shahi Paneer",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w800,
//                                           fontSize: 15,
//                                           fontFamily: "Poppins"),
//                                     ),
//               SizedBox(height: 2.0),
//                                     Text(
//                                       "\$14",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w800,
//                                           fontSize: 18,
//                                           fontFamily: "Poppins",
//                                           color: Color(0xffED4322)),
//                                     ),
//       Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                               children: [
//                               RatingBar.builder(
//
//                               initialRating: 3,
//                               minRating: 1,
//                               direction: Axis.horizontal,
//                               allowHalfRating: true,
//                               itemCount: 5,
//                               itemSize: 15,
//                               //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                               itemBuilder: (context, _) => Icon(
//                                 Icons.star,
//                                 color: Colors.amber,
//                               ),
//                               onRatingUpdate: (rating) {
//                                 print(rating);
//                               },
//
//                             ),
//                                 Text("(3.9)")
//                               ],
//                             ),
//
//               // ReadMoreText(
//               //                             "We are a small craft, tea brewery in the Drumbo hills, overlooking the"
//               //                                     " city of Belfast, Northern Ireland. We want to help people discover"
//               //                                     " the magic of tea by sourcing great "
//               //                                     "loose leaf tea and brewing delicious kombucha and"
//               //                                     " other innovative, healthy tea drinks.",
//               //                       trimLines:2,
//               //                       colorClickableText: Colors.pink,
//               //                      trimMode: TrimMode.Line,
//               //                       trimCollapsedText: 'Show more',
//               //                       trimExpandedText: 'Show less',
//               //                       moreStyle: TextStyle(fontSize:2, fontWeight: FontWeight.bold),
//               //                     ),
//
//             ],
//           ),
//           Stack(
//             children: [
//               Card(
//                                   child: Container(
//                                     height: 150,
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/images/Rectangle35.png'),
//                                             fit: BoxFit.fill)),
//                                   ),
//                                 ),
//               Positioned(
//                                       top: 120,
//                                       left: 10,
//                                       child: Card(
//                                         elevation: 10,
//                                         child: Container(
//                                           height: 40,
//                                           width: 120,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(10),
//                                             color: Colors.white,
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               IconButton(
//                                                   onPressed: _decrementCounter,
//                                                   icon: Icon(
//                                                     Icons.remove,
//                                                     color: Color(0xffED4322),
//                                                   )),
//                                               Text('$_counter',
//                                                   style: TextStyle(
//                                                     color: Color(0xffED4322),
//                                                   )),
//                                               IconButton(
//                                                   onPressed: _incrementCounter,
//                                                   icon: Icon(
//                                                     Icons.add,
//                                                     color: Color(0xffED4322),
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//
//               Positioned(
//                   top:250,child: SizedBox(height: 20,))
//
//             ],
//           )
//
//         ],
//       ),
//     );
//   }
// }
//
