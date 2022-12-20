import 'package:flutter/material.dart';

class HotOffers extends StatelessWidget {
  final Items;
  const HotOffers({super.key, this.Items});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Container(
            height: 180,
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 130,
                    child: Image.asset(
                      Items['image'],
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: 10),
                Text(
                  Items['name'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Up To ${Items['offer']}% 0ff",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        // const Positioned(
        //   // top: 8.0,
        //   // right: 8.0,
        //   // left: 65,
        //   right: 60,
        //   bottom: 0,
        //   child: CircleAvatar(
        //     radius: 10,
        //     backgroundColor: Colors.white,
        //     child: Icon(
        //       Icons.arrow_forward_ios,
        //       color: Colors.black87,
        //       size: 15,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
