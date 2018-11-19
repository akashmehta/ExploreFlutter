import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Text(
                        "Aakash Mehta",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 10.0),
                      child: Text(
                        "3 visits to club",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Rs. 0 saved",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child : Container(
                    alignment: Alignment.topRight,
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("images/aakash.jpg"),
                            alignment: Alignment.topRight)
                    ),
                  ),
                )
              ]),
            ],
          )
        ],
      )

    );
  }
}
