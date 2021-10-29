import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Berlin Postleitzahl'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static List<int> listName = [
    149,
    12274,
    12277,
    12279,
    12305,
    12307,
    12309,
    12043,
    12045,
    12047,
    12049,
    12051,
    12053,
    12055,
    12057,
    12059,
    12107,
    12109,
    12347,
    12349,
    12351,
    12353,
    12355,
    12357,
    12359,
    12247,
    12249,
    12099,
    12101,
    12103,
    12105,
    1215,
    1216,
    1220,
    141
  ];
  final listLength = listName.length;
  var rng = Random();
  int _zipCode = 0;
  String _message = "";

  void _randomCode() {
    setState(() {
      // for (var i = 0; i < listLength; i++) {
      // print(listName[rng.nextInt(listLength)]);
      // }
      _zipCode = listName[rng.nextInt(listLength)];

      if (_zipCode == 149 ||
          (_zipCode >= 12274 && _zipCode <= 12279) ||
          (_zipCode >= 12305 && _zipCode <= 12309)) {
        _message = "UNTEN";
        return;
      }
      if ((_zipCode >= 12043 && _zipCode <= 12059) ||
          _zipCode == 12107 ||
          _zipCode == 12109 ||
          (_zipCode >= 12347 && _zipCode <= 12359)) {
        _message = "MITTE";
        return;
      }
      _message = "OBEN";
      return;
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   '${_message}',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Text(
              // '$_counter',
              '$_zipCode - $_message',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomCode,
        tooltip: 'Next',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
