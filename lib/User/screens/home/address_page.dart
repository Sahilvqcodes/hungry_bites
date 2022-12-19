import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            "Major Tom",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_location_alt_outlined,
                      color: Color(0xffED4322),
                      size: 18,
                    ),
                    Text(
                      'You are in a new location',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontSize: 14),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonBar(
                    children: <Widget>[
                      SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            onPressed: () {
                              _settingModalBottomSheet(context);
                            },
                            child: Text('Select Address'),
                          )),
                      SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            onPressed: () {
                              _moreModalBottomSheet(context);
                            },
                            child: Text('Add Address'),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Items",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffED4322)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shahi Paneer",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Color(0xff03060F)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffEFEFEF),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                )),
                          ),
                          Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                //shape: BoxShape.circle,
                                color: Color(0xffEFEFEF),
                              ),
                              child: Center(child: Text("2"))),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffEFEFEF),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                )),
                          ),
                          Text("\$52")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DottedLine(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Write instructions for restaurant",
                        style: (TextStyle(
                            color: Color(0xffAEACBA),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                      Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Color(0xffED4322)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Bill Details"),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Items",
                        style: (TextStyle(
                            color: Color(0xffAEACBA),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                      Text(
                        "\$56",
                        style: (TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fees",
                        style: (TextStyle(
                            color: Color(0xffAEACBA),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                      Text(
                        "\$18",
                        style: (TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DottedLine(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To Pay",
                        style: (TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                      Text(
                        "\$18",
                        style: (TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins")),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.white,
              child: RichText(
                text: TextSpan(
                    text: ' Note:',
                    style: TextStyle(
                        color: Color(0xffED4322),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting '
                            'industry. Lorem Ipsum has been the industry'
                            ' standard dummy text ever since the 1500s, when an unknown '
                            'printer took a galley of type and scrambled it to make a type specimen book'
                            ' It has survived not only five centuries, but also the leap into'
                            '    electronic typesetting, remaining essentially unchanged.',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: Color(0xff000000),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _settingModalBottomSheet(context) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Choose a delivery address',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                trailing: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onTap: () => {},
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.black,
                      border: Border.all(color: Color(0xffAEACBA))),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color(
                      0xffED4322,
                    ),
                    size: 20,
                  ),
                ),
                title: Text(
                  'Townhouse',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                subtitle: Text(
                    "120 St. Andrews Dr,Burlington , Ontario L8K 6C3",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12)),
                onTap: () => {},
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.black,
                      border: Border.all(color: Color(0xffAEACBA))),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color(
                      0xffED4322,
                    ),
                    size: 20,
                  ),
                ),
                title: Text(
                  'Townhouse',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                subtitle: Text(
                    "120 St. Andrews Dr,Burlington , Ontario L8K 6C3",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12)),
                onTap: () => {},
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Color(0xffAEACBA))),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color(
                      0xffED4322,
                    ),
                    size: 20,
                  ),
                ),
                title: Text(
                  'Townhouse',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                subtitle: Text(
                    "120 St. Andrews Dr,Burlington , Ontario L8K 6C3",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12)),
                onTap: () => {},
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      });
}



_moreModalBottomSheet(context) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Choose a delivery address',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                trailing: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onTap: () => {},
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,


                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                    labelText: "Name",
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


                    ),
                    hintText: 'City,Town'),
                onChanged: (value) {


                },
                validator: (String? value) {
                  return (value!.isEmpty || value.length < 6)
                      ? 'Password Must between 6-12 letters'
                      : null;
                },
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,


                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
                    labelText: "House no,",
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


                    ),
                    hintText: 'Password'),
                onChanged: (value) {


                },
                validator: (String? value) {
                  return (value!.isEmpty || value.length < 6)
                      ? 'Password Must between 6-12 letters'
                      : null;
                },
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,


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


                    ),
                    hintText: 'Password'),
                onChanged: (value) {


                },
                validator: (String? value) {
                  return (value!.isEmpty || value.length < 6)
                      ? 'Password Must between 6-12 letters'
                      : null;
                },
              ),
              Divider(
                thickness: 2,
                color: Color(0xffAEACBA),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      });
}
