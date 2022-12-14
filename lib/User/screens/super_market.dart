import 'package:flutter/material.dart';

import '../model/category_list.dart';
import '../model/category_list.dart';


class SuperMarket extends StatefulWidget {
  const SuperMarket({Key? key}) : super(key: key);

  @override
  State<SuperMarket> createState() => _SuperMarketState();
}

class _SuperMarketState extends State<SuperMarket> {
  List<Data> dataList = [
    Data(
        assetsImage: "assets/images/Rectangle42.png",
        title: 'Munchoes'
    ),
    Data(
        assetsImage: "assets/images/Rectangl 423).png",
        title: 'Instant and Frozen food'
    ),
    Data(
        assetsImage: "assets/images/Rectangl 423).png",
        title: 'Instant and Frozen food'
    ),
    Data(
        assetsImage: "assets/images/Rectangle423).png",
        title: 'Tea , Coffee & Drinks'
    ),

    Data(
        assetsImage: "assets/images/Rectangle424).png",
        title: 'Bakery & Biscuits',
    ),
    Data(
      assetsImage: 'assets/images/Rectangle425).png',
      title:'Sweet Tooth',
    ),
    Data(
      assetsImage: "assets/images/Rectangle426).png",
      title: 'Floor,Rice,Pulses,Oil',
    ),
    Data(
      assetsImage: "assets/images/Rectangle427).png",
      title: 'Dry Fruits',
    ),
    Data(
      assetsImage: "assets/images/Rectangle428).png",
      title: 'Chicken & Fish',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    Text(
                      "Super Market Name",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
              ),
              GridView.builder(


                itemCount: dataList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // padding: const EdgeInsets.symmetric(horizontal: 30),
                // itemCount: args.length,
                itemBuilder: (context , index) {
                  Data allctaegories = dataList[index];
                  return  Card(
                    child: Column(
                      children: [

                         Container(




                           child: Image.asset(
                              allctaegories.assetsImage,
                              fit: BoxFit.cover,
                            ),
                         ),

                        SizedBox(height: 5.0),


                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(

                              allctaegories.title,textAlign:TextAlign.center,
                              style: TextStyle(
                                fontSize:12,fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent:180,
                ),

              ),
            ],
          ),
        ),
      ),

    );
  }
}

class Data {
  String assetsImage;
  String title;
  Data({
    required this.assetsImage,
    required this.title,
  });
}
