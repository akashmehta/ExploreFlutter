import 'package:flutter/material.dart';
import 'ProfileDetailsComponent.dart';

class ProfileDetailsList extends StatelessWidget {
  static const titleList = <String>[
    "Clubs",
    "Rewards",
    "Deals",
    "Clubs",
    "Rewards",
    "Deals",
    "Clubs",
    "Rewards",
    "Deals",
    "Rewards",
    "Deals"
  ];

  static const counts = <int>[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  static const _verticalPadding = 10.0;

  static const iconList = <IconData>[
    Icons.widgets,
    Icons.airline_seat_individual_suite,
    Icons.widgets,
    Icons.airline_seat_individual_suite,
    Icons.widgets,
    Icons.airline_seat_individual_suite,
    Icons.widgets,
    Icons.airline_seat_individual_suite,
    Icons.widgets,
    Icons.airline_seat_individual_suite,
    Icons.accessibility
  ];

  @override
  Widget build(BuildContext context) {
    final widgetList = <ProfileDetailsComponent>[];
    for (int i = 0; i < titleList.length; i++) {
      widgetList.add(ProfileDetailsComponent(
          icon: iconList[i], title: titleList[i], count: counts[i]));
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
