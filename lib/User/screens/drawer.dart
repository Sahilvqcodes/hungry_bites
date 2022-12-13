import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  String? name;
  String? email;
  String? type;
  void initState() {
    getLocalStorage();
    super.initState();
  }

  getLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      email = prefs.getString("email");
      type = prefs.getString("type");
    });

    print(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 190,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 35,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      ListTile(
                        leading: Container(
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.webp'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: InkWell(
                          onTap: () {
                            // Navigator
                          },
                          child: name == null
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, "/signIn");
                                  },
                                  child: Text(
                                    "Login/Signup",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffED4322)),
                                  ),
                                )
                              : Text(name ?? ""),
                        ),
                        subtitle: Text(email ?? ""),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (type == "owner")
              ListTile(
                title: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/admin_home");
                  },
                  child: const Text(
                    'Owner Home Page',
                    style: TextStyle(
                        color: Color(0xFF3D3D3D),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {},
              ),
            ListTile(
              title: const Text(
                'My Orders',
                style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Notifications',
                style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Support',
                style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      color: Color(0xFF3D3D3D),
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
              ),
              onTap: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.clear();
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
