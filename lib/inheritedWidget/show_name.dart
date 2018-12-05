

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inheritedWidget/name_handler.dart';
import 'package:flutter_app/inheritedWidget/name_provider.dart';

class ShowName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NameHandler nameHandler = NameProvider.of(context).nameHandler;
    return Center (
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(nameHandler.name.toString()),
      ),
    );
  }

}