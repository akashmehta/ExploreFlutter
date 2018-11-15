import 'package:flutter/material.dart';

class CustomWidgetRow extends StatelessWidget {
  static const _borderRadius = BorderRadius.all(Radius.circular(10.0));
  static const _rowHeight = 100.0;
  static const _padding = 8.0;
  static const _iconSize = 60.0;
  static const _fontSize = 24.0;
  static const _iconRightPadding = 16.0;
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
          child: InkWell(
              borderRadius: _borderRadius,
              highlightColor: Colors.amberAccent,
              splashColor: Colors.greenAccent,
              onTap: () {
                print("Item is clicked");
              },
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: _iconRightPadding),
                      child: Icon(Icons.cake,
                        size: _iconSize,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Hello",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _fontSize
                        ),
                      ),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}
