import 'package:flutter/material.dart';
import 'package:flutter_app/profile/ProfileData.dart';
import 'package:flutter_app/profile/ProfileDetailsList.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(left:10.0, right: 10.0, top: 210.0, bottom: 210.0),
      child: Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(), borderRadius: BorderRadius.circular(10.0)),
          elevation: 5.0,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ProfileData(),
            ),
          )),
    ));
  }
}
