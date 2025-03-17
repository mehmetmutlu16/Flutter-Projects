import 'package:flutter/material.dart';

class restaurant_info extends StatelessWidget {
  const restaurant_info({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mutlu Bakery & Cafe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$\$ - Chinese, American, Turkish Food",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    "4.3",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 16,
                    ),
                  ),
                  Text(
                    "200+ Ratings",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      Text(
                        "FREE",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Delivery",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.watch_later,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      Text(
                        "25",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Minutes",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.green, width: 2),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
                    ),
                  ),
                  child: Text("Take Away"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
