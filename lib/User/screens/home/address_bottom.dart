import 'package:flutter/material.dart';

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