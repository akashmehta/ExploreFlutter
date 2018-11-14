import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(IntentApp());

class IntentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SamplePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body:SampleRactangle(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SampleRactangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.greenAccent,
        height: 400.0,
        width: 300.0,
        child: Padding(padding: EdgeInsets.all(10.0), child: Text("Hi", textAlign: TextAlign.center, style: TextStyle(fontSize: 40.0),),),
      ),
    );
  }

}

class SamplePage extends StatefulWidget {
  SamplePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SamplePage> {
  static const platform = const MethodChannel("app.channel.shared.data");
  String dataShared = "no data";

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(dataShared),
      ),
    );
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
