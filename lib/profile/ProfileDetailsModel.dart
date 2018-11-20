import 'package:flutter/material.dart';

class ProfileDetailsModel {
  final IconData icon;
  final String title;
  final int count;
  const ProfileDetailsModel(this.icon, this.title, this.count)
      : assert(icon != null),
        assert(title != null),
        assert(count != null);
}
