import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CategoryShopList extends StatefulWidget {
  CategoryShopList({Key? key}) : super(key: key);

  @override
  State<CategoryShopList> createState() => _CategoryShopListState();
}

class _CategoryShopListState extends State<CategoryShopList> {


  // List restaurantImage = [
  //   {'image': 'assets/images/Vector.png'},
  //   {'image': 'assets/images/Vector1.png'},
  //   {'image': 'assets/images/Vector1.png'},
  //   {'image': 'assets/images/Vector1.png'},
  // ];
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    print(args);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          // padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:  Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    Text(
                      "Restaurants",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
              ),
              Container(
                height: size.height - 150,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: args.length,
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context,'/details_page');
                           // arguments: restaurantImage);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset(
                            'assets/images/Rectangle35.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'London Hall',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      RatingBar.builder(
                        //initialRating: 3,
                        //minRating: 1,
                        direction: Axis.horizontal,
                        //allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),

                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text("(4.9)",style: TextStyle(   fontFamily: "Poppins",fontSize:12),)
                        ],
                      ),






                          // Text(
                          //   'Subtitle',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 15,
                          //   ),
                          // )
                        ],
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
