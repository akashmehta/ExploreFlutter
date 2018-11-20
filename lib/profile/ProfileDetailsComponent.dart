import 'package:flutter/material.dart';

class ProfileDetailsComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final _rowHeight = 100.0;

  final color = Colors.green;

  const ProfileDetailsComponent(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.count})
      : assert(icon != null),
        assert(title != null),
        assert(count != null),
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
                    Icon(icon),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        title,
                        style: TextStyle(color: Color.fromARGB(155, 0, 0, 0)),
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ))),
      ),
    );
  }
}
