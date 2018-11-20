import 'package:flutter/material.dart';
import 'package:flutter_app/listWidgets/UserDetailsModel.dart';
import 'package:flutter_app/profile/ProfileCard.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);
final _padding = EdgeInsets.all(10.0);
final _textSize = 60.0;

class ItemComponent extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData icon;
  final int position;

  const ItemComponent(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.icon,
      @required this.position})
      : assert(name != null),
        assert(color != null),
        assert(icon != null),
        assert(position != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          height: _rowHeight,
          child: InkWell(
              borderRadius: _borderRadius,
              splashColor: color,
              highlightColor: color,
              onTap: () {
                _navigateToProfileDetailsScreen(
                    context,
                    UserDetailsModel("User $position", "$position club",
                        "$position ponints", color));
              },
              child: Padding(
                padding: _padding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: _padding,
                      child: Icon(
                        icon,
                        size: _textSize,
                      ),
                    ),
                    Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}

void _navigateToProfileDetailsScreen(
    BuildContext context, UserDetailsModel userModel) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: userModel.color,
        title: Text("${userModel.name}"),
      ),
      body: ProfileCard(userModel),
    );
  }));
}
