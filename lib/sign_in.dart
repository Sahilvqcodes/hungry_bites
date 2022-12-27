import 'dart:core';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hunger_bites/User/screens/category_shop_list.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User/Apis/allApi.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class User {
  String? name;
  String? email;
  String? username;
  String? password;
  String? type;
  User({this.email, this.name, this.type, this.password, this.username});
}

class _SignInState extends State<SignIn> {
  final textFieldFocusNode = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscured = true;
  late bool _isLoaderVisible;
  String? _password;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void initState() {
    _isLoaderVisible = false;
    _loadUserEmailPassword();
    super.initState();
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          isChecked = true;
        });
        _emailController.text = _email;
        _passwordController.text = _password;
        user.email = _email;
        user.password = _password;
      }
    } catch (e) {
      print(e);
    }
  }

  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }
  User user = User();
  void _handleRemeberme() {
    print("SharedPreferences");

    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", true);
        prefs.setString('email', user.email!);
        prefs.setString('password', user.password!);
      },
    );
  }

  bool isCheck = false;

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
        title: const Text("Sign In",
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
      ),
      body: LoaderOverlay(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 27,
                      color: Color(0xffED4322)),
                ),
                const Text("Sign In to Continue ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87)),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
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
                      const SizedBox(height: 22),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscured,
                        focusNode: textFieldFocusNode,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior
                                .never, //Hides label on focus or if filled
                            labelText: "Password",
                            filled: true,
                            isDense: true,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle:
                                const TextStyle(color: Color(0xffAEACBA)),
                            fillColor: Color(0xffEFEFEF),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xffED4322),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: const Color(0xffED4322),
                                  value: isCheck,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheck = value!;
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

                          //SizedBox(width: 20),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/forgot_password');
                              },
                              child: const Text(
                                "Forget password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xffED4322)),
                              )),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_key.currentState!.validate()) {
                            context.loaderOverlay.show();
                            setState(() {
                              _isLoaderVisible = context.loaderOverlay.visible;
                            });
                            await UserApis.LoginMethod(
                                context, user.password, user.email);
                            if (isCheck) {
                              _handleRemeberme;
                            }
                            if (_isLoaderVisible) {
                              context.loaderOverlay.hide();
                            }
                            setState(() {
                              _isLoaderVisible = context.loaderOverlay.visible;
                            });
                          }
                        },
                        child: Container(
                          height: 42.0,
                          width: 300,
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
                              'Sign In',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
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
                SizedBox(height: 100),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have not an account?',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  color: Color(0xffED4322),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/signUp');
                                })
                        ]),
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
