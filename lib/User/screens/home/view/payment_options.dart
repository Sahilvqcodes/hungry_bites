import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({Key? key}) : super(key: key);

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Payment Options",
              style: TextStyle(
                  color: Color(0xff03060F),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins"),
            ),
            Text(
              "4 Items Total : \$74",
              style: TextStyle(
                  color: Color(0xffAEACBA),
                  fontSize: 12.0,
                  fontFamily: "Poppins"),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Payment by",
              style: TextStyle(
                  color: Color(0xff03060F),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins"),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  //   color: Colors.red,

                  ),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: new DecorationImage(
                            image:
                                new AssetImage("assets/images/Rectangle71.png"),
                            fit: BoxFit.fill,
                          ),
                          border: Border.all(color: Color(0xffAEACBA))),
                    ),
                    title: Text(
                      'Google Pay',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    trailing: CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xffAEACBA),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                      ),
                    ),
                    onTap: () => {},
                  ),
                  DottedLine(
                    dashColor: Color(0xffAEACBA),
                  ),
                  ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Color(0xffAEACBA))),
                      child: Icon(
                        Icons.apple,
                        color: Color(
                          0xffED4322,
                        ),
                        size: 25,
                      ),
                    ),
                    title: Text(
                      'Apple Pay',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    trailing: CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xffAEACBA),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                      ),
                    ),
                    onTap: () => {},
                  ),
                  DottedLine(
                    dashColor: Color(0xffAEACBA),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Add new Card",
              style: TextStyle(
                  color: Color(0xff03060F),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins"),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
              child: Container(
                height: 50,
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                    height: 35,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        // color: Colors.black,
                        border: Border.all(color: Color(0xffAEACBA))),
                    child: Icon(
                      Icons.add,
                      color: Color(
                        0xffED4322,
                      ),
                      size: 25,
                    ),
                  ),
                  title: Text(
                    'Credit & Debit Card',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
