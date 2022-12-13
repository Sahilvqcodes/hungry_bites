import 'package:flutter/material.dart';

class AdminCategoryShopList extends StatelessWidget {
  const AdminCategoryShopList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PreferredSize(
        preferredSize: size,
        child: Container(
          height: size.height,
          // color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                    const Text(
                      "Categories Name",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.01,
                          fontFamily: 'Poppins'),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        // controller: _controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black87, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          suffixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffAEACBA)),
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
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 40, right: 15, left: 15),
                color: Colors.white,
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ADD NEW RESTAURANTS",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/add_category_shops");
                      },
                      child: Container(
                        height: 40,
                        width: 40,
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
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: const Text(
                        "Availble Restaurants",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...List.generate(
                      2,
                      (index) => Container(
                        height: 140,
                        color: Colors.white,
                        margin:
                            EdgeInsets.only(bottom: 10, right: 15, left: 15),
                        child: Row(children: [
                          Container(
                            width: 170,
                            height: 110,
                            child: FittedBox(
                              child: Image.asset(
                                "assets/images/Rectangle33.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 230,
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
                                          color: Color.fromARGB(
                                              255, 139, 138, 138),
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
                                        right: 20.0,
                                      ),
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 220, 28, 28),
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
      ),
    );
  }
}
