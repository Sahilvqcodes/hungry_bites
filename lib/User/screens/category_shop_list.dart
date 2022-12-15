import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as List;
    print(args);
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,

          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(
              child: Text(
                "Restaurants",
                style: TextStyle(color: Colors.black),
              )),
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios),)
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          height: size.height,


          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.3,
                    height: 50,
                    child: TextField(
                      cursorColor: Color(0xffED4322),
                      controller: controller,
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


              SizedBox(
                height: 15,
              ),


              SizedBox(
                height: size.height - 150,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/details_page');
                          // arguments: restaurantImage);
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(0),
                            child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Rectangle35.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: <Widget>[
                                          Text("Major Tom", style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Color(0xff000000),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),),
                                          SizedBox(height: 2.0),
                                          Row(

                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Color(
                                                    0xffED4322),
                                                radius: 10,
                                                child: Icon(
                                                  Icons.star, size: 18,
                                                  color: Colors.white,),
                                              ),
                                              SizedBox(width: 5.0),
                                              Text("3.8", style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w700,)),
                                              SizedBox(width: 5.0),
                                              Text("(100+)", style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w700,)),
                                              SizedBox(width: 2.0),
                                              Text(".22 mins", style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w700,))
                                            ],
                                          ),
                                          SizedBox(height: 2.0),
                                          RichText(
                                            text: TextSpan(
                                              children: [


                                                WidgetSpan(
                                                  child: Icon(Icons
                                                      .location_on_outlined,
                                                      size: 15),
                                                ),
                                                TextSpan(

                                                  text: "Langdon Drive......",
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Color(0xff818181),
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height:50,)


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
        ),
      ),
    );
  }
}
