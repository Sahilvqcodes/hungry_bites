import 'package:flutter/material.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:hunger_bites/Admin/screens/add_category.dart';
import 'package:hunger_bites/Admin/screens/drawer.dart';
import 'package:hunger_bites/User/model/category_list.dart';

class AdminHomePage extends StatefulWidget {
  AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  // ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showAddCategoryDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: AdminDrawer(),
      body: SafeArea(
        child: FutureBuilder(
            future: HomePageApi.getCategoryList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              CategoryList? _categoryList = snapshot.data;
              print("_categoryList $_categoryList");
              if (snapshot.data == null) {
                return Container();
              }
              return Container(
                height: size.height,
                // padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.sort,
                                  color: Colors.black,
                                  size: 40,
                                )),
                          ),
                          const Text(
                            "Categories",
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
                      height: size.height - 185,
                      margin: EdgeInsets.all(20),
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9 / 8,
                          mainAxisSpacing: 5,
                        ),
                        children: [
                          GestureDetector(
                            onTap: _showAddCategoryDialog,
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          Icons.add,
                                          size: 50,
                                          color: Colors.white,
                                        )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Add Category",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          ...List.generate(
                            _categoryList!.data!.length,
                            (index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/admin_category_shop_list");
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        height: 60,
                                        child: Image.network(
                                          "http://157.245.97.144:8000/category/${_categoryList!.data![index].profile}",
                                          width: 80,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${_categoryList!.data![index].name}",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
