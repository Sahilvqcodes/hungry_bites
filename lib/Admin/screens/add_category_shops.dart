import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';

class AddCategoryShops extends StatefulWidget {
  AddCategoryShops({super.key});

  @override
  State<AddCategoryShops> createState() => _AddCategoryShopsState();
}

class _AddCategoryShopsState extends State<AddCategoryShops> {
  TextEditingController openingtimeinput = TextEditingController();
  TextEditingController closingTimeinput = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PreferredSize(
        preferredSize: size,
        child: Container(
          height: size.height,
          child: SingleChildScrollView(
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
                      // const Text(
                      //   "Categories Name",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       fontSize: 18.0,
                      //       fontWeight: FontWeight.w600,
                      //       letterSpacing: 1.01,
                      //       fontFamily: 'Poppins'),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  width: size.width - 40,
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
                          onChanged: (List<String> x) {},
                          options: allDays,
                          selectedValues: [],
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
                                    width: 120,
                                    height: 40,
                                    child: TextField(
                                      controller:
                                          openingtimeinput, //editing controller of this TextField
                                      decoration: const InputDecoration(
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
                                          icon: Icon(
                                              Icons.timer), //icon of text field
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

                                          setState(() {
                                            openingtimeinput.text =
                                                formattedTime; //set the value of text field.
                                          });
                                        } else {
                                          print("Time is not selected");
                                        }
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
                                    width: 120,
                                    height: 40,
                                    child: TextField(
                                      controller:
                                          closingTimeinput, //editing controller of this TextField
                                      decoration: const InputDecoration(
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
                                          icon: Icon(
                                              Icons.timer), //icon of text field
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

                                          setState(() {
                                            closingTimeinput.text =
                                                formattedTime; //set the value of text field.
                                          });
                                        } else {
                                          print("Time is not selected");
                                        }
                                      },
                                    )),
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
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Store Name",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                    hintText: "Store Name"),
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
                          "Galleries",
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
                                  (index) => Image.file(
                                    File(imageFileList![index].path),
                                    fit: BoxFit.cover,
                                    width: 60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickImage();
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
                      SizedBox(
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
