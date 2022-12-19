import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:hunger_bites/Admin/models/add_items_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';

import '../../models/add_shops_model.dart';
import '../../models/available_items.dart';

class AddItems extends StatefulWidget {
  AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  TextEditingController _iteNameController = TextEditingController();
  TextEditingController _iteDetailsController = TextEditingController();
  TextEditingController _itePriceController = TextEditingController();
  TextEditingController _iteDiscountController = TextEditingController();

  File? imagePath;
  File? uploadimage;
  var image;
  final _key = GlobalKey<FormState>();
  String? imageName;
  String? baseimage;
  String? apiImages;
  Future pickImage() async {
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imagePath = File(image.path);
      var imageBytes = imagePath!.readAsBytesSync();
      baseimage = base64Encode(imageBytes);
      print("imagePath $image");
      imageName = image.name;
      items.profile = baseimage;
      print(":- $imageName");
      setState(() {
        uploadimage = imagePath;
      });
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  String dollar = "\$";
  MenuItems? menuItems;
  Items items = Items();
  void clear() {
    _iteDetailsController.clear();
    _iteDiscountController.clear();
    _iteNameController.clear();
    _itePriceController.clear();
    items.profile = "";
    setState(() {
      imagePath = null;
    });
    menuItems = null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    List passData = arguments["passData"];
    if (arguments["menuData"] != null) {
      MenuItems? menuItems = arguments["menuData"];
      _iteNameController.text = menuItems!.itemName!;
      _iteDetailsController.text = menuItems.itemDetails!;
      _itePriceController.text = menuItems.price!;
      _iteDiscountController.text = menuItems.discount!;
      items.itemName = menuItems!.itemName!;
      items.itemDetails = menuItems.itemDetails!;
      items.price = menuItems.price!;
      items.discount = menuItems.discount!;
    }

    items.categoryId = passData[0];
    items.productId = passData[1];
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
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        "Add Item",
                        style: TextStyle(
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
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Item Name:",
                                style: TextStyle(
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
                                // obscureText: true,
                                controller: _iteNameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Item Name"),
                                onChanged: (value) {
                                  items.itemName = value;
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
                                "Item Details",
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
                                // obscureText: true,
                                controller: _iteDetailsController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Item Details"),
                                onChanged: (value) {
                                  items.itemDetails = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty || value.length < 4)
                                      ? 'Please enter brief Details'
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
                                "Price",
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
                                // obscureText: true,
                                controller: _itePriceController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "$dollar 25"),
                                onChanged: (value) {
                                  items.price = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty)
                                      ? 'Please enter Price'
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
                                "Discount",
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
                                controller: _iteDiscountController,
                                // obscureText: true,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Discount"),
                                onChanged: (value) {
                                  items.discount = value;
                                },
                                // validator: (String? value) {
                                //   return (value!.isEmpty)
                                //       ? 'Please enter'
                                //       : null;
                                // },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => pickImage(),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => pickImage(),
                              icon: const Icon(
                                Icons.upload_file,
                                color: Color.fromRGBO(40, 71, 135, 2),
                                size: 30,
                              ),
                            ),
                            const Text(
                              "Upload Image",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      if (imagePath != null)
                        Center(
                          child: Container(
                            width: 100,
                            child: Stack(
                              children: [
                                Image.file(
                                  imagePath!,
                                  fit: BoxFit.cover,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.pushNamed(context, "/add_category_shops",
                                        //     arguments: shops);
                                        setState(() {
                                          imagePath = null;
                                          items.profile = "";
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        // margin: EdgeInsets.only(right: 30),
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        // Navigator.pushNamed(context, "/add_category_shops",
                        //     arguments: shops);
                        // if (_key.currentState!.validate()) {
                        print("bxsjbvh");
                        var successData =
                            await HomePageApi.AddMenuItems(context, items);
                        if (successData == "done") {
                          clear();
                        }
                        // } else {
                        //   print("adnshjbgc");
                        // }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        // margin: EdgeInsets.only(right: 30),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
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
