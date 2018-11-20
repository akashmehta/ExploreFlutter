import 'package:flutter/material.dart';
import 'package:flutter_app/profile/ProfileDetailsModel.dart';

class ProfileDetailsComponent extends StatelessWidget {
  final ProfileDetailsModel model;
  final _rowHeight = 100.0;

  final color = Colors.green;

  const ProfileDetailsComponent(
      {Key key,
      @required this.model})
      : assert(model != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
            borderRadius: BorderRadius.circular(5.0),
            highlightColor: color,
            splashColor: color,
            onTap: () {
              print("Item is tapped");
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Icon(model.icon),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        model.title,
                        style: TextStyle(color: Color.fromARGB(155, 0, 0, 0)),
                      ),
                    ),
                    Text(
                      model.count.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ))),
      ),
    );
  }
}
