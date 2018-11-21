import 'package:flutter/material.dart';
import 'package:flutter_app/listWidgets/UserDetailsModel.dart';
import 'package:flutter_app/profile/ProfileData.dart';
class ProfileCard extends StatefulWidget {
  final UserDetailsModel userDetailsModel;

  const ProfileCard(this.userDetailsModel) : assert(userDetailsModel != null);

  @override
  State<StatefulWidget> createState() => _ProfileCard();
}

class _ProfileCard extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: 10.0, right: 10.0, top: 170.0, bottom: 170.0),
          child: Material(
              shape: RoundedRectangleBorder(
                  side: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ProfileData(widget.userDetailsModel),
                ),
              )),
        ));
  }

}
