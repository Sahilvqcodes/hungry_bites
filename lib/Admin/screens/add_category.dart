import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hunger_bites/Admin/Apis/home_api.dart';
import 'package:image_picker/image_picker.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _key = GlobalKey<FormState>();
  void _cancel() {
    Navigator.pop(context);
  }

  String? categoryName;
  File? imagePath;
  File? uploadimage;

  String? imageName;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imagePath = File(image.path);
      print("imagePath $image");
      imageName = image.name;

      print(":- $imageName");
      setState(() {
        uploadimage = imagePath;
      });
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Category'),
      content: Form(
        key: _key,
        child: Container(
          height: 330,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                // height: 42,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Color(0xffAEACBA)),
                      filled: true,
                      fillColor: Color(0xffEFEFEF),
                      // prefixIcon: Icon(
                      //   Icons.email_outlined,
                      //   color: Color(0xffED4322),
                      // ),
                      hintText: 'Category Name'),
                  onChanged: (value) {
                    // user.name = value;
                    categoryName = value;
                  },
                  validator: (String? value) {
                    return (value!.isEmpty || value.length < 3)
                        ? 'Please enter valid Name'
                        : null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => pickImage(),
                    icon: Icon(
                      Icons.upload_file,
                      color: Color.fromRGBO(40, 71, 135, 2),
                    ),
                  ),
                  uploadimage != null
                      ? Expanded(child: Text("${imageName}"))
                      : Text("Upload Image")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  HomePageApi.AddCategory(categoryName, imagePath);
                },
                child: Container(
                  height: 50.0,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffED4322),
                        Color(0xffFA6931),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
