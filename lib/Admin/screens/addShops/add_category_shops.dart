import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';

import '../../models/add_shops_model.dart';

class AddCategoryShops extends StatefulWidget {
  AddCategoryShops({super.key});

  @override
  State<AddCategoryShops> createState() => _AddCategoryShopsState();
}

class _AddCategoryShopsState extends State<AddCategoryShops> {
  TextEditingController openingtimeinput = TextEditingController();
  TextEditingController closingTimeinput = TextEditingController();
  final _key = GlobalKey<FormState>();
  List<String> allDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  List<String> selectedAllDays = [
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
  List<String> galleryImage = [];

  Future pickImage(Shops shops) async {
    try {
      List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
        // shops.galleries = galleryImage;
        // print("shops.galleries ${shops.galleries}");
      }
      // imageFileList!.forEach((e) {
      //   File imagePath = File(e.path);
      //   shops.galleries!.add(e.name);
      // });
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Shops shops = ModalRoute.of(context)!.settings.arguments as Shops;
    print(shops.category);
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
                // Container(
                //   height: 100,
                //   color: Colors.white,
                //   padding: EdgeInsets.only(bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: IconButton(
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //             icon: const Icon(
                //               Icons.arrow_back,
                //               color: Colors.black,
                //               size: 30,
                //             )),
                //       ),
                //       // const Text(
                //       //   "Categories Name",
                //       //   textAlign: TextAlign.center,
                //       //   style: TextStyle(
                //       //       fontSize: 18.0,
                //       //       fontWeight: FontWeight.w600,
                //       //       letterSpacing: 1.01,
                //       //       fontFamily: 'Poppins'),
                //       // ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Opening Days",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        // DropDownMultiSelect comes from multiselect
                        child: DropDownMultiSelect(
                          onChanged: (List<String> x) async {
                            shops.openingDays = x;
                            print(shops.openingDays);

                            // x.forEach((element) {
                            //   print(element);
                            //   shops.openingDays?.add(element);
                            //   print(shops.openingDays);
                            // });
                          },
                          options: allDays,
                          selectedValues: shops.openingDays ?? [],
                          whenEmpty: 'Select Days',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Opening Time",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    width: 80,
                                    height: 40,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      controller:
                                          openingtimeinput, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          // fillColor:
                                          //     Color.fromARGB(255, 207, 15, 15),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors
                                                    .black), //<-- SEE HERE
                                          ),
                                          hintText: "00:00"),
                                      readOnly:
                                          true, //set it true, so that user will not able to edit text
                                      onTap: () async {
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          initialTime: TimeOfDay.now(),
                                          context: context,
                                        );

                                        if (pickedTime != null) {
                                          print(pickedTime.format(
                                              context)); //output 10:51 PM
                                          DateTime parsedTime = DateFormat.jm()
                                              .parse(pickedTime
                                                  .format(context)
                                                  .toString());
                                          //converting to DateTime so that we can further format on different pattern.
                                          print(
                                              parsedTime); //output 1970-01-01 22:53:00.000
                                          String formattedTime =
                                              DateFormat('HH:mm')
                                                  .format(parsedTime);
                                          print(
                                              formattedTime); //output 14:59:00
                                          //DateFormat() is from intl package, you can format the time on any pattern you need.
                                          shops.openingTime = formattedTime;
                                          setState(() {
                                            openingtimeinput.text =
                                                formattedTime; //set the value of text field.
                                          });
                                        } else {
                                          print("Time is not selected");
                                        }
                                      },
                                      validator: (String? value) {
                                        return (value!.isEmpty)
                                            ? 'select time'
                                            : null;
                                      },
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Closing Time",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 80,
                                  height: 40,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    controller:
                                        closingTimeinput, //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.black), //<-- SEE HERE
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.black), //<-- SEE HERE
                                        ),
                                        hintText: "00:00"),
                                    readOnly:
                                        true, //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                              initialTime: TimeOfDay.now(),
                                              context: context,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);

                                      if (pickedTime != null) {
                                        print(pickedTime
                                            .format(context)); //output 10:51 PM
                                        DateTime parsedTime = DateFormat.jm()
                                            .parse(pickedTime
                                                .format(context)
                                                .toString());
                                        //converting to DateTime so that we can further format on different pattern.
                                        print(
                                            parsedTime); //output 1970-01-01 22:53:00.000
                                        String formattedTime =
                                            DateFormat('HH:mm')
                                                .format(parsedTime);
                                        print(formattedTime); //output 14:59:00
                                        //DateFormat() is from intl package, you can format the time on any pattern you need.
                                        shops.closingTime = formattedTime;
                                        setState(() {
                                          closingTimeinput.text =
                                              formattedTime; //set the value of text field.
                                        });
                                      } else {
                                        print("Time is not selected");
                                      }
                                    },
                                    validator: (String? value) {
                                      return (value!.isEmpty)
                                          ? 'select time'
                                          : null;
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Owner Name",
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
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Owner Name"),
                                onChanged: (value) {
                                  shops.ownerName = value;
                                },
                                validator: (String? value) {
                                  return (value!.isEmpty)
                                      ? 'Please Enter Owner Name!'
                                      : null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      if (imageFileList!.length != 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: MediaQuery.removeViewPadding(
                            context: context,
                            child: GridView(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 15),
                              physics: new NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ...List.generate(
                                  imageFileList!.length,
                                  (index) => Container(
                                    child: Stack(
                                      children: [
                                        Image.file(
                                          File(imageFileList![index].path),
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 100,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.pushNamed(context, "/add_category_shops",
                                                //     arguments: shops);
                                                setState(() {
                                                  imageFileList!.remove(
                                                      imageFileList![index]);
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                // margin: EdgeInsets.only(right: 30),
                                                decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 25,
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
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickImage(shops);
                            },
                            child: Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF05357c)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.black),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Upload Images',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_key.currentState!.validate()) {
                                // Navigator.pushNamed(context, "/shops_profile");
                                HomePageApi.AddShops(
                                    context, shops, imageFileList!);
                                // print(shops.address);
                                // print(shops.city);
                                // print(shops.closingTime);
                                // print(shops.email);
                                // print(shops.galleries);
                                // print(shops.landMark);
                                // print(shops.mobileNo);
                                // print(shops.openingDays);
                                // print(shops.openingTime);
                                // print(shops.ownerName);
                                // print(shops.password);
                                // print(shops.shopName);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
