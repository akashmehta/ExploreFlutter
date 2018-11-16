import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
