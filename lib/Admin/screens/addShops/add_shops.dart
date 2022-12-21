import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';

import '../../../User/model/category_list.dart';
import '../../models/add_shops_model.dart';
import '../../models/available_shops.dart';

class AddShops extends StatefulWidget {
  AddShops({super.key});

  @override
  State<AddShops> createState() => _AddShopsState();
}

class _AddShopsState extends State<AddShops> {
  TextEditingController shopsNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  final _key = GlobalKey<FormState>();
  List<String> allDays = [
    "All Days",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  File? imagePath;
  File? uploadimage;

  String? imageName;
  List<XFile>? imageFileList = [];

  Future pickImage() async {
    try {
      List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
      }
      // imagePath = File(image.path);
      // print("imagePath $image");
      // imageName = image.name;

      // print(":- $imageName");
      setState(() {
        // uploadimage = imagePath;
      });
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  ProductId? _productId;
  var arguments;
  List? passData;
  Shops shops = Shops();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        setState(() {
          arguments = (ModalRoute.of(context)?.settings.arguments ??
              <String, dynamic>{}) as Map;
          passData = arguments["passData"];
          if (arguments["shopsData"] != null) {
            _productId = arguments["shopsData"];
            shopsNameController.text = _productId!.shopName ?? "";
            mobileNoController.text = _productId!.phoneNo ?? "";
            addressController.text = _productId!.address ?? "";
            cityController.text = _productId!.city ?? "";
            landMarkController.text = _productId!.landMark ?? "";

            shops.shopName = _productId!.shopName ?? "";
            shops.mobileNo = _productId!.phoneNo ?? "";
            shops.address = _productId!.address ?? "";
            shops.city = _productId!.city ?? "";
            shops.landMark = _productId!.landMark ?? "";
            shops.productId = _productId!.sId;
            // shops.galleries = _productId!.profile;
            // shops.closingTime = _productId!.closingTime;
            // shops.openingTime = _productId!.openingTime;
            // shops.openingDays = _productId!.openingDay;
            // shops.ownerName = _productId!.name;
          }
        });

        shops.category = passData![0];
        shops.categoryId = passData![1];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // String categoryId = passData[1];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          "assets/images/logo.png",
          scale: 10,
        ),
      ),
      body: Form(
        key: _key,
        child: Container(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        "Add ${shops.category}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "${shops.category} Name",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: TextFormField(
                                controller: shopsNameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: " ${shops.category} Name"),
                                onChanged: (value) {
                                  shops.shopName = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty || value.length < 4)
                                      ? 'Please enter valid Name'
                                      : null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Mobile No.",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              child: TextFormField(
                                controller: mobileNoController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Mobile No."),
                                onChanged: (value) {
                                  shops.mobileNo = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty || value.length < 10)
                                      ? 'Please enter valid Mobile Number'
                                      : null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (arguments["shopsData"] == null)
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, right: 20),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "xyz@gmail.com",
                                  ),
                                  onChanged: (value) {
                                    shops.email = value;
                                  },
                                  validator: (String? value) {
                                    return (value!.isEmpty ||
                                            !value.contains("@"))
                                        ? 'Please enter Email'
                                        : null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (arguments["shopsData"] == null)
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, right: 20),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      // labelText: 'Password',
                                      hintText: "Password"),
                                  onChanged: (value) {
                                    shops.password = value;
                                  },
                                  validator: (String? value) {
                                    return (value!.isEmpty || value.length < 6)
                                        ? 'Please Password between 6-12 digits'
                                        : null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              child: TextFormField(
                                controller: addressController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Address"),
                                onChanged: (value) {
                                  shops.address = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty || value.length < 6)
                                      ? 'Please enter valid Address'
                                      : null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "City/Town",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              child: TextFormField(
                                controller: cityController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "City/Town"),
                                onChanged: (value) {
                                  shops.city = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty)
                                      ? 'Please enter '
                                      : null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Landmark",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              child: TextFormField(
                                controller: landMarkController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Landmark"),
                                onChanged: (value) {
                                  shops.landMark = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty)
                                      ? 'Please enter Landmark'
                                      : null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          Navigator.pushNamed(context, "/add_category_shops",
                              arguments: {
                                "shops": shops,
                                "shopsData": arguments["shopsData"] == null
                                    ? null
                                    : arguments["shopsData"]
                              });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(right: 30),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
