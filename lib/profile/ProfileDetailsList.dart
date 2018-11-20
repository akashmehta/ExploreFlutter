import 'package:flutter/material.dart';
import 'ProfileDetailsComponent.dart';
import 'ProfileDetailsModel.dart';

class ProfileDetailsList extends StatelessWidget {

  static const _verticalPadding = 10.0;

  final profileModels = <ProfileDetailsModel>[
    ProfileDetailsModel(Icons.widgets, "Clubs", 1),
    ProfileDetailsModel(Icons.airline_seat_individual_suite, "Rewards", 1),
    ProfileDetailsModel(Icons.widgets, "Deals", 1),
    ProfileDetailsModel(Icons.airline_seat_individual_suite, "Clubs", 1),
    ProfileDetailsModel(Icons.widgets, "Rewards", 1),
    ProfileDetailsModel(Icons.airline_seat_individual_suite, "Deals", 1),
    ProfileDetailsModel(Icons.widgets, "Clubs", 1),
    ProfileDetailsModel(Icons.airline_seat_individual_suite, "Rewards", 1),
    ProfileDetailsModel(Icons.widgets, "Deals", 1),
    ProfileDetailsModel(Icons.airline_seat_individual_suite, "Rewards", 1),
    ProfileDetailsModel(Icons.accessibility, "Deals",1)
  ];

  @override
  Widget build(BuildContext context) {
    final widgetList = <ProfileDetailsComponent>[];
    for (int i = 0; i < profileModels.length; i++) {
      widgetList.add(ProfileDetailsComponent(model: profileModels[i]));
    }
    var _listView = ListView.builder(

      itemBuilder: (BuildContext context, int position) => widgetList[position],
      itemCount: widgetList.length,
      scrollDirection: Axis.horizontal,
    );

    var _body = Container(
      height: 100.0,
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: _listView,
    );
    return _body;
  }
}
