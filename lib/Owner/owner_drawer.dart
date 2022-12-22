import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerDrawer extends StatefulWidget {
  const OwnerDrawer({super.key});

  @override
  State<OwnerDrawer> createState() => _OwnerDrawerState();
}

class _OwnerDrawerState extends State<OwnerDrawer> {
  String? name;
  String? email;
  void initState() {
    getLocalStorage();
    super.initState();
  }

  getLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      email = prefs.getString("email");
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
            ListTile(
              title: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Text(
                  'User Home Page',
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.logout_rounded,
                    color: Color(0xffED4322),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(
                        color: Color(0xffED4322),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                ],
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
