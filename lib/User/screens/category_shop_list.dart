import 'package:flutter/material.dart';

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
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
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
                    return Container(
                      // height: 50,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    child: Image.asset(
                                  'assets/images/Rectangle35.png',
                                  fit: BoxFit.cover,
                                )),
                                Text(
                                  'London Hall',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Subtitle',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
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
