import 'package:flutter/material.dart';
import 'package:flutter_app/listWidgets/UserDetailsModel.dart';
import 'package:flutter_app/profile/ProfileDetailsComponent.dart';
import 'package:flutter_app/profile/ProfileDetailsModel.dart';
//import 'ProfileDetailsList.dart';

class ProfileData extends StatelessWidget {
  static const titleList = <String>["Clubs", "Rewards", "Deals"];

  static const counts = <int>[1, 1, 1];

  final UserDetailsModel userDetailsModel;

  const ProfileData(this.userDetailsModel) : assert (userDetailsModel != null);

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
                          userDetailsModel.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 10.0),
                        child: Text(
                          userDetailsModel.clubDetails,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          userDetailsModel.moneySaved,
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
                    model : ProfileDetailsModel(iconList[0],
                        titleList[0],
                        counts[0]),
                  ),
                  ProfileDetailsComponent(
                    model : ProfileDetailsModel(iconList[1],
                     titleList[1],
                     counts[1]),
                  ),
                  ProfileDetailsComponent(
                    model : ProfileDetailsModel(iconList[2],
                     titleList[2],
                     counts[2]),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
