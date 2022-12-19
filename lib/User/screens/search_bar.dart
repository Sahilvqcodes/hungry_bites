import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Container(
          height: 40,
          child: Image.asset(
            "assets/images/Rectangle45.png",
          ),
        ),


      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/address_page ');
        },
        child: Container(
          height: 42.0,
         width: MediaQuery.of(context).size.width*0.9,


          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffED4322),
                Color(0xffFA6931),
              ],
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4 item ',
                  style: TextStyle(
                    fontSize:10.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'View Cart ',
                  style: TextStyle(
                    fontSize:10.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),



      body:    Padding(
        padding:  EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: 50,
                  child: TextField(
                    cursorColor: Color(0xffED4322),
                   // controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black87, width: 12.0),
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details_page');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        //SizedBox(height: 50),
                                        Text(
                                          "Shahi Paneer",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15,
                                              fontFamily: "Poppins"),
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          "\$14",
                                          style: TextStyle(
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
                                                  Icon(
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

                                        //     ReadMoreText(
                                        //       "We are a small craft, tea brewery in the Drumbo hills, overlooking the"
                                        //               " city of Belfast, Northern Ireland. We want to help people discover"
                                        //               " the magic of tea by sourcing great "
                                        //               "loose leaf tea and brewing delicious kombucha and"
                                        //               " other innovative, healthy tea drinks.",
                                        //   trimLines:2,
                                        //  // colorClickableText: Colors.pink,
                                        //  trimMode: TrimMode.Line,
                                        //   trimCollapsedText: 'more',
                                        //   trimExpandedText: '',
                                        //   //moreStyle: TextStyle(fontSize:5, fontWeight: FontWeight.bold),
                                        // ),

                                        SizedBox(height: 5.0),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Stack(children: [
                                  Container(
                                    // color: Colors.red,
                                    height: 150,
                                    width: 150,
                                  ),
                                  Positioned(
                                    top: 5.0,
                                    right: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20.0)
                                        /*  borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))*/
                                      ),
                                      child: Image.asset(
                                        'assets/images/Rectangle35.png',
                                        height: 130,
                                        width: 130,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 15.0,
                                    left: 15.0,
                                    //top: 90,
                                    bottom: 0,
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: _decrementCounter,
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: Color(0xffED4322),
                                                )),
                                            Text('$_counter',
                                                style: TextStyle(
                                                  color: Color(0xffED4322),
                                                )),
                                            IconButton(
                                                onPressed: _incrementCounter,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Color(0xffED4322),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ]),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
        ),
      ),
    );
  }
}
