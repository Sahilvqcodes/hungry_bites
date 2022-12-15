import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

// class User {
//   String? name;
//   String? email;
//   String? username;
//   String? password;
//   String? type;
//   User({this.email, this.name, this.type, this.password, this.username});
// }

class _ForgotPasswordState extends State<ForgotPassword> {
  bool? check = false;
  //User user = User();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: const Text("Forgot Password",
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/Rectangle45.png",
                height: 150,
                width: 150,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: TextStyle(color: Color(0xffAEACBA)),
                              filled: true,
                              fillColor: Color(0xffEFEFEF),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xffED4322),
                              ),
                              hintText: 'Email'),
                          // onChanged: (value) {
                          //   user.email = value;
                          // },
                          validator: (String? value) {
                            return (value!.isEmpty || !value.contains("@"))
                                ? 'Please enter valid email'
                                : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: TextStyle(color: Color(0xffAEACBA)),
                              filled: true,
                              fillColor: Color(0xffEFEFEF),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color(0xffED4322),
                              ),
                              hintText: ' New Password'),
                          // onChanged: (value) {
                          //   user.password = value;
                          // },
                          validator: (String? value) {
                            return (value!.isEmpty || value.length < 6)
                                ? 'Password Must between 6-12 letters'
                                : null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Checkbox(
                      //             activeColor: Color(0xffED4322),
                      //             value: check,
                      //             onChanged: (bool? value) {
                      //               setState(() {
                      //                 check = value;
                      //               });
                      //             }),
                      //          Text(
                      //           "Remember Me",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 14,
                      //               color: Color(0xff03060F)),
                      //         ),
                      //       ],
                      //     ),
                      //
                      //     //SizedBox(width: 20),
                      //     TextButton(
                      //         onPressed: () {},
                      //         child: const Text(
                      //           "Forget password?",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w500,
                      //               fontSize: 14,
                      //               color: Color(0xffED4322)),
                      //         )),
                      //   ],
                      // ),
                      GestureDetector(
                        onTap: () {
                          // if (_key.currentState!.validate()) {
                          //   UserApis.LoginMethod(
                          //       context, user.password, user.email);
                          //}
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          height: 42.0,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xffED4322),
                                  Color(0xffFA6931),
                                ],
                              )),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   width: 300,
              //   child: Stack(
              //
              //
              //     children: <Widget>[
              //       Image.asset(  "assets/images/Rectangle45.png",fit: BoxFit.contain,),
              //       Positioned.fill(
              //         child: Center(
              //           child: BackdropFilter(
              //             filter: ImageFilter.blur(
              //               sigmaX: 10.0,
              //               sigmaY: 10.0,
              //             ),
              //             child: Container(
              //               color: Colors.black.withOpacity(0.1),
              //
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
