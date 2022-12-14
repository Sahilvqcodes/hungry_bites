import 'package:flutter/material.dart';
import 'package:hunger_bites/Admin/screens/addShops/addItems.dart';

class ShopsProfile extends StatefulWidget {
  const ShopsProfile({super.key});

  @override
  State<ShopsProfile> createState() => _ShopsProfileState();
}

class _ShopsProfileState extends State<ShopsProfile> {
  // void _showAddItemsDialog() async {
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AddItems();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: size.height - 40,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Rectangle31.png",
                    fit: BoxFit.cover,
                    width: size.height - 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Major Tom",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 139, 138, 138),
                      ),
                      Text(
                        "mohali,Punjab",
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 138, 138),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 20, right: 15, left: 15),
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ADD NEW ITEM",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/add_items");
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Added Items",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    2,
                    (index) => Container(
                      height: 130,
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 130,
                            // height: 110,
                            child: Image.asset(
                              "assets/images/Rectangle33.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 180,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, bottom: 5, top: 10),
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: Color.fromARGB(255, 139, 138, 138),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "mohali,Punjab",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 139, 138, 138),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 0.0,
                                    ),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 220, 28, 28),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
