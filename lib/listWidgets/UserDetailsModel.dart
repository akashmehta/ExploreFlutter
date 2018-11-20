import 'package:flutter/material.dart';

class UserDetailsModel {
  final String name;
  final String clubDetails;
  final String moneySaved;
  final Color color;

  const UserDetailsModel(
      this.name, this.clubDetails, this.moneySaved, this.color)
      : assert(name != null),
        assert(clubDetails != null),
        assert(moneySaved != null),
        assert(color != null);
}
