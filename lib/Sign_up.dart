import 'dart:core';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hunger_bites/User/Apis/allApi.dart';
import 'package:hunger_bites/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  bool? isCheck = false;
  final _key = GlobalKey<FormState>();
  User user = User();
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
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Text("Sign Up ",
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/Rectangle45.png",
                // height: 150,
                // width: 150,
              ),
              Container(
                 padding: EdgeInsets.all(10),
                //margin: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      // height: 42,
                      child: TextFormField(
                        decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Color(0xffAEACBA)),
                            filled: true,
                            fillColor: Color(0xffEFEFEF),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Color(0xffED4322),
                            ),
                            hintText: 'Name'),
                        onChanged: (value) {
                          user.name = value;
                        },
                        validator: (String? value) {
                          return (value!.isEmpty || value.length < 4)
                              ? 'Please enter valid Name'
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // height: 42,
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
                              Icons.person_outline,
                              color: Color(0xffED4322),
                            ),
                            hintText: 'Username'),
                        onChanged: (value) {
                          user.username = value;
                        },
                        validator: (String? value) {
                          return (value!.isEmpty || value.length < 4)
                              ? 'Username Length Must between 4-8 letters'
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // height: 42,
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
                            hintText: 'Enter Your Email'),
                        onChanged: (value) {
                          user.email = value;
                        },
                        validator: (String? value) {
                          return (value!.isEmpty || !value.contains("@"))
                              ? 'Please enter valid email'
                              : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                          labelText: "Password",
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(200)),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(color: Color(0xffAEACBA)),


                          fillColor: Color(0xffEFEFEF),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color(0xffED4322),
                          ),
                          suffixIcon: Padding(
                            padding:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                _obscured
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                size: 24,
                              ),
                            ),
                          ),
                          hintText: 'Password'),
                      onChanged: (value) {
                        user.password = value;
                      },
                      validator: (String? value) {
                        return (value!.isEmpty || value.length < 6)
                            ? 'Password Must between 6-12 letters'
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            activeColor: Color(0xffED4322),
                            value: isCheck,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheck = value;
                              });
                            }),
                        const Text(
                          "Remember Me",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff03060F)),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          UserApis.RegisterUser(context, user.email, user.name,
                              user.password, user.username);
                        }
                      },
                      child: Container(
                        height: 42.0,
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
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    text: ' Have not any account?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign In',
                          style: TextStyle(
                              color: Color(0xffED4322),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/signIn');
                            })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
