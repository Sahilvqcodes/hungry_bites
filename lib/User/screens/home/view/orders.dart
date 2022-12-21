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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //automaticallyImplyLeading: false,

        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        Container(
          color: Colors.white,
          child: DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Past Orders",
                    style: TextStyle(
                        color: Color(0xff03060F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins"),
                  ),
                ),
                TabBar(
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: const Color.fromARGB(255, 80, 78, 78),
                  indicatorWeight: 3,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  // indicatorPadding: EdgeInsets.symmetric(vertical: 0),
                  tabs: const [
                    Text(
                      "Restaurants",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                    ),
                    Text(
                      "Super Market",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),
                Container(
                  height: size.height - 200,
                  child: TabBarView(
                    children: <Widget>[
                      ...List.generate(2, ((i) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  // color: Colors.yellow,
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Major Tom',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Container(
                                              child: Row(
                                            children: const [
                                              CircleAvatar(
                                                radius: 8.0,
                                                backgroundColor:
                                                    Color(0xff29B306),
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
                                              Text(
                                                "Delivered",
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Langdon Drive , Cambridge,Ont",
                                            style: TextStyle(
                                                color: Color(0xff818181),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            "\$74",
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      onTap: () => {},
                                    ),
                                    const DottedLine(
                                      dashColor: Color(0xffAEACBA),
                                    ),
                                    const ListTile(
                                      title: Text(
                                        "Shahi Paneer,Shahi Paneer,Shahi Paneer",
                                        style: TextStyle(
                                            color: Color(0xff818181),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                      ),
                                      subtitle: Text(
                                        "December 16, 5.26pm",
                                        style: TextStyle(
                                            color: Color(0xff818181),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 8.0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ButtonBar(
                                          children: <Widget>[
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.40,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Color(
                                                              0xffED4322)),
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Select Address',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0),
                                                  ),
                                                )),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.40,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Color(
                                                              0xffFFDBCE)),
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Add Address',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffED4322),
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: size.width * 0.9,
                                      child: const Divider(
                                        height: 1,
                                        thickness: 1.1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      })),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
