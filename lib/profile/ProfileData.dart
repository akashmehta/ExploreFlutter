import 'package:flutter/material.dart';
import 'package:flutter_app/profile/ProfileDetailsComponent.dart';
//import 'ProfileDetailsList.dart';

class ProfileData extends StatelessWidget {
  static const titleList = <String>["Clubs", "Rewards", "Deals"];

  static const counts = <int>[1, 1, 1];

  static const iconList = <IconData>[
    Icons.widgets,
    Icons.airline_seat_individual_suite,
    Icons.accessibility
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500.0,
        width: 500.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10.0),
                        child: Text(
                          "Aakash Mehta",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 10.0),
                        child: Text(
                          "3 visits to club",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Rs. 0 saved",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/aakash.jpg"),
                              alignment: Alignment.topRight)),
                    ),
                  )
                ]),
              ],
            ),
//        ProfileDetailsList()
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ProfileDetailsComponent(
                    icon: iconList[0],
                    title: titleList[0],
                    count: counts[0],
                  ),
                  ProfileDetailsComponent(
                    icon: iconList[1],
                    title: titleList[1],
                    count: counts[1],
                  ),
                  ProfileDetailsComponent(
                    icon: iconList[2],
                    title: titleList[2],
                    count: counts[2],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
