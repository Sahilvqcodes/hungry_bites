import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //automaticallyImplyLeading: false,

        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
            child: Text(
          "My Orders",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Past Orders",
              style: TextStyle(
                  color: Color(0xff03060F),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins"),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
               // color: Colors.yellow,
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Major Tom',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Container(
                            child: Row(
                          children: [
                            CircleAvatar(
                              radius: 8.0,
                              backgroundColor: Color(0xff29B306),
                              child: Icon(
                                Icons.done,
                                size: 12,
                              ),
                            ),
                            SizedBox(width: 2.0,),
                            Text("Delivered", style: TextStyle(
                                color: Color(0xff000000),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 10),),
                          ],
                        )),
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Langdon Drive , Cambridge,Ont", style: TextStyle(
                            color: Color(0xff818181
                            ),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                            fontSize: 10),),
                        Text("\$74", style: TextStyle(
                            color: Color(0xff000000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14),),
                      ],
                    ),
                    onTap: () => {},
                  ),
                  DottedLine(
                    dashColor: Color(0xffAEACBA),
                  ),
                  ListTile(
                    title: Text("Shahi Paneer,Shahi Paneer,Shahi Paneer", style: TextStyle(
                        color: Color(0xff818181),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 10),),
                    subtitle: Text("December 16, 5.26pm",
                      style: TextStyle(
                        color: Color(0xff818181),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                        fontSize: 8.0),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonBar(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.40,


                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xffED4322)),
                                onPressed: () {


                                },
                                child: Text('Select Address', style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width*0.40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xffFFDBCE)),
                                onPressed: () {


                                },
                                child: Text('Add Address', style: TextStyle(
                                    color: Color(0xffED4322),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
